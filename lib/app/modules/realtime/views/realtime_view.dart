import 'package:apitronik_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/realtime_controller.dart';

class RealtimeView extends GetView<RealtimeController> {
  final RealtimeController realtimeController = Get.put(RealtimeController());
  RealtimeView({Key? key}) : super(key: key);
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
                      Get.offNamed(Routes.UI);
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
                  'Realtime Sensor',
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
                  image: AssetImage('assets/images/temp.png'),
                  width: 36,
                  height: 36,
                )
              ],
            ),
          )),
          backgroundColor: Colors.white),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;
          return Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.22,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image(
                              image:
                                  const AssetImage('assets/images/dht11.png'),
                              height: screenHeight * 0.165,
                              width: screenWidth * 0.2,
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            const Text(
                              'Sensor DHT11 (Suhu)',
                              style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        SizedBox(
                          width: screenWidth * 0.04,
                        ),
                        Container(
                          color: Colors.transparent,
                          width: screenWidth * 0.45,
                          height: screenHeight * 0.5,
                          child: Obx(() {
                            if (realtimeController.sensorData.isEmpty) {
                              return Padding(
                                padding:
                                    EdgeInsets.only(top: screenHeight * 0.07),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Suhu : 0 °C',
                                      style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'Kelembaban : 0 %',
                                      style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return Padding(
                                padding:
                                    EdgeInsets.only(top: screenHeight * 0.07),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Suhu : ${realtimeController.sensorData['dht11']['temp']} °C',
                                      style: const TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'Kelembaban : ${realtimeController.sensorData['dht11']['humidity']} %',
                                      style: const TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              );
                            }
                          }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.03),
                  child: Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.22,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.02),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Image(
                                    image: const AssetImage(
                                        'assets/images/mq2.png'),
                                    height: screenHeight * 0.160,
                                    width: screenWidth * 0.2,
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  const Text(
                                    'Sensor MQ-2 (Asap/Gas)',
                                    style: TextStyle(
                                        fontFamily: 'Lexend',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: screenWidth * 0.02,
                              ),
                              Container(
                                color: Colors.transparent,
                                width: screenWidth * 0.45,
                                height: screenHeight * 0.5,
                                child: Obx(() {
                                  if (realtimeController.sensorData.isEmpty) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.07),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Gas : 0 ppm',
                                            style: TextStyle(
                                                fontFamily: 'Lexend',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Asap : 0 ppm',
                                            style: TextStyle(
                                                fontFamily: 'Lexend',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.07),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Gas : ${realtimeController.sensorData['mq-2']['lpg']} ppm',
                                            style: const TextStyle(
                                                fontFamily: 'Lexend',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Asap : ${realtimeController.sensorData['mq-2']['smoke']} ppm',
                                            style: const TextStyle(
                                                fontFamily: 'Lexend',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                }),
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.38,
              ),
              const Image(image: AssetImage('assets/images/logo.png'))
            ],
          );
        },
      ),
    );
  }
}
