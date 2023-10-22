import 'package:apitronik_app/app/data/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:apitronik_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sp_util/sp_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void auth() {
    String email = emailController.text;
    String password = passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email dan Password tidak boleh kosong",
          backgroundColor: Colors.white,
          margin: const EdgeInsets.only(top: 20),
          maxWidth: 300);
    } else {
      EasyLoading.show();
      var data = {
        "email": email,
        "password": password,
      };
      LoginProvider().auth(data).then((value) async {
        // ignore: unnecessary_null_comparison
        if (value == null) {
          // Penanganan ketika respons API adalah null
          Get.snackbar("Error", "Login Gagal (Tidak ada respons dari server)",
              backgroundColor: Colors.white,
              margin: const EdgeInsets.only(top: 20),
              maxWidth: 300);
          EasyLoading.dismiss();
          return;
        }
        var responseBody = value.body;
        if (responseBody == null) {
          // Penanganan ketika responseBody adalah null
          Get.snackbar("Error", "Login Gagal (Tidak ada respons dari server)",
              backgroundColor: Colors.white,
              margin: const EdgeInsets.only(top: 20),
              maxWidth: 300);
          EasyLoading.dismiss();
          return;
        }
        var success = responseBody['success'];
        if (success != null && success == true) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
          await prefs.setBool('isLoggedIn', true);
          var data = responseBody['data'];
          if (data != null && data['name'] != null) {
            SpUtil.putString('name', data['name']);
          }
          if (data != null && data['token'] != null && isLoggedIn == true) {
            SpUtil.putString('token', data['token']);
          }
          Get.snackbar("Success", "Login Berhasil",
              backgroundColor: Colors.white,
              margin: const EdgeInsets.only(top: 20),
              maxWidth: 300);
          Get.offAllNamed(Routes.UI);
        } else {
          Get.snackbar("Error", "Login Gagal",
              backgroundColor: Colors.white,
              margin: const EdgeInsets.only(top: 20),
              maxWidth: 300);
        }
        EasyLoading.dismiss();
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    String? argument = Get.arguments;
    if (argument != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar("Success", argument,
            backgroundColor: Colors.white,
            margin: const EdgeInsets.only(top: 20),
            maxWidth: 300);
      });
    }
  }

  var showPassword = true.obs;
}
