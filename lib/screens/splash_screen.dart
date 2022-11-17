import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/main_app_pages.dart';

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
    Get.offAllNamed(MainRoutes.home);
  }
}
