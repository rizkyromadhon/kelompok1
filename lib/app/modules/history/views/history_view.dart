import 'package:apitronik_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import '../controllers/history_controller.dart';

// ignore: must_be_immutable
class HistoryView extends GetView<HistoryController> {
  HistoryView({Key? key}) : super(key: key);
  final DatabaseReference historyRef = FirebaseDatabase.instance.ref();
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
                    width: 40,
                  ),
                  const Text(
                    'Histori Sensor',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend',
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const Image(
                    image: AssetImage('assets/images/history_icon.png'),
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
          return Column(
            children: [
              Center(
                  child: Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.6,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    const Center(
                        child: Text(
                      'Histori Sensor',
                      style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )),
                    Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.025,
                            top: screenHeight * 0.02),
                        child: Obx(() {
                          if (controller.historyData.isEmpty) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: screenHeight * 0.21,
                              ),
                              child: const Center(
                                child: Text('Tidak ada data histori',
                                    style: TextStyle(
                                        fontFamily: 'Lexend',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                              ),
                            );
                          } else {
                            return SizedBox(
                              height: screenHeight * 0.5,
                              child: StreamBuilder(
                                stream: historyRef.child('history').onValue,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    DataSnapshot data = snapshot.data!.snapshot;
                                    if (data.value != null) {
                                      Map<dynamic, dynamic> values =
                                          data.value as Map<dynamic, dynamic>;
                                      List<dynamic> historyList =
                                          values.values.toList();

                                      return ListView.builder(
                                        itemCount: historyList.length,
                                        itemBuilder: (context, index) {
                                          String message =
                                              historyList[index]['message'];
                                          int itemNumber = index + 1;
                                          return ListTile(
                                            title: Text(
                                              '$itemNumber. $message',
                                              style: const TextStyle(
                                                  fontFamily: 'Lexend',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return const Center(
                                        child: Text('Tidak ada data histori',
                                            style: TextStyle(
                                                fontFamily: 'Lexend',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16)),
                                      );
                                    }
                                  } else {
                                    // Menunggu data
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                            );
                          }
                        })),
                  ],
                ),
              )),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.28, top: screenHeight * 0.02),
                child: ElevatedButton(
                    onPressed: () {
                      _showAlertDialog(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFB90000)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      fixedSize: MaterialStateProperty.all<Size>(
                          Size(screenWidth * 0.6, screenHeight * 0.08)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bersihkan Histori Sensor',
                          style: TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: screenHeight * 0.14,
              ),
              const Image(image: AssetImage('assets/images/logo.png'))
            ],
          );
        }));
  }
}

Future<void> clearHistory() async {
  EasyLoading.show();
  final DatabaseReference historyRef =
      FirebaseDatabase.instance.ref().child('history');
  await historyRef.remove();
  EasyLoading.dismiss();
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: const Text(
          'Peringatan',
          style: TextStyle(
              fontFamily: 'Lexend', fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'Apakah anda yakin ingin menghapus seluruh histori sensor?',
          style: TextStyle(
              fontFamily: 'Lexend', fontSize: 15, fontWeight: FontWeight.w300),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await clearHistory();
              Navigator.of(context).pop();
              const snackBar =
                  SnackBar(content: Text('Histori Berhasil dihapus'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text(
              'Hapus',
              style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Lexend',
                  fontSize: 15,
                  fontWeight: FontWeight.w300),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Menutup modal peringatan
            },
            child: const Text(
              'Batal',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lexend',
                  fontSize: 15,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      );
    },
  );
}
