import 'dart:async';
import 'package:checklist/database/dao/user_dao.dart';
import 'package:checklist/database/database.dart';
import 'package:checklist/helpers/session.dart';
import 'package:checklist/model/user_response.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mainapp/routes/main_app_pages.dart';

import '../../api/api_calls.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isRememberMe = true.obs;
  final _box = GetStorage();

  RxBool isPasswordVisible = false.obs, isLoading = false.obs;
  RxString appVersion = ''.obs;

  Timer? countdownTimer;

  List products = [
    {
      'iconPath': "week_banner.png",
      'color': Colors.red,
    },
    {
      'iconPath': "chklist_banner.png",
      'color': Colors.green,
    },
    {
      'iconPath': "helpdesk_banner.png",
      'color': Colors.blue,
    },
    {
      'iconPath': "ipat.png",
      'color': Colors.red,
    },
    {
      'iconPath': "optdesk.png",
      'color': Colors.yellow,
    },
    {
      'iconPath': "iram.png",
      'color': Colors.blue,
    }
  ];

  RxInt productPosition = 0.obs;

  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Future<void> onInit() async {
    super.onInit();
    appVersion('App Version ${await getAppVersion()}');


    //Timer for change the image banner in login page
    countdownTimer = Timer.periodic(const Duration(seconds: 3), (val) {
      productPosition.value++;
      productPosition(productPosition.value % products.length);
    });

    String email = _box.read(Session.userEmail) ?? '';
    String password = _box.read(Session.userPassword) ?? '';

    emailController.text = email;
    passwordController.text = password;

    // _firebaseMessaging.requestPermission();
  }

  checkLogin() async {
    //check storage permissions
    // if (await isHaveStoragePermission()) {

    String userName = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    if (userName.isEmpty) {
      showToastMsg('Enter User Name');
      return;
    }
    if (password.isEmpty) {
      showToastMsg('Enter User Password');
      return;
    }
    isLoading(true);

    var userDao = UserDao(Get.find<GCAppDb>());
      //check internet
      if (await isNetConnected()) {
        //check offline count and alert user
        var response = await ApiCall().checkLogin(userName, password);

        if (response != null) {
          if (response.status) {
            await userDao.deleteUsers();
            await userDao.insertUser(response.result[0],
                passwordController.text.toString().trim());

            //add session
            applySession(response.result[0]);

            Get.offAllNamed(MainRoutes.home);
          } else {
            //show alert
            showToastMsg(response.message, longToast: true);
          }
        }
      }


    isLoading(false);
    // }
  }

  applySession(ApiUser user) {
    _box.write(Session.isRememberMe, isRememberMe.value);
    _box.write(Session.userEmail, user.emailid);
    _box.write(Session.userPassword, passwordController.text.toString().trim());
    _box.write(Session.userName, user.name);
    _box.write(Session.userId, user.userID);
    _box.write(Session.userCompanyLogo,
        user.companylogo.replaceAll("http:", "https:"));
    _box.write(Session.userCompanyId, user.companyID);
    _box.write(Session.userLocationId, user.locationID);
    _box.write(Session.userCompanyName, user.companyName);
    _box.write(Session.userLocationName, user.locationame);
    _box.write(Session.isHelpdesk, user.isHelpdesk);
    _box.write(Session.isAdmin, user.isAdmin);
    _box.write(Session.token, user.token);
    _box.write(Session.userDepartments, user.department);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    countdownTimer?.cancel();
  }
}