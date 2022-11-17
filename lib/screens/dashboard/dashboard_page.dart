import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainapp/screens/dashboard/dashboard_page_controller.dart';

import '../../helper/color.dart';

class DashboardPage extends GetView<DashboardPageController> {
  DashboardPage({Key? key}) : super(key: key);

  @override
  final controller=Get.put(DashboardPageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: yellow,
          title: const Text('Dashboard',style: TextStyle(color: Colors.black,fontSize: 18),),
        ),
      ],
    );
  }
}
