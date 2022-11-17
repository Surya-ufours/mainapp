/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/api/helpdesk_api_calls.dart';
import 'package:helpdesk/helpers/utils.dart';

class ResetPasswordController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController oPasswordController = TextEditingController();
  TextEditingController nPasswordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  RxBool isLoading = false.obs;

  resetPassword() async {
    if (userNameController.text.isEmpty) {
      showToastMsg('Enter User name');
    } else if (oPasswordController.text.isEmpty) {
      showToastMsg('Enter Old Password');
    } else if (nPasswordController.text.isEmpty) {
      showToastMsg('Enter New Password');
    } else if (cPasswordController.text.isEmpty) {
      showToastMsg('Enter Confirm Password');
    } else if (nPasswordController.text != cPasswordController.text) {
      showToastMsg('Password does\'t match');
    } else {
      if (await isNetConnected()) {
        Get.focusScope?.unfocus();
        isLoading(true);
        var response = await HelpdeskApiCall().updateResetPassword(
            userNameController.text,
            oPasswordController.text,
            nPasswordController.text);
        isLoading(false);
        if (response != null) {
          showToastMsg('${response['Message']}');
          if (response['Status']) {
            Get.back();
          }
        }
      }
    }
  }
}
*/
