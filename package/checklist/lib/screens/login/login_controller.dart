import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../api/api_calls.dart';
import '../../database/dao/user_dao.dart';
import '../../database/database.dart';
import '../../helpers/session.dart';
import '../../model/user_response.dart';
import 'package:i2iutils/helpers/common_functions.dart';

import '../../routes/gc_app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isRememberMe = true.obs;
  final _box = GetStorage();
  RxBool isPasswordVisible = false.obs, isLoading = false.obs;
  RxString appVersion = ''.obs;

  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Future<void> onInit() async {
    super.onInit();
    appVersion('App Version ${await getAppVersion()}');
    String email = _box.read(Session.userEmail) ?? '';
    String password = _box.read(Session.userPassword) ?? '';

    emailController.text = email;
    passwordController.text = password;

    // _firebaseMessaging.requestPermission();
  }

  checkLogin() async {
    //check storage permissions
    // if (await isHaveStoragePermission()) {
      isLoading(true);

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

      var userDao = UserDao(Get.find<GCAppDb>());
      String token = _box.read(Session.token) ?? '';
      var userId = _box.read(Session.userId);

      //check database user already login offline
      var user = await userDao.getUser(userName, password);

      if (user != null && token.isNotEmpty) {
        //add session
        applySession(ApiUser(
            user.userID,
            user.CompanyID,
            user.locationID,
            user.companyName,
            user.companylogo,
            user.locationame,
            user.ischecklist,
            user.isadmin,
            user.ishelpdesk,
            user.islogsheet,
            user.name,
            user.emailid,
            user.mobileno,
            user.RoleShortName,
            user.Language,
            user.ProductID,
            user.AppTypes,
            '',
            user.Department,
            token));

        Get.offAllNamed(GCRoutes.home,arguments: true);
      } else {
        //check internet
        if (await isNetConnected()) {
          //check offline count and alert user
          var response = await ApiCall().checkLogin(userName, password);

          if (response != null) {
            if (response.status) {
              await userDao.deleteUsers();
              await userDao.insertUser(response.result[0],
                  passwordController.text.toString().trim());

              //unregister token for old user in server

              if (userId != null && token.isNotEmpty) {
                await ApiCall().logout(token, userId);
              }

              //add session
              applySession(response.result[0]);

              Get.offAllNamed(GCRoutes.download);
            } else {
              //show alert
              showToastMsg(response.message, longToast: true);
            }
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
}
