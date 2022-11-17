import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/helpers/color.dart';
import 'package:helpdesk/helpers/strings.dart';
import 'package:i2iutils/widgets/boxedittext.dart';
import 'package:i2iutils/widgets/button.dart';
import 'package:helpdesk/widgets/department_dropdown.dart';
import 'package:helpdesk/widgets/issue_dropdown.dart';
import 'package:helpdesk/widgets/search_dropdown.dart';

import 'ticket_create_controller.dart';

class TicketCreateScreen extends GetView<TicketCreateController> {
  TicketCreateScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(TicketCreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Ticket'),
        actions: [
          IconButton(
              onPressed: () {
                controller.qrScan();
              },
              icon: const Icon(Icons.qr_code_scanner_rounded))
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: '${controller.box.read(LOGO)}',
                  height: 50,
                  width: 100,
                  errorWidget: (_, __, ___) {
                    return Image.asset(
                      'assets/logo.png',
                      color: Colors.black,
                      height: 50,
                      width: 100,
                    );
                  },
                ),
                Obx(
                  () => Visibility(
                    visible: controller.details.value == null,
                    child: AnimatedContainer(
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
                      duration: const Duration(milliseconds: 300),
                      child: Column(
                        children: [
                          const Text(
                            'Tell us, Where you want to raise the ticket?',
                            style: TextStyle(fontSize: 10),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Obx(() => controller.canShowCompany.value
                              ? Column(
                                  children: [
                                    SearchDropDown(controller.companyList.value,
                                        controller.selectedCompany.value,
                                        prefix: const Icon(Icons.home_work),
                                        label: 'Company', onChanged: (val) {
                                      if (val != null &&
                                          val !=
                                              controller
                                                  .selectedCompany.value) {
                                        controller.selectedCompany(val);
                                        controller.companyChanged();
                                      }
                                    }),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink()),
                          Obx(() => controller.canShowLocation.value
                              ? Column(
                                  children: [
                                    SearchDropDown(
                                        controller.locationList.value,
                                        controller.selectedLocation.value,
                                        prefix:
                                            const Icon(Icons.pin_drop_rounded),
                                        label: 'Location', onChanged: (val) {
                                      if (val != null &&
                                          val !=
                                              controller
                                                  .selectedLocation.value) {
                                        controller.selectedLocation(val);
                                        controller.setupBuilding();
                                      }
                                    }),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink()),
                          Obx(() => controller.canShowBuilding.value
                              ? Column(
                                  children: [
                                    SearchDropDown(
                                        controller.buildingList.value,
                                        controller.selectedBuilding.value,
                                        prefix: const Icon(Icons.location_city),
                                        label: 'Building', onChanged: (val) {
                                      if (val != null &&
                                          val !=
                                              controller
                                                  .selectedBuilding.value) {
                                        controller.selectedBuilding(val);
                                        controller.setupFloor();
                                      }
                                    }),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink()),
                          SearchDropDown(controller.floorList.value,
                              controller.selectedFloor.value,
                              prefix: const Icon(Icons.window),
                              label: 'Floor', onChanged: (val) {
                            if (val != null &&
                                val != controller.selectedFloor.value) {
                              controller.selectedFloor(val);
                              controller.setupWing();
                            }
                          }),
                          const SizedBox(
                            height: 12,
                          ),
                          SearchDropDown(controller.wingList.value,
                              controller.selectedWing.value,
                              prefix: const Icon(Icons.cloudy_snowing),
                              label: 'Block/Unit', onChanged: (val) {
                            if (val != null &&
                                val != controller.selectedWing.value) {
                              controller.selectedWing(val);
                            }
                          }),
                          const SizedBox(
                            height: 12,
                          ),
                          DepartmentDropDown(controller.departmentList.value,
                              controller.selectedDept.value,
                              prefix: const Icon(Icons.source),
                              searchEnable: false,
                              label: 'Category', onChanged: (val) {
                            if (val != null &&
                                val != controller.selectedDept.value) {
                              controller.selectedDept(val);
                              controller.getIssues();
                            }
                          }),
                          const SizedBox(
                            height: 12,
                          ),
                          IssueDropDown(controller.issueList.value,
                              controller.selectedIssue.value,
                              prefix: const Icon(Icons.coronavirus),
                              searchEnable: false,
                              label: 'Complaint Name', onChanged: (val) {
                            if (val != null &&
                                val != controller.selectedIssue.value) {
                              controller.selectedIssue(val);
                            }
                          }),
                          const SizedBox(
                            height: 12,
                          ),
                          Obx(
                            () => controller.isCompType.value
                                ? SearchDropDown(
                                    controller.complaintTypeList.value,
                                    controller.selectedComplaintType.value,
                                    prefix: const Icon(Icons.all_out_outlined),
                                    label: 'Complaint Type',
                                    isEnabled: controller.isCompType.value,
                                    onChanged: (val) {
                                    if (val != null &&
                                        val !=
                                            controller
                                                .selectedComplaintType.value) {
                                      controller.selectedComplaintType(val);
                                    }
                                  })
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: controller.details.value != null,
                    child: AnimatedContainer(
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
                      duration: const Duration(milliseconds: 300),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(Icons.home_work),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                          '${controller.details.value?.companyName}', maxLines: 2, overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${controller.details.value?.locationName}',
                                        textAlign: TextAlign.end,
                                          maxLines: 2, overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Icon(Icons.pin_drop_rounded),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(Icons.location_city),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                          '${controller.details.value?.buildingName}', maxLines: 2, overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${controller.details.value?.floorName}',
                                        textAlign: TextAlign.end,
                                          maxLines: 2, overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Icon(Icons.cloudy_snowing),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(Icons.window),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${controller.details.value?.wingName}',
                                          maxLines: 2, overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${controller.details.value?.departmentName}',
                                        textAlign: TextAlign.end,
                                          maxLines: 2, overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Icon(Icons.source),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Obx(
                            () => IssueDropDown(controller.issueList.value,
                                controller.selectedIssue.value,
                                prefix: const Icon(Icons.coronavirus),
                                searchEnable: false,
                                label: 'Complaint Name', onChanged: (val) {
                              if (val != null &&
                                  val != controller.selectedIssue.value) {
                                controller.selectedIssue(val);
                              }
                            }),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Obx(
                            () => SearchDropDown(
                                controller.complaintTypeList.value,
                                controller.selectedComplaintType.value,
                                prefix: const Icon(Icons.all_out_outlined),
                                label: 'Complaint Type',
                                isEnabled: controller.isCompType.value,
                                onChanged: (val) {
                              if (val != null &&
                                  val !=
                                      controller.selectedComplaintType.value) {
                                controller.selectedComplaintType(val);
                              }
                            }),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.clearScan();
                            },
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  'Clear QR Scan',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
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
                        BoxShadow(color: Colors.grey.shade400, blurRadius: 2),
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 4)
                      ]),
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.canShowReqBy.value
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Requested By',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RadioListTile(
                                            dense: true,
                                            activeColor: colorPrimary,
                                            title: const Text(
                                              'Self',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            value: 1,
                                            groupValue:
                                                controller.selectedReqBy.value,
                                            onChanged: (val) {
                                              controller.selectedReqBy(
                                                  int.parse(val.toString()));
                                              controller.setupForm(true);
                                            }),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                            dense: true,
                                            activeColor: colorPrimary,
                                            title: const Text(
                                              'Others',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            value: 2,
                                            groupValue:
                                                controller.selectedReqBy.value,
                                            onChanged: controller
                                                    .canShowReqBy.value
                                                ? (val) {
                                                    controller.selectedReqBy(
                                                        int.parse(
                                                            val.toString()));
                                                    controller.setupForm(false);
                                                  }
                                                : null),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Obx(() => controller.selectedReqBy.value != 1
                                      ? SearchDropDown(
                                          controller.communicationList.value,
                                          controller
                                              .selectedCommunication.value,
                                          prefix: const Icon(Icons.all_inbox),
                                          label: 'Mode Of Communication',
                                          onChanged: (val) {
                                          if (val != null &&
                                              val !=
                                                  controller
                                                      .selectedCommunication
                                                      .value) {
                                            controller
                                                .selectedCommunication(val);
                                          }
                                        })
                                      : const SizedBox.shrink()),
                                ],
                              )
                            : const SizedBox.shrink(),
                        Obx(
                          () => controller.isReqType.value
                              ? Column(
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    SearchDropDown(
                                        controller.requestTypeList.value,
                                        controller.selectedReqType.value,
                                        prefix: const Icon(Icons.loyalty),
                                        label: 'Request Type',
                                        onChanged: (val) {
                                      if (val != null &&
                                          val !=
                                              controller
                                                  .selectedReqType.value) {
                                        controller.selectedReqType(val);
                                      }
                                    }),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'Requester Name',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 13),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        BoxEditText(
                          placeholder: 'Requester Name',
                          maxLines: 1,
                          controller: controller.nameController,
                          readOnly: controller.selectedReqBy.value == 1,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        controller.reqIdController.text.isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    const Text(
                                      'Requester ID',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    BoxEditText(
                                      placeholder: 'Requester ID',
                                      maxLines: 1,
                                      controller: controller.reqIdController,
                                      readOnly:
                                          controller.selectedReqBy.value == 1,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                  ])
                            : const SizedBox.shrink(),
                        const Text(
                          'Mail ID',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 13),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        BoxEditText(
                          placeholder: 'Email',
                          maxLines: 1,
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          readOnly: controller.selectedReqBy.value == 1,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Mobile Number',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 13),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        BoxEditText(
                          placeholder: 'Mobile Number',
                          maxLines: 1,
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          controller: controller.phoneController,
                          readOnly: controller.selectedReqBy.value == 1,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        controller.isRefNo.value
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Customer Reference No',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  BoxEditText(
                                    placeholder: 'Reference No',
                                    maxLines: 1,
                                    controller: controller.refNOController,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
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
                  buttonText: 'Generate Ticket',
                  onPressed: () {
                    controller.createTicket();
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
    );
  }
}
