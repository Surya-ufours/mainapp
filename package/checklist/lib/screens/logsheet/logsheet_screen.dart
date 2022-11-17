import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:i2iutils/helpers/image_picker_helper.dart';
import 'package:i2iutils/widgets/boxedittext.dart';
import 'package:i2iutils/widgets/button.dart';
import 'package:signature/signature.dart';

import '../../helpers/colors.dart';
import '../../helpers/session.dart';
import 'logsheet_controller.dart';

class LogsheetScreen extends GetView<LogsheetController> {
  LogsheetScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(LogsheetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(Get.arguments['name'] ?? 'Logsheet'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          //show confirmation dialog
          return controller.isError ? true : await Get.bottomSheet(
            Container(
              height: 180,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Cancel',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const Divider(),
                  const Text(
                    'Do you really want to cancel this logsheet entry?',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: CustomButton(
                              width: 100,
                          buttonText: 'No',
                          onPressed: () => Get.back(result: false),
                          buttonColor: Colors.white,
                          textColor: Colors.black,
                        )),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: CustomButton(
                              width: 100,
                          buttonText: 'Yes',
                          onPressed: () => Get.back(result: true),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          );
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => Text(
                              controller.compDet.value,
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: Obx(
                            () => Text(
                              controller.timeSlotDet.value,
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w700),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(
                      () => Text(
                        controller.buildDet.value,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(
                      () => Text(
                        controller.auditDet.value,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Technician Name',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: Text(
                            controller.box.read(Session.userName),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Date & Time',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: Text(
                            getDate(format: controller.ymdhm),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Template's",
                            ),
                            Container(
                              width: 40,
                              height: 2,
                              decoration: BoxDecoration(
                                  color: colorPrimary,
                                  borderRadius: BorderRadius.circular(8)),
                            )
                          ],
                        ),
                        Obx(() => CupertinoSwitch(
                            value: controller.switchValue.value,
                            onChanged: (v) {
                              controller.switchValue(v);
                            })),
                      ],
                    ),
                  ],
                ),
              ),
              Obx(
                () => controller.switchValue.value
                    ? ListView.separated(
                        itemCount: controller.parameterList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          double st = -1;
                          double la = -1;
                          try {
                            var arr = controller
                                .parameterList[index].ParameterLimits
                                .split('-');
                            st = double.parse(arr[0]);
                            la = double.parse(arr[1]);
                          } catch (e) {}

                          Rx<Color> color = Rx(Colors.transparent);

                          return Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        controller
                                            .parameterList[index].parametername,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        controller.parameterList[index]
                                                .issubparamavailable
                                            ? ''
                                            : controller.parameterList[index]
                                                .ParameterLimits,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: colorPrimary),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                controller.parameterList[index]
                                            .issubparamavailable &&
                                        controller.parameterList[index]
                                                .subParameters.value !=
                                            null
                                    ? ListView.separated(
                                        itemCount: controller
                                            .parameterList[index]
                                            .subParameters
                                            .value!
                                            .length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (_, i) {
                                          double sst = -1;
                                          double sla = -1;
                                          try {
                                            var arr = controller
                                                .parameterList[index]
                                                .subParameters
                                                .value![i]
                                                .ParameterLimits
                                                .split('-');
                                            sst = double.parse(arr[0]);
                                            sla = double.parse(arr[1]);
                                          } catch (e) {}

                                          Rx<Color> sColor =
                                              Rx(Colors.transparent);

                                          return Container(
                                            color: Colors.white,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(6),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                        controller
                                                            .parameterList[
                                                                index]
                                                            .subParameters
                                                            .value![i]
                                                            .parametername,
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        controller
                                                            .parameterList[
                                                                index]
                                                            .subParameters
                                                            .value![i]
                                                            .ParameterLimits,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                colorPrimary),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 6,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Obx(
                                                    () => BoxEditText(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      placeholder: 'Input',
                                                      onChanged: (val) {
                                                        //calculate for wrong value
                                                        if (val.isNotEmpty) {
                                                          double d =
                                                              double.parse(val);

                                                          if (sst != -1 &&
                                                              sla != -1) {
                                                            if (d < sst ||
                                                                d > sla) {
                                                              sColor(
                                                                  Colors.red);
                                                            } else {
                                                              sColor(
                                                                  colorPrimary);
                                                            }
                                                          }

                                                          controller
                                                              .parameterList[
                                                                  index]
                                                              .subParameters
                                                              .value![i]
                                                              .userValue = d;
                                                        } else {
                                                          sColor(Colors
                                                              .transparent);
                                                          controller
                                                              .parameterList[
                                                                  index]
                                                              .subParameters
                                                              .value![i]
                                                              .userValue = -1;
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(
                                          height: 12,
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Obx(
                                          () => BoxEditText(
                                            keyboardType: TextInputType.number,
                                            borderColor: color.value,
                                            placeholder: 'Input',
                                            onChanged: (val) {
                                              //calculate for wrong value
                                              if (val.isNotEmpty) {
                                                double d = double.parse(val);
                                                if (st != -1 && la != -1) {
                                                  if (d < st || d > la) {
                                                    color(Colors.red);
                                                  } else {
                                                    color(colorPrimary);
                                                  }
                                                }
                                                controller.parameterList[index]
                                                    .userValue = d;
                                              } else {
                                                color(Colors.transparent);
                                                controller.parameterList[index]
                                                    .userValue = -1;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(
                          height: 12,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: BoxEditText(
                          placeholder: 'Remarks',
                          maxLines: 4,
                          controller: controller.remarkController,
                        )),
                        const SizedBox(
                          width: 16,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            InkWell(
                                onTap: () async {
                                  var result = await getImage(
                                    context,
                                    returnType: ImageReturnType.base64,
                                  );

                                  if (result != null) {
                                    controller.images.add(result);
                                    controller.images.refresh();
                                    if (controller.imageCount > 0) {
                                      controller.txtImageCount(
                                          '${controller.images.length} / ${controller.imageCount}');
                                    } else {
                                      controller.txtImageCount(
                                          "${controller.images.length}");
                                    }
                                  }
                                },
                                child: Obx(
                                  () => controller.images.isNotEmpty
                                      ? Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            const SizedBox(
                                              width: 80,
                                              height: 100,
                                            ),
                                            Positioned(
                                              left: 0,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.memory(
                                                  base64Decode(
                                                      controller.images[0]),
                                                  width: 50,
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            controller.images.length>=2 ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.memory(
                                                base64Decode(
                                                    controller.images[1]),
                                                width: 50,
                                                height: 80,
                                                fit: BoxFit.cover,
                                              ),
                                            ) : const SizedBox.shrink(),
                                            controller.images.length==3 ? Positioned(
                                              right: 0,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.memory(
                                                  base64Decode(
                                                      controller.images[2]),
                                                  width: 50,
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ) : const SizedBox.shrink()
                                          ],
                                        )
                                      : Image.asset(
                                          'assets/camera.png',
                                          width: 50,
                                          height: 100,
                                        ),
                                )),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colorPrimary,
                                ),
                                child: Center(
                                  child: Obx(() => Text(
                                        controller.txtImageCount.value,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 10),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Signature",
                            ),
                            Container(
                              width: 40,
                              height: 2,
                              decoration: BoxDecoration(
                                  color: colorPrimary,
                                  borderRadius: BorderRadius.circular(8)),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            controller.signController.clear();
                            controller.isDrawOk(false);
                          },
                          child: const Text(
                            "Clear Sign",
                            style: TextStyle(
                                color: Colors.green,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Signature(
                          controller: controller.signController,
                          height: 180,
                          backgroundColor: Colors.white,
                        ),
                        Obx(
                          () => controller.isDrawOk.value
                              ? const SizedBox.shrink()
                              : const Text(
                                  'Draw Your Sign Here',
                                  style: TextStyle(color: Colors.grey),
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Obx(() => CustomButton(
                            isLoading: controller.isLoading.value,
                            buttonText: 'Submit',
                            onPressed: () =>controller.submitLogsheet(),
                            width: 150,
                            height: 40,
                          )),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
