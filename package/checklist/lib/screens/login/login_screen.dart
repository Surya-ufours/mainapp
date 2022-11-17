import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helpers/colors.dart';

import 'package:i2iutils/widgets/boxedittext.dart';
import 'package:i2iutils/widgets/button.dart';

import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: colorPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
            child: Image.asset(
              'assets/banner.png',
              width: Get.width,
              height: Get.height * 0.32,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0, -30, 0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Column(
              children: <Widget>[
                Container(
                  transform: Matrix4.translationValues(0, -25, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(color: colorPrimary, blurRadius: 2)
                      ]),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 60,
                    width: 60,
                    // color: Colors.red,
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(0, -15, 0),
                  child: const Text(
                    'greenChklst',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      BoxEditText(
                        placeholder: 'Email Id',
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Icon(
                              Icons.person,
                              size: 13,
                            )),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Obx(
                        () => BoxEditText(
                          placeholder: 'Password',
                          controller: controller.passwordController,

                          obsecureText: !controller.isPasswordVisible.value,
                          prefixIcon: const Padding(
                              padding: EdgeInsets.all(12),
                              child: Icon(
                                Icons.password,
                                size: 13,
                              )),
                          suffixIcon: InkWell(
                            onTap: () {
                              controller.isPasswordVisible(
                                  !controller.isPasswordVisible.value);
                            },
                            child: Icon(
                              controller.isPasswordVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 13,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: <Widget>[
                          Obx(() {
                            return Checkbox(
                              value: controller.isRememberMe.value,
                              activeColor: colorPrimary,
                              onChanged: (val) {
                                controller.isRememberMe(val);
                              },
                            );
                          }),
                          GestureDetector(
                            onTap: () {
                              controller.isRememberMe(
                                  !controller.isRememberMe.value);
                            },
                            child: const Text(
                              'Remember me',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black87),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Obx(() => CustomButton(
                          width: 150,
                          buttonText: 'Login',
                          isLoading: controller.isLoading.value,
                          onPressed: () => controller.checkLogin())),
                      const SizedBox(
                        height: 32,
                      ),
                      Obx(
                        () => Text(
                          '${controller.appVersion}\nwww.i2isoftwares.com\n©2022.All rights reserved',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
