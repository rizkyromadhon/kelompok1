import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Cek status login yang tersimpan di SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String initialRoute = _getInitialRoute(prefs);
  await SpUtil.getInstance();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Apitronik",
      initialRoute: initialRoute,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    ),
  );
}

String _getInitialRoute(SharedPreferences prefs) {
  // Baca status login dari SharedPreferences
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  if (isLoggedIn) {
    Future.delayed(const Duration(milliseconds: 100), () {
      Get.snackbar(
          "Hallo", "Selamat datang kembali ${SpUtil.getString("name")}",
          backgroundColor: Colors.white,
          margin: const EdgeInsets.only(top: 20),
          maxWidth: 300);
    });
  }

  // Tentukan rute awal berdasarkan status login
  return isLoggedIn ? Routes.UI : Routes.LOGIN;
}
