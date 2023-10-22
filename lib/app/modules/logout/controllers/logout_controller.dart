import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:apitronik_app/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutController extends GetxController {
  Future<void> logout() async {
    EasyLoading.show();
    SpUtil.remove('token');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Get.offAllNamed(Routes.LOGIN, arguments: 'Logout Berhasil');
    EasyLoading.dismiss();
  }
}
