import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:i2iutils/helpers/image_picker_helper.dart';
import 'package:i2iutils/widgets/boxedittext.dart';
import 'package:i2iutils/widgets/button.dart';
import 'package:signature/signature.dart';

import '../../helpers/colors.dart';
import '../../helpers/session.dart';
import 'checklist_controller.dart';

class ChecklistScreen extends GetView<ChecklistController> {
  ChecklistScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(ChecklistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Checklist'),
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
                    'Do you really want to cancel this checklist entry?',
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
                          onPressed: () {
                            Get.back(result: false);
                          },
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
                          onPressed: () {
                            Get.back(result: true);
                          },
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
          physics: const BouncingScrollPhysics(),
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
                    const Text(
                      "Question's",
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
              ),
              Obx(
                () => ListView.separated(
                  itemCount: controller.checklists.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
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
                                  controller.checklists[index].questionName,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                )),
                                const SizedBox(
                                  width: 8,
                                ),
                                CachedNetworkImage(
                                  imageUrl: controller.checklists[index].image,
                                  width: 30,
                                  height: 30,
                                  errorWidget: (_, __, ___) {
                                    return Image.asset(
                                      'assets/placeholder.png',
                                      width: 30,
                                      height: 30,
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Obx(
                            () => Row(
                              children: List.generate(
                                  controller.scoreList.length, (i) {
                                var str = controller.scoreList[i].scorename
                                    .toLowerCase();
                                Color color = (str == 'completed' ||
                                        str == 'yes' ||
                                        str == 'ok')
                                    ? colorPrimary
                                    : (str == 'not completed' ||
                                            str == 'no' ||
                                            str == 'not ok')
                                        ? Colors.red
                                        : Colors.black;
                                return Expanded(
                                  child: Row(
                                    children: [
                                      Radio(
                                          fillColor:
                                              MaterialStateProperty.all(color),
                                          value:
                                              controller.scoreList[i].scoreid,
                                          groupValue: controller
                                              .checklists[index].scoreId,
                                          onChanged: (v) {
                                            controller.checklists[index]
                                                .scoreId = v as int;
                                            controller.checklists.refresh();
                                          },
                                          activeColor: Colors.green),
                                      Expanded(
                                          child: InkWell(
                                            onTap:(){
                                              controller.checklists[index]
                                                  .scoreId = controller.scoreList[i].scoreid;
                                              controller.checklists.refresh();
                                            },
                                            child: Text(
                                        controller.scoreList[i].scorename,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                          ))
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Expanded(
                                    child: BoxEditText(
                                  placeholder: 'Remarks',
                                  onChanged: (val) {
                                    controller.checklists[index].remarks = val;
                                  },
                                )),
                                SizedBox(
                                  width: controller.isHaveImageOnChecklist
                                      ? 16
                                      : 0,
                                ),
                                controller.isHaveImageOnChecklist
                                    ? InkWell(
                                      onTap: () async {
                                        var result = await getImage(
                                          context,
                                            returnType:
                                                ImageReturnType.base64);
                                        if (result != null) {
                                          controller.checklists[index]
                                              .checklistImage = result;
                                          controller.checklists.refresh();
                                        }
                                      },
                                      child: controller.checklists[index]
                                              .checklistImage.isNotEmpty
                                          ? Image.memory(
                                              base64Decode(controller
                                                  .checklists[index]
                                                  .checklistImage),
                                              width: 30,
                                              height: 30,
                                            )
                                          : Image.asset(
                                              'assets/camera.png',
                                              width: 30,
                                              height: 30,
                                            ),
                                    )
                                    : const SizedBox.shrink()
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 12,
                  ),
                ),
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
                          alignment: Alignment.topRight,
                          children: [
                            InkWell(
                              onTap: () async {
                                var result = await getImage(
                                  context,
                                  returnType: ImageReturnType.base64,
                                  pickMultiple: true,
                                );

                                if (result != null &&
                                    result is List &&
                                    result.isNotEmpty) {
                                  result.map((e) => controller.images.add(e));
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
                            Container(
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
                                          fontSize: 12),
                                    )),
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
                      height: 16,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Obx(()=>CustomButton(
                          isLoading: controller.isLoading.value,
                          buttonText: 'Submit',
                          onPressed: () => controller.submitChecklist(),
                          width: 150,
                          height: 40,
                        )),),
                    const SizedBox(
                      height: 16,
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
