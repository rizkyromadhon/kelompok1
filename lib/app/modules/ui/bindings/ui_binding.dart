import 'package:apitronik_app/app/modules/about/controllers/about_controller.dart';
import 'package:apitronik_app/app/modules/call/controllers/call_controller.dart';
import 'package:apitronik_app/app/modules/history/controllers/history_controller.dart';
import 'package:apitronik_app/app/modules/realtime/controllers/realtime_controller.dart';
import 'package:get/get.dart';

import '../controllers/ui_controller.dart';

class UiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UiController>(
      () => UiController(),
    );
    Get.put(RealtimeController());
    Get.put(HistoryController());
    Get.put(CallController());
    Get.put(AboutController());
  }
}
