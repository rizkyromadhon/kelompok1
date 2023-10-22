import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class RealtimeController extends GetxController {
  var buttonOnPressed = true.obs;
  var sensorData = {}.obs;
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  List<String> history = [];
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
          final timestamp = DateTime.now().millisecondsSinceEpoch;
          final message = 'Suhu mencapai $suhu derajat';
          final existingData =
              await historyRef.orderByChild('temp').equalTo(suhu).once();
          if (existingData.snapshot.value == null) {
            // Tidak ada data dengan suhu yang sama, tambahkan notifikasi baru
            final newHistoryRef = historyRef.push();
            newHistoryRef.set({
              'message': message,
              'temp': suhu,
              'timestamp': timestamp,
            });

            // Selanjutnya, tampilkan notifikasi jika perlu
            showNotification('Peringatan!', 'Suhu mencapai $suhu derajat');
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
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }
}
