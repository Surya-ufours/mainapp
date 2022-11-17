/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helpdesk/helpers/strings.dart';
import 'package:helpdesk/routes/main_app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 5200), () {
      if (mounted) {
        checkAndPush();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset('assets/intro.gif'),
        ));
  }

  Future<void> checkAndPush() async {
    final _box = GetStorage();
    if ((_box.read(IS_LOGIN) ?? false)) {
      if ((_box.read(IS_B2C) ?? false)) {
        Get.offAndToNamed(Routes.B2C_HOME);
      } else {
        Get.offAndToNamed(Routes.HOME);
      }
    } else {
      Get.offAndToNamed(Routes.LOGIN);
    }
  }
}
*/
