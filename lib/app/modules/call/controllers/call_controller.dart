import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:firebase_database/firebase_database.dart';

class CallController extends GetxController {
  var logger = Logger();
  var callFunction = false.obs;

  @override
  void onInit() async {
    super.onInit();
    DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
    databaseRef.onValue.listen((event) {
      final dynamic value = event.snapshot.value;
      if (value != null && value is Map) {
        final temp = value['dht11']['temp'] ?? 0.0;
        updateCallFunction(temp);
      }
    });
  }

  void updateCallFunction(temp) {
    if (temp > 30) {
      callFunction.value = true;
    } else {
      callFunction.value = false;
    }
  }
}
