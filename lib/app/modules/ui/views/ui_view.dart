import 'package:apitronik_app/app/modules/logout/controllers/logout_controller.dart';
import 'package:apitronik_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../controllers/ui_controller.dart';

// ignore: must_be_immutable
class UiView extends GetView<UiController> {
  UiView({Key? key}) : super(key: key);
  DateTime? currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: WillPopScope(
          onWillPop: () async {
            if (currentBackPressTime == null ||
                DateTime.now().difference(currentBackPressTime!) >
                    const Duration(seconds: 2)) {
              currentBackPressTime = DateTime.now();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Tekan sekali lagi untuk keluar'),
                ),
              );
              return false;
            }
            return true;
          },
          child: LayoutBuilder(builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;
            return Column(
              children: [
                Container(
                  width: screenWidth * 1,
                  height: screenHeight * 0.33,
                  decoration: const BoxDecoration(color: Color(0xFFB60000)),
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.09),
                    child: Column(
                      children: [
                        const Image(
                            image: AssetImage('assets/images/logo.png')),
                        Container(
                          width: screenWidth * 0.92,
                          height: screenHeight * 0.07,
                          margin: EdgeInsets.only(top: screenHeight * 0.09),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Hi, ${SpUtil.getString("name")}',
                                    style:
                                        const TextStyle(fontFamily: 'Lexend')),
                                PopupMenuButton<String>(
                                  offset: Offset(
                                      screenWidth * 0, screenHeight * 0.05),
                                  icon: Row(children: [
                                    const Expanded(
                                      child: Icon(Icons.person),
                                    ),
                                    Expanded(
                                      child: Icon(controller.isDropdownOpen
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down),
                                    ),
                                  ]),
                                  onCanceled: () {
                                    controller.isDropdownOpen = false;
                                  },
                                  onOpened: () {
                                    controller.isDropdownOpen = true;
                                  },
                                  onSelected: (value) {
                                    if (value == 'logout') {
                                      Get.put(LogoutController());
                                      final logoutController =
                                          Get.find<LogoutController>();
                                      logoutController.logout();
                                      controller.isDropdownOpen = false;
                                    }
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<String>>[
                                    PopupMenuItem<String>(
                                      value: 'logout',
                                      child: SizedBox(
                                        width: screenWidth * 0.3,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: screenWidth * 0.02,
                                                  right: screenWidth * 0.082),
                                              child: const Text(
                                                'Logout',
                                                style: TextStyle(
                                                    fontFamily: 'Lexend',
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w200),
                                              ),
                                            ),
                                            const Icon(Icons.logout),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                                // const Image(image: AssetImage('assets/images/foto.png'))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.03),
                  child: const Text(
                    'MENU -----------------------',
                    style: TextStyle(
                        fontFamily: 'Lexend',
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.1,
                        right: screenWidth * 0.1,
                        top: screenHeight * 0.02),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: screenHeight * 0.025),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.REALTIME);
                                },
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Ink.image(
                                  image: const AssetImage(
                                      'assets/images/btn_realtime.png'),
                                  height: screenWidth * 0.385,
                                  width: screenWidth * 0.385,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.HISTORY);
                                },
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Ink.image(
                                  image: const AssetImage(
                                      'assets/images/history.png'),
                                  height: screenWidth * 0.385,
                                  width: screenWidth * 0.385,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.CALL);
                                },
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Ink.image(
                                  image: const AssetImage(
                                      'assets/images/btn_call.png'),
                                  height: screenWidth * 0.385,
                                  width: screenWidth * 0.385,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.ABOUT);
                                },
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Ink.image(
                                  image: const AssetImage(
                                      'assets/images/btn_about.png'),
                                  height: screenWidth * 0.385,
                                  width: screenWidth * 0.385,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          'Aplikasi Perlindungan Terpadu, Ramah, Otomatis, dan Nyaman Inklusi Kebakaran',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Lexend', fontSize: 15),
                        )
                      ],
                    ))
              ],
            );
          }),
        ));
  }
}
