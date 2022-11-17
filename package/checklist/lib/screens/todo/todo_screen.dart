import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:i2iutils/widgets/spinner.dart';

import '../../helpers/colors.dart';
import '../../helpers/session.dart';
import 'todo_controller.dart';

class TodoScreen extends GetView<TodoController> {
  TodoScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("to-do's"),
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
            const SizedBox(
              height: 8,
            ),
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
                    () => controller.companyList.length <=1
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

                                controller.progressTodo();
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
                        if (controller.selectedStatusTime.value != val) {
                          controller.selectedStatusTime(val);
                          //big process
                          controller.onChangeStatusTime();
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Obx(
                    () => Spinner(
                      controller.selectedStatus.value,
                      controller.status.value,
                      onChanged: (val) {
                        debugPrint(val.toString());
                        if (controller.selectedStatus.value != val) {
                          controller.isMissingSlot = val == '3';
                          controller.selectedStatus(val);
                          controller.progressTodo();
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
                          controller.selectedDeptId.value,
                          controller.departmentList,
                          onChanged: (val) {
                            debugPrint(val.toString());
                            if (controller.selectedDeptId.value != val) {
                              controller.selectedDeptId(val);
                              controller.progressTodo();
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
                            controller.checkorlog.value,
                            controller.type,
                            onChanged: (val) {
                              debugPrint(val.toString());
                              if (controller.checkorlog.value != val) {
                                controller.checkorlog(val);
                                controller.progressTodo();
                              }
                            },
                          ),
                        ),
                      ),
                    ],
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
            Obx(
              () => controller.isLoading.value
                  ? Center(child: const CircularProgressIndicator())
                  : controller.list.isEmpty
                      ? const Center(
                          child: Text('No Record Found'),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.list.length,
                          itemBuilder: (_, index) {
                            return ListTile(
                              onTap: () => controller
                                  .moveToDetail(controller.list[index]),
                              tileColor: Colors.grey.shade100,
                              dense: true,
                              title: Text(
                                '${controller.list[index]['categoryname']}',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                '${controller.list[index]['auditname']}',
                              ),
                              leading: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: colorPrimary,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                    child: Text(
                                  '${controller.list[index]['SlotsCount']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                              ),
                              trailing: Image.asset(
                                controller.list[index]['iscompleted'] == 2
                                    ? 'assets/ok.png'
                                    : 'assets/retry.png',
                                width: 25,
                              ),
                            );
                          },
                          separatorBuilder: (_, __) => const SizedBox(
                            height: 4,
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
