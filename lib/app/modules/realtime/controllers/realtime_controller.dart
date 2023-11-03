import 'package:apitronik_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class RealtimeController extends GetxController {
  var buttonOnPressed = true.obs;
  var sensorData = {}.obs;
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  List<String> history = [];
  bool gasDetected = false;
  bool smokeDetected = false;
  bool gasNotificationSent = false;
  bool smokeNotificationSent = false;

  @override
  void onInit() async {
    super.onInit();
    // Inisialisasi Firebase Database reference
    DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
    DatabaseReference historyRef = FirebaseDatabase.instance.ref('history');
    // Tambahkan listener untuk data database
    databaseRef.onValue.listen((event) async {
      final dynamic value = event.snapshot.value;
      if (value != null && value is Map) {
        sensorData.value = Map<String, dynamic>.from(value);
        if (sensorData['dht11'] != null &&
            sensorData['dht11']['temp'] != null &&
            sensorData['dht11']['temp'] >= 30) {
          final suhu = sensorData['dht11']['temp'];
          final timestamp = DateTime.now();
          final timestampString = timestamp.toIso8601String();
          final message = 'Suhu mencapai $suhu derajat';
          final existingData =
              await historyRef.orderByChild('temp').equalTo(suhu).once();
          if (existingData.snapshot.value == null) {
            // Tidak ada data dengan suhu yang sama, tambahkan notifikasi baru
            final newHistoryRef = historyRef.push();
            newHistoryRef.set({
              'message': message,
              'temp': suhu,
              'timestamp': timestampString,
            });
            showNotification('Peringatan!', 'Suhu mencapai $suhu derajat');
          }
        } else if (sensorData['mq-2'] != null &&
            sensorData['mq-2']['lpg'] != null &&
            sensorData['mq-2']['lpg'] > 0) {
          final gas = sensorData['mq-2']['lpg'];
          final timestamp = DateTime.now().millisecondsSinceEpoch;
          const messageGas = 'Gas terdeteksi !';
          if (!gasNotificationSent && !gasDetected) {
            final existingDataGas =
                await historyRef.orderByChild('lpg').equalTo(gas).once();
            if (existingDataGas.snapshot.value == null) {
              final newHistoryRefGas = historyRef.push();
              newHistoryRefGas.set({
                'message': messageGas,
                'timestamp': timestamp,
              });
              showNotification('Peringatan!', 'Gas terdeteksi');
            }
            gasDetected = true;
            gasNotificationSent = true;
          } else {
            gasDetected = false;
            gasNotificationSent = false;
          }
        } else if (sensorData['mq-2'] != null &&
            sensorData['mq-2']['smoke'] != null &&
            sensorData['mq-2']['smoke'] > 0) {
          final smoke = sensorData['mq-2']['smoke'];
          final timestamp = DateTime.now().millisecondsSinceEpoch;
          const messageSmoke = 'Asap terdeteksi !';
          if (!smokeNotificationSent && !smokeDetected) {
            final existingDataSmoke =
                await historyRef.orderByChild('smoke').equalTo(smoke).once();
            if (existingDataSmoke.snapshot.value == null) {
              final newHistoryRefSmoke = historyRef.push();
              newHistoryRefSmoke.set({
                'message': messageSmoke,
                'timestamp': timestamp,
              });
              showNotification('Peringatan!', 'Asap terdeteksi');
            }
            smokeDetected = true;
            smokeNotificationSent = true;
          } else {
            smokeDetected = false;
            smokeNotificationSent = false;
          }
        }
      }
    });
  }

  Future<void> showNotification(String title, String body) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_id', 'channel_name',
        importance: Importance.max, priority: Priority.high, icon: 'app_icon');
    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
        0, title, body, platformChannelSpecifics,
        payload: 'showNotification');

    flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('app_icon'),
        ),
        onDidReceiveNotificationResponse: (NotificationResponse payload) async {
      if (payload.payload == 'showNotification') {
        Get.toNamed(Routes.CALL);
      }
    });
  }
}
