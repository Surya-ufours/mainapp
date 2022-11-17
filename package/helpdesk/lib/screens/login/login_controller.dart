/*
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helpdesk/api/helpdesk_api_calls.dart';
import 'package:helpdesk/helpers/color.dart';
import 'package:helpdesk/helpers/loader.dart';
import 'package:helpdesk/helpers/strings.dart';
import 'package:helpdesk/helpers/utils.dart';
import 'package:helpdesk/model/login_response.dart';
import 'package:helpdesk/routes/main_app_routes.dart';
import 'package:helpdesk/widgets/boxedittext.dart';
import 'package:helpdesk/widgets/button.dart';
import 'package:package_info/package_info.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  var isRememberMe = true.obs;
  final _box = GetStorage();
  late PackageInfo packageInfo;
  RxBool isPasswordVisible = false.obs;
  RxString appVersion = ''.obs;
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Future<void> onInit() async {
    super.onInit();
    packageInfo = await PackageInfo.fromPlatform();
    appVersion('App Version ${packageInfo.version}');
    String email = _box.read(USER_EMAIL) ?? '';
    String password = _box.read(USER_PASSWORD) ?? '';

    emailController.value.text = email;
    passwordController.value.text = password;

    // _firebaseMessaging.requestPermission();
  }

  checkLogin() async {
    Get.focusScope?.unfocus();
    debugPrint(
        'email : ${emailController.value.text} password : ${passwordController.value.text}');

    if (emailController.value.text.isEmpty) {
      return showToastMsg('Invalid Email');
    }
    if (passwordController.value.text.isEmpty) {
      return showToastMsg('Enter Password');
    }

    if (await isNetConnected()) {
      _box.write(USER_EMAIL, emailController.value.text.trim());
      _box.write(USER_PASSWORD, passwordController.value.text.trim());

      try {
        showLoader();
        LoginResponse? response = await HelpdeskApiCall().checkLogin(
            emailController.value.text.trim(),
            passwordController.value.text.trim());
        hideLoader();
        if (response == null) {
          showToastMsg('Something went wrong');
          return;
        }

        if (!(response.status ?? false)) {
          hideLoader();
          showToastMsg(response.message ?? '');
          return;
        }

        response.companydetails?.forEach((element) {
          if (element.company != null) {
            element.company =
                element.company!.substring(0, element.company!.indexOf('('));
          }
        });

        bool isB2c = false;
        if (response.locationdetails?.isNotEmpty ?? false) {
          isB2c = response.locationdetails?.first.business2Consumer ?? false;
        }

        _box.write(IS_LOGIN, true);
        _box.write(IS_REMEMBER, isRememberMe.value);

        _box.write(USER_ID, response.userID);
        _box.write(LOGO, response.logopath);
        _box.write(EMP_EMAIL, response.emailID);
        _box.write(EMP_PHONE, response.contactNo);
        _box.write(EMP_NAME, response.firstName);
        _box.write(COMP_NAME, response.companyName);
        _box.write(EMP_ID, response.requestorID);
        _box.write(GROUP_ID, response.groupID);
        _box.write(COMP_ID, response.companyID);
        _box.write(ROLE_ID, response.roleID);
        _box.write(IS_ADMIN, response.isAdmin);
        _box.write(IS_SA, response.isSuperAdmin);
        _box.write(IS_SE, response.isServiceEngineer);
        _box.write(IS_EMP, response.isEmployee);
        _box.write(IS_TENENT, response.isTenant);
        _box.write(IS_B2C, isB2c);
        _box.write(COMP_LIST, jsonEncode(response.companydetails ?? []));
        _box.write(LOC_LIST, jsonEncode(response.locationdetails ?? []));
        _box.write(BUILDING_LIST, jsonEncode(response.buildingdetails ?? []));
        _box.write(FLOOR_LIST, jsonEncode(response.floordetails ?? []));
        _box.write(WING_LIST, jsonEncode(response.wingdetails ?? []));

        // String? token = await _firebaseMessaging.getToken();
        // if (token != null) {
        //   HelpdeskApiCall().updateToken({
        //     'userid': response.userID,
        //     'notificationid': token,
        //   });
        // }

        if (isB2c) {
          Get.offAndToNamed(Routes.B2C_HOME, arguments: true);
        } else {
          Get.offAndToNamed(Routes.HOME, arguments: true);
        }
      } catch (e) {
        //ignored
      }
    }
  }

  forgotPassword() async {
    var emailController = TextEditingController();
    RxBool isLoading = false.obs;
    scaffoldKey.currentState?.showBottomSheet((context) {
      return Container(
        padding: MediaQuery.of(Get.context!).viewInsets,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Forgot Password?',
              style:
                  TextStyle(color: colorPrimary, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: BoxEditText(
                placeholder: 'Enter your Registered email ID',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(
              () => isLoading.value
                  ? const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(),
                    )
                  : CustomButton(
                      width: 120,
                      buttonText: 'Submit',
                      onPressed: () async {
                        if (emailController.text.isEmpty) {
                          showToastMsg('Please enter email');
                        } else {
                          if (await isNetConnected()) {
                            Get.focusScope?.unfocus();
                            isLoading(true);
                            var response = await HelpdeskApiCall()
                                .updateForgotPassword(emailController.text);
                            if (response != null) {
                              showToastMsg(response['Message']);
                              if (response['Status']) Get.back();
                            }
                            isLoading(false);
                          }
                        }
                      },
                      textSize: 12,
                      height: 30,
                    ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      );
    }, backgroundColor: Colors.transparent, elevation: 18);
  }
}
*/
