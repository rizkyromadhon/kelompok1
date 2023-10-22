import 'package:apitronik_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFB60000),
      body: LayoutBuilder(builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;
        return Padding(
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
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const Image(image: AssetImage('assets/images/logo.png')),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Form(
                    key: controller.formKeyRegister,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: screenHeight * 0.03,
                                right: screenWidth * 0.03,
                                left: screenWidth * 0.03),
                            child: Column(children: [
                              const Text(
                                "Silahkan Registrasi",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Lexend',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: screenWidth * 0.8,
                                height: screenHeight * 0.07,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFEBEBEB),
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextFormField(
                                  controller: controller.nameController,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(17),
                                      border: InputBorder.none,
                                      hintText: 'Masukkan Nama Lengkap anda',
                                      hintStyle: TextStyle(
                                          color: Color(0xFF777777),
                                          fontFamily: 'Lexend',
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: screenWidth * 0.8,
                                height: screenHeight * 0.07,
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
                                  width: screenWidth * 0.8,
                                  height: screenHeight * 0.07,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFEBEBEB),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: TextFormField(
                                    controller: controller.passwordController,
                                    obscureText: controller.showPassword.value,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(17),
                                        border: InputBorder.none,
                                        hintText: 'Masukkan Password anda',
                                        suffixIcon: IconButton(
                                          icon: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
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
                                      fixedSize: MaterialStateProperty.all(Size(
                                          screenWidth * 0.7,
                                          screenHeight * 0.05))),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Daftar',
                                        style: TextStyle(
                                            fontFamily: 'Lexend',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: EdgeInsets.all(screenHeight * 0.01),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Sudah mempunyai akun?',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Lexend',
                                          fontWeight: FontWeight.w100),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.01,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.offAllNamed(Routes.LOGIN);
                                      },
                                      child: const Text(
                                        'Login',
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
            ));
      }),
    );
  }
}
