import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helpers/colors.dart';
import 'dashboard_detail_controller.dart';

class DashboardDetailScreen extends GetView<DashboardDetailController> {
  DashboardDetailScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(DashboardDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title, style: const TextStyle(fontSize: 17)),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.list.isEmpty
                ? const Center(child: Text('No Result Found'))
                : ListView.separated(
                    itemCount: controller.list.length,
                    itemBuilder: (_, index) {
                      var data = controller.list[index];
                      debugPrint(data.toString());
                      return Container(
                        color: Colors.grey.shade100,
                        padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.all(4),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    data['BuildingName'],
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        data['FloorName'],
                                        style: const TextStyle(fontSize: 13),
                                        textAlign: TextAlign.end,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Icon(
                                        Icons.pin_drop_outlined,
                                        color: Colors.green,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    data['WingName'],
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        data['slot'],
                                        style: const TextStyle(fontSize: 13),
                                        textAlign: TextAlign.end,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Icon(
                                        Icons.calendar_month,
                                        color: Colors.green,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    data['Status'].toString().toLowerCase() ==
                                            'true'
                                        ? 'Status : Scanned\n${data['Percentage']} Completed'
                                        : (data['deviceguid'].isNotEmpty &&
                                                data['Percentage'] != null)
                                            ? 'Status : Scanned\n${data['Percentage']} Not Completed'
                                            : 'Status : Not Completed',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: (data['Status']
                                                        .toString()
                                                        .toLowerCase() ==
                                                    'true' ||
                                                data['Status'].toString() ==
                                                    '1')
                                            ? colorPrimary
                                            : Colors.red,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                (data['Status'].toString().toLowerCase() ==
                                            'true' ||
                                        data['Status'].toString() == '1')
                                    ? Expanded(
                                        child: InkWell(
                                          onTap: () => controller
                                                  .args['isChecklist']
                                              ? controller
                                                  .downloadCheckReport(data)
                                              : controller.downloadLogReport(
                                                  data['deviceguid']),
                                          child: const Text(
                                            'View / Download Report',
                                            style: TextStyle(
                                              fontSize: 12,
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Colors.blueAccent,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink()
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(
                      height: 6,
                    ),
                  ),
      ),
    );
  }
}
