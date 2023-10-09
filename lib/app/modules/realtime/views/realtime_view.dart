import 'package:apitronik_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/realtime_controller.dart';

class RealtimeView extends GetView<RealtimeController> {
  const RealtimeView({Key? key}) : super(key: key);
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
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              width: 330,
              height: 150,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/dht11.png'),
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Sensor DHT11 (Suhu)',
                            style: TextStyle(
                                fontFamily: 'Lexend',
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 28,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            'Temperature   20°C',
                            style: TextStyle(
                                fontFamily: 'Lexend',
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Kelembaban   20 %',
                            style: TextStyle(
                                fontFamily: 'Lexend',
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                width: 330,
                height: 150,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image(
                              image: AssetImage('assets/images/mq2.png'),
                              height: 100,
                              width: 100,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Sensor MQ-2 (Asap/Gas)',
                              style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Nilai sensor',
                                  style: TextStyle(
                                      fontFamily: 'Lexend',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 35, right: 20),
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        fontFamily: 'Lexend',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 95),
                              child: Text(
                                'Nilai sensor :',
                                style: TextStyle(
                                    fontFamily: 'Lexend',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 10),
                              child: Text(
                                '0 = Aman (tidak ada Asap/Gas)',
                                style: TextStyle(
                                    fontFamily: 'Lexend',
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 7),
                              child: Text(
                                '1 = Tidak Aman (Ada Asap/Gas)',
                                style: TextStyle(
                                    fontFamily: 'Lexend',
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(top: 45),
              child: ElevatedButton(
                  onPressed: () {
                    controller.buttonOnPressed.value =
                        !controller.buttonOnPressed.value;
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        controller.buttonOnPressed.value
                            ? Colors.green
                            : const Color(0xFFB90000)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    fixedSize:
                        MaterialStateProperty.all<Size>(const Size(310, 60)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.buttonOnPressed.value
                            ? 'Matikan Sensor'
                            : 'Nyalakan Sensor',
                        style: const TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ],
                  )),
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          const Image(image: AssetImage('assets/images/logo.png'))
        ],
      ),
    );
  }
}
