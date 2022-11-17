import 'package:animated_widgets/animated_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/api/urls.dart';
import 'package:helpdesk/helpers/color.dart';
import 'package:helpdesk/helpers/strings.dart';
import 'package:helpdesk/helpers/utils.dart';
import 'package:helpdesk/routes/hd_app_routes.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:i2iutils/widgets/button.dart';
import 'package:helpdesk/widgets/search_dropdown.dart';

import '../../widgets/multi_dropdown.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        // leading: null,
        title: Text(
          controller.isB2c
              ? 'Dashboard'
              : 'Hi! ${controller.box.read(EMP_NAME)}\n${controller.box.read(COMP_NAME)}',
          style: TextStyle(fontSize: controller.isB2c ? null : 15),
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
                                  package: 'helpdesk',
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
            imageUrl: '${controller.box.read(LOGO)}123',
            width: 50,
            errorWidget: (_, __, ___) {
              return Image.asset(
                'assets/logo.png',
                color: Colors.white,
                width: 50,
                package: 'helpdesk',
              );
            },
          ),
          /*controller.isB2c
              ? const SizedBox.shrink()
              : IconButton(
                  onPressed: () {
                    controller.logout();
                  },
                  icon: const Icon(Icons.logout)),*/
        ],
      ),
      body: Obx(
        () => Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SearchDropDown(controller.companyList,
                        controller.selectedCompany.value,
                        prefix: const Icon(Icons.home_work),
                        isEnabled: controller.companyList.length != 1,
                        label: 'Company', onChanged: (val) {
                      if (val != null &&
                          val != controller.selectedCompany.value) {
                        controller.selectedCompany(val);
                        var companyId = getId(controller.companyList.value,
                            controller.selectedCompany.value);
                        controller.setupLocation();
                        controller.getTicketType('$companyId');
                      }
                    }),
                    const SizedBox(
                      height: 12,
                    ),
                    SearchDropDown(controller.locationList,
                        controller.selectedLocation.value,
                        prefix: const Icon(Icons.pin_drop_rounded),
                        isEnabled: controller.locationList.length != 1,
                        label: 'Location', onChanged: (val) {
                      if (val != null &&
                          val != controller.selectedLocation.value) {
                        controller.selectedLocation(val);
                        controller.setupBuilding();
                      }
                    }),
                    const SizedBox(
                      height: 12,
                    ),
                    // SearchDropDown(controller.buildingList,
                    //     controller.selectedBuilding.value,
                    //     prefix: const Icon(Icons.pin_drop_rounded),
                    //     isEnabled: controller.buildingList.length != 1,
                    //     label: 'Building', onChanged: (val) {
                    //       if (val != null &&
                    //           val != controller.selectedBuilding.value) {
                    //         controller.selectedBuilding(val);
                    //       }
                    //     }),
                    Obx(
                      () => MultiDropDown(
                        controller.selectedBuildingList
                            .map((e) => e.building)
                            .toList(),
                        prefix: const Icon(Icons.location_city),
                        hint: 'Select Building',
                        onTab: controller.buildingList.isEmpty
                            ? null
                            : () => controller.showBuilding(),
                      ),
                    ),
                    Obx(() => controller.canShowType.value
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              SearchDropDown(controller.ticketTypeList,
                                  controller.selectedTicketType.value,
                                  prefix: const Icon(Icons.style),
                                  isEnabled:
                                      controller.ticketTypeList.length != 1,
                                  label: 'Complaint Type', onChanged: (val) {
                                if (val != null &&
                                    val !=
                                        controller.selectedTicketType.value) {
                                  controller.selectedTicketType(val);
                                  controller
                                      .viewTicketLabel("View $val Ticket");
                                  controller.myTicketLabel("My $val Ticket");
                                }
                              }),
                            ],
                          )
                        : const SizedBox.shrink()),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 6),
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
                          const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'DATEWISE FILTER',
                            ),
                          ),
                          RadioListTile(
                              dense: true,
                              activeColor: colorPrimary,
                              title: const Text(
                                'Today',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800),
                              ),
                              subtitle: Text(
                                controller.todayDate.value,
                                style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600),
                              ),
                              contentPadding: const EdgeInsets.all(0),
                              value: '1',
                              groupValue: controller.selectedDateType.value,
                              onChanged: (val) {
                                controller.label =
                                    'Today ${controller.todayDate.value}';
                                controller.selectedDateType(val.toString());
                                controller.selectStartDate(getPastDay(0));
                                controller.selectEndDate(getPastDay(0));
                              }),
                          RadioListTile(
                              dense: true,
                              activeColor: colorPrimary,
                              title: const Text(
                                'Yesterday',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800),
                              ),
                              subtitle: Text(
                                controller.yesterday.value,
                                style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600),
                              ),
                              contentPadding: const EdgeInsets.all(0),
                              value: '2',
                              groupValue: controller.selectedDateType.value,
                              onChanged: (val) {
                                controller.label =
                                    'Yesterday ${controller.yesterday.value}';

                                controller.selectedDateType(val.toString());
                                controller.selectStartDate(getPastDay(1));
                                controller.selectEndDate(getPastDay(1));
                              }),
                          RadioListTile(
                              dense: true,
                              activeColor: colorPrimary,
                              title: const Text(
                                'Last 7 Days',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800),
                              ),
                              subtitle: Text(
                                controller.lastSevenDays.value,
                                style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600),
                              ),
                              contentPadding: const EdgeInsets.all(0),
                              value: '3',
                              groupValue: controller.selectedDateType.value,
                              onChanged: (val) {
                                controller.label =
                                    'Last 7 Days (${controller.lastSevenDays.value})';

                                controller.selectedDateType(val.toString());
                                controller.selectStartDate(getPastDay(7));
                                controller.selectEndDate(getPastDay(0));
                              }),
                          RadioListTile(
                              dense: true,
                              activeColor: colorPrimary,
                              title: const Text(
                                'Last 30 Days',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800),
                              ),
                              subtitle: Text(
                                controller.lastThirtyDays.value,
                                style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600),
                              ),
                              contentPadding: const EdgeInsets.all(0),
                              value: '4',
                              groupValue: controller.selectedDateType.value,
                              onChanged: (val) {
                                controller.label =
                                    'Last 30 Days (${controller.lastThirtyDays.value})';

                                controller.selectedDateType(val.toString());
                                controller.selectStartDate(getPastDay(30));
                                controller.selectEndDate(getPastDay(0));
                              }),
                          RadioListTile(
                              dense: true,
                              activeColor: colorPrimary,
                              title: const Text(
                                'Custom Dates',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800),
                              ),
                              subtitle: controller.customRange.value.isEmpty
                                  ? null
                                  : Text(
                                      controller.customRange.value,
                                      style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600),
                                    ),
                              contentPadding: const EdgeInsets.all(0),
                              value: '5',
                              groupValue: controller.selectedDateType.value,
                              onChanged: (val) {
                                controller.getDateRange(val.toString());
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(
                      () => CustomButton(
                        buttonText: controller.viewTicketLabel.value,
                        onPressed: (controller
                                    .selectedCompany.value.isNotEmpty &&
                                controller.selectedLocation.value.isNotEmpty)
                            ? () {
                                controller.gotoTickets(
                                    allTicketApi,
                                    controller.isServiceEng.value
                                        ? 'Ticket Assigned'
                                        : 'Dashboard');
                              }
                            : null,
                        textSize: 15,
                        height: 38,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    !controller.isServiceEng.value
                        ? Obx(() => Column(
                              children: [
                                CustomButton(
                                  buttonText: controller.myTicketLabel.value,
                                  onPressed: (controller.selectedCompany.value
                                              .isNotEmpty &&
                                          controller.selectedLocation.value
                                              .isNotEmpty)
                                      ? () {
                                          controller.gotoTickets(
                                              myTicketApi, 'Ticket Created');
                                        }
                                      : null,
                                  textSize: 15,
                                  height: 38,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            ))
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 36,
                    ),
                  ],
                ),
              ),
            ),
            controller.isLoading.value
                ? Container(
                    width: Get.width,
                    height: Get.height,
                    color: Colors.white60,
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: colorPrimary,
                    )),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),

      floatingActionButton: controller.isB2c
          ? null
          : Obx(
              () => FloatingActionButton.small(
                  onPressed: () async {
                    var response =
                        await Get.toNamed(HDRoutes.TICKET_CREATE, arguments: {
                      'companyName': controller.selectedCompany.value,
                      'companyId': getId(controller.companyList.value,
                          controller.selectedCompany.value),
                      'locationName': controller.selectedLocation.value,
                      'locationId': getId(controller.locationList.value,
                          controller.selectedLocation.value),
                      "building": controller.selectedBuildingList.value,
                      "complaintType": controller.selectedTicketType.value,
                      "complaintId": getId(controller.ticketTypeList.value,
                          controller.selectedTicketType.value),
                    });

                    if (response != null && response["status"]) {
                      Get.toNamed(HDRoutes.TICKET_DETAIL, arguments: {
                        "complaintId": "${response['complaintId']}"
                      });
                    }
                  },
                  child: const Icon(Icons.add),
                  tooltip: controller.viewTicketLabel
                      .replaceAll("View", "Generate")),
            ),
    );
  }
}
