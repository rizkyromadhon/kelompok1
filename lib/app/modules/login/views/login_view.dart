import 'package:apitronik_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB60000),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Selamat datang di Aplikasi',
                  style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Image(image: AssetImage('assets/images/logo.png')),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      Container(
                        width: 320,
                        height: 305,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 15, left: 15),
                          child: Column(children: [
                            const Text(
                              "Silahkan Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Lexend',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: 313,
                              height: 52,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFEBEBEB),
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextFormField(
                                controller: controller.emailController,
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(17),
                                    border: InputBorder.none,
                                    hintText: 'Masukkan Email anda',
                                    hintStyle: TextStyle(
                                        color: Color(0xFF777777),
                                        fontFamily: 'Lexend',
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ),
                            Obx(
                              () => Container(
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 0),
                                width: 313,
                                height: 52,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFEBEBEB),
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextFormField(
                                  controller: controller.passwordController,
                                  obscureText: controller.showPassword.value,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(17),
                                      border: InputBorder.none,
                                      hintText: 'Masukkan Password anda',
                                      suffixIcon: IconButton(
                                        icon: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: Icon(
                                            controller.showPassword.value
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        onPressed: () {
                                          controller.showPassword.value =
                                              !controller.showPassword.value;
                                        },
                                      ),
                                      hintStyle: const TextStyle(
                                          color: Color(0xFF777777),
                                          fontFamily: 'Lexend',
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  controller.auth();
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFFB90000)),
                                    fixedSize: MaterialStateProperty.all(
                                        const Size(250, 38))),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Login',
                                      style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Belum Punya akun?',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Lexend',
                                        fontWeight: FontWeight.w100),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.REGISTER);
                                    },
                                    child: const Text(
                                      'Daftar',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Lexend',
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
