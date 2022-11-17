/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/screens/reset/reset_controller.dart';
import 'package:helpdesk/widgets/boxedittext.dart';
import 'package:helpdesk/widgets/button.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            BoxEditText(
              placeholder: 'User Name',
              controller: controller.userNameController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            BoxEditText(
              placeholder: 'Old Password',
              controller: controller.oPasswordController,
              obsecureText: true,
            ),
            const SizedBox(
              height: 16,
            ),
            BoxEditText(
              placeholder: 'New Password',
              controller: controller.nPasswordController,
              obsecureText: true,
            ),
            const SizedBox(
              height: 16,
            ),
            BoxEditText(
              placeholder: 'Confirm Password',
              controller: controller.cPasswordController,
              obsecureText: true,
            ),
            const SizedBox(
              height: 24,
            ),
            Obx(
              () => controller.isLoading.value
                  ? const SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(),
                    )
                  : CustomButton(
                      width: 100,
                      height: 30,
                      buttonText: 'Reset',
                      onPressed: () => controller.resetPassword()),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
*/
