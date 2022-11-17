import 'dart:io';

import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/screens/b2c/b2c_dashboard_controller.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:i2iutils/widgets/boxedittext.dart';
import 'package:i2iutils/widgets/button.dart';

import '../../helpers/color.dart';
import '../../helpers/strings.dart';
import '../../routes/hd_app_routes.dart';

class B2CDashboardScreen extends GetView<B2CDashboardController> {
  B2CDashboardScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(B2CDashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Get.toNamed(
              HDRoutes.B2C_DASHBOARD,
            );
          },
        ),
        title: Text(
          'Hi! ${controller.box.read(EMP_NAME)}\n${controller.box.read(COMP_NAME)}',
          style: const TextStyle(fontSize: 14),
        ),
        actions: [
          Obx(() =>
              (controller.fData.value?.feedbackdetails?.isNotEmpty ?? false)
                  ? GestureDetector(
                      onTap: () async {
                        if (controller.fData.value == null) return;
                        var res = await Get.toNamed(HDRoutes.FEEDBACK,
                            arguments: controller.fData.value);
                        if (res != null) {
                          controller.fData.value?.feedbackdetails = res;
                          controller.fData.refresh();
                        }
                      },
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Center(
                              child: ShakeAnimatedWidget(
                                enabled: true,
                                duration: const Duration(milliseconds: 1500),
                                shakeAngle: Rotation.deg(z: 30),
                                curve: Curves.linear,
                                child: Image.asset(
                                  'assets/smiley.png',
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 6,
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  '${controller.fData.value?.feedbackdetails?.length.toString().padLeft(2, '0')}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
                  : const SizedBox.shrink()),
          CachedNetworkImage(
            imageUrl: '${controller.box.read(LOGO)}',
            width: 50,
            errorWidget: (_, __, ___) {
              return Image.asset(
                'assets/logo.png',
                color: Colors.white,
                width: 50,
              );
            },
          ),
        ],
      ),
      body: WillPopScope(
          onWillPop: () async {
            if (controller.canExit) {
              return true;
            } else {
              showToastMsg('Press again to exit');
              controller.canExit = true;
              Future.delayed(
                  const Duration(seconds: 2), () => controller.canExit = false);
            }
            return false;
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(
                      () => Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400, blurRadius: 2),
                              BoxShadow(
                                  color: Colors.grey.shade300, blurRadius: 4)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Department',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Obx(
                                  () => controller.qrScanned.value
                                      ? InkWell(
                                          onTap: () {
                                            controller.qrScanned(false);
                                          },
                                          child: const Text(
                                            'Clear Scan',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline),
                                          ))
                                      : IconButton(
                                          onPressed: () {
                                            controller.qrScan();
                                          },
                                          icon: const Icon(
                                              Icons.qr_code_2_rounded),
                                        ),
                                ),
                              ],
                            ),
                            Wrap(
                              spacing: 12,
                              runSpacing: 0,
                              children: List.generate(
                                  controller.departmentListSize.value + 1,
                                  (index) => Obx(() => index ==
                                          controller.departmentListSize.value
                                      ? controller.departmentList.length <=
                                              controller.FINAL_SIZE
                                          ? const SizedBox.shrink()
                                          : index <=
                                                  controller.departmentList
                                                          .length -
                                                      1
                                              ? InkWell(
                                                  onTap: () {
                                                    if (controller
                                                                .departmentListSize
                                                                .value +
                                                            controller
                                                                .FINAL_SIZE >=
                                                        controller
                                                            .departmentList
                                                            .length) {
                                                      controller
                                                          .departmentListSize(
                                                              controller
                                                                  .departmentList
                                                                  .length);
                                                    } else {
                                                      controller.departmentListSize(
                                                          controller
                                                                  .departmentListSize
                                                                  .value +
                                                              controller
                                                                  .FINAL_SIZE);
                                                    }
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: const [
                                                      Text(
                                                        'View More',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            letterSpacing: 1),
                                                      ),
                                                      Icon(
                                                        Icons.arrow_circle_down,
                                                        size: 12,
                                                      )
                                                    ],
                                                  ))
                                              : InkWell(
                                                  onTap: () {
                                                    controller.departmentListSize(
                                                        controller.departmentList
                                                                    .length >=
                                                                controller
                                                                    .FINAL_SIZE
                                                            ? controller
                                                                .FINAL_SIZE
                                                            : controller
                                                                .departmentList
                                                                .length);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: const [
                                                      Text(
                                                        'Less to 6',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            letterSpacing: 1),
                                                      ),
                                                      Icon(
                                                        Icons.arrow_circle_up,
                                                        size: 12,
                                                      )
                                                    ],
                                                  ))
                                      : InkWell(
                                          onTap: controller.qrScanned.value
                                              ? null
                                              : () {
                                                  if (controller
                                                          .selectedDept.value !=
                                                      controller.departmentList[
                                                          index]) {
                                                    controller.selectedDept(
                                                        controller
                                                                .departmentList[
                                                            index]);
                                                    controller.getIssues();
                                                  }
                                                },
                                          child: SizedBox(
                                            height: Get.height * 0.23,
                                            width: 100,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 120,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image:
                                                          CachedNetworkImageProvider(
                                                        controller
                                                            .departmentList[
                                                                index]
                                                            .departmentLogoFileName,
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: controller
                                                                .selectedDept
                                                                .value ==
                                                            controller
                                                                    .departmentList[
                                                                index]
                                                        ? Border.all(
                                                            color: colorPrimary,
                                                            width: 2)
                                                        : null,
                                                  ),
                                                ),
                                                Text(
                                                  controller
                                                      .departmentList[index]
                                                      .departmentName,
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )
                                              ],
                                            ),
                                          ),
                                        ))),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              'Issue',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Obx(
                              () => Wrap(
                                spacing: 12,
                                children: List.generate(
                                    controller.issueListSize.value + 1,
                                    (index) => index ==
                                            controller.issueListSize.value
                                        ? controller.issueList.length <=
                                                controller.FINAL_SIZE
                                            ? const SizedBox.shrink()
                                            : index <=
                                                    controller
                                                            .issueList.length -
                                                        1
                                                ? InkWell(
                                                    onTap: () {
                                                      if (controller
                                                                  .issueListSize
                                                                  .value +
                                                              controller
                                                                  .FINAL_SIZE >=
                                                          controller.issueList
                                                              .length) {
                                                        controller
                                                            .issueListSize(
                                                                controller
                                                                    .issueList
                                                                    .length);
                                                      } else {
                                                        controller.issueListSize(
                                                            controller
                                                                    .issueListSize
                                                                    .value +
                                                                controller
                                                                    .FINAL_SIZE);
                                                      }
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: const [
                                                        Text(
                                                          'View More',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              letterSpacing: 1),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .arrow_circle_down,
                                                          size: 12,
                                                        )
                                                      ],
                                                    ))
                                                : InkWell(
                                                    onTap: () {
                                                      controller.issueListSize(
                                                          controller.issueList
                                                                      .length >=
                                                                  controller
                                                                      .FINAL_SIZE
                                                              ? controller
                                                                  .FINAL_SIZE
                                                              : controller
                                                                  .issueList
                                                                  .length);
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: const [
                                                        Text(
                                                          'Less to 6',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              letterSpacing: 1),
                                                        ),
                                                        Icon(
                                                          Icons.arrow_circle_up,
                                                          size: 12,
                                                        )
                                                      ],
                                                    ))
                                        : InkWell(
                                            onTap: () {
                                              if (controller
                                                      .selectedIssue.value !=
                                                  controller.issueList[index]) {
                                                controller.selectedIssue(
                                                    controller
                                                        .issueList[index]);
                                                controller.changeRemark();
                                              }
                                            },
                                            child: SizedBox(
                                              height: Get.height * 0.23,
                                              width: 100,
                                              child: Obx(
                                                () => Column(
                                                  children: [
                                                    Container(
                                                      height: 120,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image:
                                                              CachedNetworkImageProvider(
                                                            controller
                                                                .issueList[
                                                                    index]
                                                                .categoryLogoFileName,
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: controller
                                                                    .selectedIssue
                                                                    .value ==
                                                                controller
                                                                        .issueList[
                                                                    index]
                                                            ? Border.all(
                                                                color:
                                                                    colorPrimary,
                                                                width: 2)
                                                            : null,
                                                      ),
                                                    ),
                                                    Text(
                                                      controller
                                                          .issueList[index]
                                                          .categoryName,
                                                      style: const TextStyle(
                                                          fontSize: 12),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            /* child: Obx(
                                              () => Container(
                                                width: 100,
                                                height: 140,
                                                padding: EdgeInsets.symmetric(
                                                  vertical: controller
                                                              .selectedIssue
                                                              .value ==
                                                          controller
                                                              .issueList[index]
                                                      ? 8
                                                      : 14,
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(6)),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: controller
                                                                .selectedIssue
                                                                .value ==
                                                            controller
                                                                .issueList[index]
                                                        ? [
                                                            BoxShadow(
                                                              color: Colors.black
                                                                  .withOpacity(
                                                                      .2),
                                                              blurRadius: 5,
                                                              spreadRadius: 1,
                                                            )
                                                          ]
                                                        : null,
                                                    image: DecorationImage(
                                                        image:
                                                            CachedNetworkImageProvider(
                                                          controller
                                                              .issueList[index]
                                                              .categoryLogoFileName,
                                                        ),
                                                        fit: BoxFit.contain),
                                                    borderRadius:
                                                        BorderRadius.circular(6),
                                                  ),
                                                ),
                                              ),
                                            ),*/
                                          )),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400, blurRadius: 2),
                            BoxShadow(
                                color: Colors.grey.shade300, blurRadius: 4)
                          ]),
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Details',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Expanded(
                                    child: BoxEditText(
                                  placeholder: 'Enter Remark',
                                  maxLines: 3,
                                  controller: controller.remarkController,
                                )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () => controller.selectImage(),
                                    child: controller.submitImage.value != null
                                        ? Image.file(
                                            File(controller.submitImage.value!),
                                            height: 60,
                                          )
                                        : Image.asset(
                                            'assets/placeholder.png',
                                            height: 60,
                                          ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                      width: 150,
                      buttonText: 'Create Ticket',
                      onPressed: () {
                        controller.createB2CTicket();
                      },
                      textSize: 15,
                      height: 38,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              Obx(() => controller.isLoading.value
                  ? Container(
                      width: Get.width,
                      height: Get.height,
                      color: Colors.white60,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: colorPrimary,
                      )),
                    )
                  : const SizedBox.shrink()),
            ],
          ),
        ),
    );
  }
}
