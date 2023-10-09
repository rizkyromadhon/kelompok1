import 'package:apitronik_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 120,
            elevation: 0,
            flexibleSpace: Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        Get.toNamed(Routes.UI);
                      },
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: const Icon(
                        Icons.arrow_back,
                        size: 36,
                      )),
                  const SizedBox(
                    width: 24,
                  ),
                  const Text(
                    'Tentang Aplikasi',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend',
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  const Image(
                    image: AssetImage('assets/images/about.png'),
                    width: 36,
                    height: 36,
                  )
                ],
              ),
            )),
            backgroundColor: Colors.white),
        body: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, right: 25, left: 25),
              child: Text(
                'Apitronik singkatan dari Aplikasi Perlindungan Terpadu, Ramah, Otomatis, dan Nyaman Inklusi Kebakaran. Aplikasi ini dibuat untuk membantu dan memudahkan seseorang memonitoring atau melihat kondisi suatu tempat. Misalnya IoT/Sensor diletakkan di dapur rumah, maka Sensor dapat mendeteksi kebakaran melalui Asap/Gas maupun melalui Suhu dan kelembaban.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, right: 15, left: 15),
              child: Text(
                'Aplikasi ini dibuat oleh :\n Mohammad Rizky Romadhon sebagai Leader,\n dan 3 orang anggota yaitu :\n 1. M. Riski Ardiansyah\n 2. Ardha Pria Prambudi\n 3. Amri Mursalina Darinto.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, right: 25, left: 25),
              child: Text(
                'Aplikasi ini mungkin jauh dari kata "sempurna", namun kami berusaha semaksimal mungkin untuk menjadikan aplikasi ini menjadi aplikasi yang bermanfaat untuk kita semua. Tetapi juga tetap berhati-hati, teknologi IoT seperti ini juga terdapat kelemahan contohnya jika tidak ada koneksi internet maka perangkat tidak akan berjalan/bekerja. Terimakasih.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 95,
            ),
            Image(image: AssetImage('assets/images/logo.png'))
          ],
        ));
  }
}
