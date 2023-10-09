import 'package:apitronik_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ui_controller.dart';

class UiView extends GetView<UiController> {
  const UiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: 428,
              height: 247,
              decoration: const BoxDecoration(color: Color(0xFFB60000)),
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Column(
                  children: [
                    const Image(image: AssetImage('assets/images/logo.png')),
                    Container(
                      width: 330,
                      height: 54,
                      margin: const EdgeInsets.only(top: 62),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Hi, Rizky Romadhon',
                                style: TextStyle(fontFamily: 'Lexend')),
                            PopupMenuButton<String>(
                              offset: const Offset(0, 40),
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
                                if (value == 'edit_profile') {
                                  const Text('Edit Profile');
                                  controller.isDropdownOpen = false;
                                } else if (value == 'logout') {
                                  const Text('Logout');
                                  controller.isDropdownOpen = false;
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<String>>[
                                const PopupMenuItem<String>(
                                  value: 'edit_profile',
                                  child: SizedBox(
                                    width: 120,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 3, right: 22),
                                          child: Text(
                                            'Edit Profil',
                                            style: TextStyle(
                                                fontFamily: 'Lexend',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w200),
                                          ),
                                        ),
                                        Icon(Icons.edit)
                                      ],
                                    ),
                                  ),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'logout',
                                  child: SizedBox(
                                    width: 120,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 3, right: 41),
                                          child: Text(
                                            'Logout',
                                            style: TextStyle(
                                                fontFamily: 'Lexend',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w200),
                                          ),
                                        ),
                                        Icon(Icons.logout),
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
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'MENU -----------------------',
                style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 36, right: 36, top: 12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
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
                              height: 138,
                              width: 138,
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
                              image:
                                  const AssetImage('assets/images/history.png'),
                              height: 138,
                              width: 138,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 90),
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
                              height: 138,
                              width: 138,
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
                              height: 138,
                              width: 138,
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
        ));
  }
}
