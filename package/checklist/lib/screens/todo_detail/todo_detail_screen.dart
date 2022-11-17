import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helpers/colors.dart';
import 'todo_detail_controller.dart';

class TodoDetailScreen extends GetView<TodoDetailController> {
  TodoDetailScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(TodoDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.args['todo']['categoryname'],
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.list.isEmpty
                ? Center(child: const Text('No Result Found'))
                : ListView.separated(
                    itemCount: controller.list.length,
                    itemBuilder: (_, index) {
                      var data = controller.list[index];
                      int start = int.parse(data['slot'].split("-")[0].split(":")[0]);
                      int end = int.parse(data['slot'].split("-")[1].split(":")[0]);
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
                                    style: TextStyle(
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
                                        style: TextStyle(fontSize: 13),
                                        textAlign: TextAlign.end,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Icon(
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
                                    style: TextStyle(fontSize: 13),
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
                                        style: TextStyle(fontSize: 13),
                                        textAlign: TextAlign.end,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Icon(
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
                                    data['iscompleted']
                                        ? 'Status : Scanned'
                                        : (controller.args['isMissingSlot'] || controller.CH>=end)
                                            ? 'Status : Missed'
                                            : 'Status : Not Completed',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: data['iscompleted']
                                            ? colorPrimary
                                            : Colors.red,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                data['iscompleted'] ? const SizedBox.shrink() : (controller.CH >= start && controller.CH < end) ?Expanded(
                                  child: InkWell(
                                    onTap: () => controller.scanQR(),
                                    child: Text(
                                      'Scan Barcode',
                                      style: TextStyle(
                                          fontSize: 12,
                                          decoration: TextDecoration.underline,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.3),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ) : const SizedBox.shrink()
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
