import 'package:apitronik_app/app/data/register_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:apitronik_app/app/routes/app_pages.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sp_util/sp_util.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void auth() {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Nama, Email dan Password tidak boleh kosong",
          backgroundColor: Colors.white,
          margin: const EdgeInsets.only(top: 20),
          maxWidth: 300);
    } else {
      EasyLoading.show();
      var data = {
        "name": name,
        "email": email,
        "password": password,
      };
      RegisterProvider().auth(data).then((value) {
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
        var success = responseBody['success']; // Tambahkan validasi ini
        if (success != null && success == true) {
          var data = responseBody['data'];
          if (data != null && data['name'] != null) {
            SpUtil.putString('name', data['name']);
          }
          if (data != null && data['token'] != null) {
            SpUtil.putString('token', data['token']);
          }
          Get.snackbar("Success", "Registrasi Berhasil",
              backgroundColor: Colors.white,
              margin: const EdgeInsets.only(top: 20),
              maxWidth: 300);
          Get.toNamed(Routes.LOGIN);
        } else {
          var message = responseBody['message'];
          if (message != null && message == 'User telah terdaftar') {
            // Pesan khusus jika user telah terdaftar sebelumnya
            Get.snackbar("Error", "User telah terdaftar sebelumnya",
                backgroundColor: Colors.white,
                margin: const EdgeInsets.only(top: 20),
                maxWidth: 300);
          } else {
            Get.snackbar("Error", "Registrasi Gagal",
                backgroundColor: Colors.white,
                margin: const EdgeInsets.only(top: 20),
                maxWidth: 300);
          }
        }
        EasyLoading.dismiss();
      });
    }
  }

  var showPassword = true.obs;
}
