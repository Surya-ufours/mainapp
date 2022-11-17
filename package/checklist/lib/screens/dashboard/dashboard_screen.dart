import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:i2iutils/helpers/common_functions.dart';
import 'package:i2iutils/chart/department_chart.dart';
import 'package:i2iutils/chart/donut_chart.dart';
import 'package:i2iutils/widgets/spinner.dart';

import '../../helpers/colors.dart';
import '../../helpers/session.dart';
import 'dashboard_controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          CachedNetworkImage(
            imageUrl: controller.box.read(Session.userCompanyLogo),
            height: 25,
            width: 60,
            errorWidget: (_, __, ___) {
              return Image.asset(
                'assets/logo.png',
                height: 25,
                width: 60,
              );
            },
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                children: [
                  Obx(
                    () => controller.companyList.length <= 1
                        ? const SizedBox.shrink()
                        : Spinner(
                            controller.companyId.value,
                            controller.companyList,
                            onChanged: (val) {
                              debugPrint(val.toString());
                              if (controller.companyId.value != val) {
                                controller.companyId(val);
                                if (controller.locationList.isNotEmpty) {
                                  controller.changeCompany();
                                } else {
                                  controller.getLocation();
                                }
                              }
                            },
                          ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => Spinner(
                            controller.locationId.value,
                            controller.locationList,
                            onChanged: (val) {
                              debugPrint(val.toString());
                              if (controller.locationId.value != val) {
                                controller.locationId(val);
                                controller.getBuildings();
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: Obx(
                          () => Spinner(
                            controller.buildingid.value,
                            controller.buildingList,
                            onChanged: (val) {
                              debugPrint(val.toString());
                              if (controller.buildingid.value != val) {
                                controller.buildingid(val);
                                controller.getFloors();
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Obx(
                        () => Spinner(
                          controller.floorId.value,
                          controller.floorList,
                          onChanged: (val) {
                            debugPrint(val.toString());
                            if (controller.floorId.value != val) {
                              controller.floorId(val);
                              controller.getWings();
                            }
                          },
                        ),
                      )),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: Obx(
                          () => Spinner(
                            controller.wingId.value,
                            controller.wingList,
                            onChanged: (val) {
                              debugPrint(val.toString());
                              if (controller.wingId.value != val) {
                                controller.wingId(val);

                                if (controller.checkorlog.value == '1') {
                                  controller.getChecklist();
                                } else {
                                  controller.getLogsheet();
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Obx(
                    () => Spinner(
                      controller.selectedStatusTime.value,
                      controller.statusTime,
                      onChanged: (val) {
                        debugPrint(val.toString());

                        if (val == '1') {
                          controller.selectedTime = "24:00";
                        } else {
                          controller.selectedTime = getDate(format: "HH:mm");
                        }

                        if (controller.checkorlog.value == '1') {
                          controller.getChecklist();
                        } else {
                          controller.getLogsheet();
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Obx(
                    () => Spinner(
                      controller.checkorlog.value,
                      controller.status,
                      onChanged: (val) {
                        debugPrint(val.toString());
                        if (controller.checkorlog.value != val) {
                          controller.checkorlog(val);
                          if (val == '1') {
                            controller.getChecklist();
                          } else {
                            controller.getLogsheet();
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${getDate(format: 'dd MMM yyyy')} Report",
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
            const SizedBox(
              height: 12,
            ),
            Obx(() => controller.isLoading.value
                ? Center(child: const CircularProgressIndicator())
                : Column(
                    children: [
                      Obx(() => controller.dashboard.isEmpty
                          ? const Text('No Records')
                          : DonutChart(
                              values: controller.dashboard,
                              greenValue: double.parse(controller.dashboard[0]
                                          ['value']
                                      .replaceAll("%", "")) /
                                  100,
                            )),
                      Obx(
                        () => DepartmentChart((index) {
                          debugPrint('$index');
                          controller.selectedName(
                              controller.departments[index]['value']);
                          if(controller.checkorlog.value=='1') {
                            controller.filterChecklist(
                                controller.departments[index]['id']);
                          }else{
                            controller.filterLogsheet(
                                controller.departments[index]['id']);
                          }
                        }, departments: controller.departments.value),
                      ),
                      Obx(() => controller.selectedName.isEmpty
                          ? const SizedBox.shrink()
                          : Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Obx(() => Text(
                                              controller.selectedName.value))),
                                      Expanded(
                                        child: Obx(
                                          () => Spinner(
                                            controller.selectedPer.value,
                                            controller.percentage,
                                            onChanged: (val) {
                                              debugPrint(val.toString());
                                              if (controller
                                                      .selectedPer.value !=
                                                  val) {
                                                controller.selectedPer(val);
                                                if (controller.tempChecklists
                                                    .isNotEmpty) {
                                                  controller
                                                      .filterChecklistPercentage(
                                                          val);
                                                } else {
                                                  controller
                                                      .filterLogsheetPercentage(
                                                          val);
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Obx(
                                  () => controller.checkorlog.value != '1'
                                      ? const SizedBox.shrink()
                                      : controller.checklists.isEmpty
                                          ? Center(
                                              child: Text('No Records'),
                                            )
                                          : ListView.separated(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  controller.checklists.length,
                                              itemBuilder: (_, index) {
                                                return Container(
                                                  color: Colors.white,
                                                  padding: EdgeInsets.all(8),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          controller
                                                              .checklists[index]
                                                              .checkList,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 6,
                                                      ),
                                                      Row(
                                                        children: [
                                                          InkWell(
                                                            onTap:()=>controller.onChecklistClick(controller.checklists[index],true),
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                    width: 22,
                                                                    height: 22,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation(
                                                                              colorPrimary),
                                                                      value: double.parse(controller
                                                                              .checklists[index]
                                                                              .met) /
                                                                          100,
                                                                    )),
                                                                const SizedBox(
                                                                  height: 4,
                                                                ),
                                                                Text(
                                                                  controller
                                                                      .checklists[
                                                                          index]
                                                                      .met,
                                                                  style: TextStyle(
                                                                      color:
                                                                          colorPrimary,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          10),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 12,
                                                          ),
                                                          InkWell(
                                                            onTap:()=>controller.onChecklistClick(controller.checklists[index],false),
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                    width: 22,
                                                                    height: 22,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation(
                                                                              Colors.red),
                                                                      value: double.parse(controller
                                                                              .checklists[index]
                                                                              .notMet) /
                                                                          100,
                                                                    )),
                                                                const SizedBox(
                                                                  height: 4,
                                                                ),
                                                                Text(
                                                                  controller
                                                                      .checklists[
                                                                          index]
                                                                      .notMet,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          10),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(
                                                height: 4,
                                              ),
                                            ),
                                ),
                                Obx(
                                  () => controller.checkorlog.value != '2'
                                      ? const SizedBox.shrink()
                                      : controller.templates.isEmpty
                                          ? Center(
                                              child: Text('No Records'),
                                            )
                                          : ListView.separated(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  controller.templates.length,
                                              itemBuilder: (_, index) {
                                                return Container(
                                                  color: Colors.white,
                                                  padding: EdgeInsets.all(8),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          controller
                                                              .templates[index]
                                                              .categoryName,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 6,
                                                      ),
                                                      Row(
                                                        children: [
                                                          InkWell(
                                                            onTap:()=>controller.onLogsheetClick(controller.templates[index],true),
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                    width: 22,
                                                                    height: 22,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation(
                                                                              colorPrimary),
                                                                      value: double.parse(controller
                                                                              .templates[index]
                                                                              .met) /
                                                                          100,
                                                                    )),
                                                                const SizedBox(
                                                                  height: 4,
                                                                ),
                                                                Text(
                                                                  controller
                                                                      .templates[
                                                                          index]
                                                                      .met,
                                                                  style: TextStyle(
                                                                      color:
                                                                          colorPrimary,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          10),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 12,
                                                          ),
                                                          InkWell(
                                                            onTap:()=>controller.onLogsheetClick(controller.templates[index],false),
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                    width: 22,
                                                                    height: 22,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation(
                                                                              Colors.red),
                                                                      value: double.parse(controller
                                                                              .templates[index]
                                                                              .notMet) /
                                                                          100,
                                                                    )),
                                                                const SizedBox(
                                                                  height: 4,
                                                                ),
                                                                Text(
                                                                  controller
                                                                      .templates[
                                                                          index]
                                                                      .notMet,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          10),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(
                                                height: 4,
                                              ),
                                            ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                              ],
                            )),
                    ],
                  )),
          ],
        ),
      ),
    );
  }
}
