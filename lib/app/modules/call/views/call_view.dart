import 'package:apitronik_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:get/get.dart';

import '../controllers/call_controller.dart';

class CallView extends GetView<CallController> {
  const CallView({Key? key}) : super(key: key);
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
                  width: 25,
                ),
                const Text(
                  'Telepon Darurat',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Lexend',
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 25,
                ),
                const Image(
                  image: AssetImage('assets/images/phone.png'),
                  width: 36,
                  height: 36,
                )
              ],
            ),
          )),
          backgroundColor: Colors.white),
      body: LayoutBuilder(builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;
        return Column(children: [
          Center(
            child: Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.15,
              decoration: BoxDecoration(
                  color: const Color(0xFFB90000),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.02),
                      child: const Image(
                          image: AssetImage('assets/images/danger.png')),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: screenWidth * 0.02,
                          left: screenWidth * 0.02,
                          top: screenHeight * 0.010),
                      child: const Center(
                        child: Text(
                          'Telepon darurat hanya bisa digunakan jika terdeteksi kebakaran!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Lexend',
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          Opacity(
            opacity: controller.callFunction.value ? 1.0 : 0.4,
            child: ElevatedButton(
                onPressed: controller.callFunction.value
                    ? () async {
                        const phoneNumber = '110';

                        final uri = Uri(scheme: 'tel', path: phoneNumber);

                        if (await canLaunchUrl(uri)) {
                          await launchUrlString(uri.toString());
                        } else {
                          controller.logger
                              .d('Tidak dapat membuka aplikasi telepon');
                        }
                      }
                    : null,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFFFFFFF)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side:
                            const BorderSide(color: Colors.black54, width: 2)),
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                      Size(screenWidth * 0.9, screenHeight * 0.09)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Image(
                        width: 25,
                        height: 25,
                        image: AssetImage('assets/images/phone.png')),
                    SizedBox(
                      width: screenWidth * 0.07,
                    ),
                    const Text(
                      'Polisi',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Lexend',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: screenWidth * 0.435,
                    ),
                    const Text(
                      '110',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Lexend',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Opacity(
              opacity: controller.callFunction.value ? 1.0 : 0.4,
              child: ElevatedButton(
                  onPressed: controller.callFunction.value
                      ? () async {
                          const phoneNumber = '113';

                          final uri = Uri(scheme: 'tel', path: phoneNumber);

                          if (await canLaunchUrl(uri)) {
                            await launchUrlString(uri.toString());
                          } else {
                            controller.logger
                                .d('Tidak dapat membuka aplikasi telepon');
                          }
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFFFFFFF)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black54, width: 2),
                      ),
                    ),
                    fixedSize: MaterialStateProperty.all<Size>(
                        Size(screenWidth * 0.9, screenHeight * 0.09)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Image(
                          width: 25,
                          height: 25,
                          image: AssetImage('assets/images/phone.png')),
                      SizedBox(
                        width: screenWidth * 0.07,
                      ),
                      const Text(
                        'Pemadam Kebakaran',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lexend',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: screenWidth * 0.08,
                      ),
                      const Text(
                        '113',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lexend',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Opacity(
              opacity: controller.callFunction.value ? 1.0 : 0.4,
              child: ElevatedButton(
                  onPressed: controller.callFunction.value
                      ? () async {
                          const phoneNumber = '119';

                          final uri = Uri(scheme: 'tel', path: phoneNumber);

                          if (await canLaunchUrl(uri)) {
                            await launchUrlString(uri.toString());
                          } else {
                            controller.logger
                                .d('Tidak dapat membuka aplikasi telepon');
                          }
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFFFFFFF)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black54, width: 2),
                      ),
                    ),
                    fixedSize: MaterialStateProperty.all<Size>(
                        Size(screenWidth * 0.9, screenHeight * 0.09)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Image(
                          width: 25,
                          height: 25,
                          image: AssetImage('assets/images/phone.png')),
                      SizedBox(
                        width: screenWidth * 0.07,
                      ),
                      const Text(
                        'Ambulan',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lexend',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: screenWidth * 0.35,
                      ),
                      const Text(
                        '119',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lexend',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.32,
          ),
          const Image(image: AssetImage('assets/images/logo.png'))
        ]);
      }),
    );
  }
}
