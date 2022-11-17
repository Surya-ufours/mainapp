import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helpers/colors.dart';
import '../../routes/gc_app_pages.dart';

import 'package:i2iutils/widgets/boxedittext.dart';

import '../../helpers/session.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildNavDrawer(),
      body: GestureDetector(
        onTap: () {
          Get.focusScope?.unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bg.png'),
                        fit: BoxFit.cover)),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorPrimary,
                                boxShadow: [
                                  BoxShadow(
                                      color: colorPrimary, blurRadius: 1),
                                  const BoxShadow(
                                      color: Colors.greenAccent,
                                      blurRadius: 1),
                                ]),
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              'assets/menu.png',
                              width: 20,
                              color: Colors.white,
                            )),
                      ),
                      const Expanded(
                        child: Text(
                          'GreenChkList',
                          style:
                              TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      CachedNetworkImage(
                        imageUrl:
                            controller.box.read(Session.userCompanyLogo),
                        height: 25,
                        errorWidget: (_, __, ___) {
                          return Image.asset(
                            'assets/logo.png',
                            height: 30,
                          );
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 40,
                          height: 20,
                          child: Divider(
                            color: Colors.grey.shade200,
                            thickness: 4,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/setting.png',
                                width: 20,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Department',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Obx(
                                          () => Text(
                                            controller
                                                .selectedDepartment.value,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight:
                                                    FontWeight.w800),
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () => controller
                                          .showDepartmentBottomSheet(),
                                      child: Text(
                                        'Change',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: colorPrimary,
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          indent: 32,
                          endIndent: 32,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    children: [
                                      _buildTitle('assets/qrcode.png', 20,
                                          'Scan QR-CODE'),
                                      InkWell(
                                        onTap: () => controller.scanQR(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Image.asset(
                                            'assets/scan.png',
                                            width: 100,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.width,
                                  margin: const EdgeInsets.all(12),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                            color: colorPrimary,
                                            blurRadius: 1),
                                        const BoxShadow(
                                            color: Colors.greenAccent,
                                            blurRadius: 1),
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildTitle('assets/number.png', 25,
                                          'Get Detail By QrCode'),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: BoxEditText(
                                            placeholder:
                                                'Enter QR / Barcode Number',
                                            controller: controller
                                                .barcodeController,
                                            onSubmitted: (val) =>
                                                controller.submitQrcode(),
                                            textInputAction:
                                                TextInputAction.search,
                                          )),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Material(
                                            child: InkWell(
                                              onTap: () =>
                                                  controller.submitQrcode(),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: colorPrimary,
                                                ),
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: const Icon(
                                                  Icons.search,
                                                  size: 25,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  indent: 32,
                                  endIndent: 32,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _buildTitle('assets/offline.png',
                                              16, 'Offline Data\'s'),
                                          Obx(()=>controller.hideUploadLabel.value
                                              ? const SizedBox.shrink()
                                              : !controller.isUploading.value
                                                  ? InkWell(
                                                      onTap: () => controller
                                                          .uploadingOffline(),
                                                      child: Text(
                                                        'Upload Data',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                colorPrimary,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    )
                                                  : const SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child:
                                                          CircularProgressIndicator()),),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: _buildCard(
                                                'Checklist',
                                                controller.checklistCount,
                                                'assets/checklist.jpg',
                                                const [
                                                  BoxShadow(
                                                      color: Colors.yellow,
                                                      blurRadius: 1),
                                                  BoxShadow(
                                                      color: Colors
                                                          .yellowAccent,
                                                      blurRadius: 1),
                                                ],
                                                isStart: false),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Expanded(
                                              child: _buildCard(
                                                  'Logsheet',
                                                  controller.logsheetCount,
                                                  'assets/logsheet.png',
                                                  const [
                                                BoxShadow(
                                                    color: Colors.green,
                                                    blurRadius: 1),
                                                BoxShadow(
                                                    color:
                                                        Colors.greenAccent,
                                                    blurRadius: 1),
                                              ])),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildTitle(String imagePath, double size, String title) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: size,
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
            ),
            Container(
              width: 40,
              height: 2,
              decoration: BoxDecoration(
                  color: colorPrimary, borderRadius: BorderRadius.circular(8)),
            )
          ],
        ),
      ],
    );
  }

  _buildCard(String title, RxInt count, String path, var boxShadows,
      {bool isStart = false}) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: boxShadows,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              image: AssetImage(path), fit: BoxFit.cover, opacity: 1)),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment:
            isStart ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4),
          ),
          const SizedBox(
            height: 32,
          ),
          Obx(
            () => Text(
              '$count',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.3),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
        ],
      ),
    );
  }

  _buildNavDrawer() {
    return Container(
      width: Get.width * 0.8,
      height: Get.height,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), bottomRight: Radius.circular(12))),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 14,
          ),
          IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.closeDrawer();
              },
              icon: const Icon(Icons.close)),
          //profile section
          Container(
            width: Get.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  const BoxShadow(color: Colors.white, blurRadius: 1),
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 1.8,
                      offset: const Offset(-5, 3)),
                  BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 1.8,
                      offset: const Offset(2, -5)),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: colorPrimary,
                    radius: 22,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: CachedNetworkImage(
                            imageUrl:
                                controller.box.read(Session.userCompanyLogo),
                            height: 30,
                            errorWidget: (_, __, ___) {
                              return Image.asset(
                                'assets/logo.png',
                                height: 30,
                              );
                            },
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.box.read(Session.userName),
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        controller.box.read(Session.userCompanyName),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 34,
          ),
          _buildMenu('assets/dashboard.png', 'Dashboard',
              () => Get.toNamed(GCRoutes.dashboard),
              subTitle: "Check your submitted data's"),
          _buildMenu(
              'assets/todo.png', 'Todo\'s', () => Get.toNamed(GCRoutes.todo),
              subTitle: "Todo of your plan"),
          controller.box.read(Session.isHelpdesk)
              ? _buildMenu('assets/helpdesk.png', 'Helpdesk',
                  () => Get.toNamed(GCRoutes.helpdesk),
                  subTitle: "View your helpdesk tickets")
              : const SizedBox.shrink(),
          _buildMenu('assets/download.png', 'Download Data',
              () => Get.toNamed(GCRoutes.download),
              subTitle: 'Update database as per our server'),
          _buildMenu('assets/database.png', 'Backup Database',
                  () => controller.backupDatabase(),
              subTitle: 'Download database to local directories'),
          /*_buildMenu(
            'assets/img_download.png',
            'Download Images',
            () {},
            subTitle: 'Downloading checklist / log-sheet images',
          ),*/
          _buildMenu('assets/notification.png', 'Push Notification', () {},
              subTitle: 'Setup Your Notification',
              trialingIcon: Switch(
                value: true,
                onChanged: (val) {},
              )),
          const Spacer(),
          SizedBox(
            width: 140,
            height: 45,
            child: ElevatedButton(
                onPressed: () {
                  _scaffoldKey.currentState?.closeDrawer();
                  controller.logout();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  primary: colorPrimary,
                  elevation: 8,
                  shadowColor: Colors.black,
                  padding: const EdgeInsets.all(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Log out',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                          color: Colors.amber, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  _buildMenu(String path, String title, Function() onTab,
      {Widget? trialingIcon, String? subTitle}) {
    return InkWell(
      onTap: () {
        _scaffoldKey.currentState?.closeDrawer();
        onTab();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              path,
              width: 20,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          subTitle ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  trialingIcon ?? const SizedBox.shrink()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
