/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/helpers/color.dart';
import 'package:helpdesk/helpers/hexcolor.dart';
import 'package:helpdesk/routes/main_app_routes.dart';
import 'package:helpdesk/widgets/button.dart';
import 'package:helpdesk/widgets/textfield.dart';

import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  final controller = Get.put(LoginController());

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => {
          Get.focusScope?.unfocus(),
        },
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: Get.width,
                  height: Get.height * 0.35,
                  color: colorPrimary,
                  child: Image.asset(
                    'assets/login_bg.png',
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
                            color: HexColor("BA1D15"),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: HexColor("BA1D15"), blurRadius: 2)
                            ]),
                        // padding: const EdgeInsets.only(top: 12,left: 8,right: 8),
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          'assets/app_logo.png',
                          height: 60,
                          width: 60,
                          // color: Colors.red,
                        ),
                      ),
                      const Text(
                        'iFazidesk',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            CustomTextField(
                              placeholder: 'Email Id',
                              controller: controller.emailController.value,
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
                              () => CustomTextField(
                                placeholder: 'Password',
                                controller: controller.passwordController.value,
                                obsecureText:
                                    !controller.isPasswordVisible.value,
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
                            CustomButton(
                                width: 150,
                                buttonText: 'Login',
                                onPressed: () => controller.checkLogin()),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                        Routes.RESET,
                                      );
                                    },
                                    child: const Text('Reset Password?')),
                                InkWell(
                                    onTap: () {
                                      controller.forgotPassword();
                                    },
                                    child: const Text('Forgot Password?')),
                              ],
                            ),
                            Row(
                              children: const [
                                Expanded(child: Divider()),
                                SizedBox(
                                  width: 12,
                                ),
                                Text('OR'),
                                SizedBox(
                                  width: 12,
                                ),
                                Expanded(child: Divider()),
                              ],
                            ),
                            InkWell(
                                onTap: () {
                                  //go to signup page
                                  Get.toNamed(Routes.SIGNUP);
                                },
                                child: const Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: 'New tenant user? '),
                                      TextSpan(
                                        text: ' Signup Here!',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                )),
                            const SizedBox(
                              height: 24,
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
          ),
        ),
      ),
    );
  }
}
*/
