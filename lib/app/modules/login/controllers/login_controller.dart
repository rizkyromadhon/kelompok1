import 'package:flutter/material.dart';
import 'package:apitronik_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginController extends GetxController {
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
      Get.snackbar("Success", "Login Berhasil",
          backgroundColor: Colors.white,
          margin: const EdgeInsets.only(top: 20),
          maxWidth: 300);
      Get.toNamed(Routes.UI);
    }
  }

  var isLoading = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var showPassword = true.obs;
}
