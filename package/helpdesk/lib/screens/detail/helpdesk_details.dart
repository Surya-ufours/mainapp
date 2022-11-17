import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/helpers/strings.dart';

import 'assign/assign_view.dart';
import 'helpdesk_details_controller.dart';
import 'history/history_view.dart';
import 'summary/summary_view.dart';

class HelpdeskDetail extends GetView<HelpdeskDetailsController> {
  HelpdeskDetail({Key? key}) : super(key: key);

  @override
  final controller = Get.put(HelpdeskDetailsController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.dispose();
        return true;
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Obx(
              () => Text(
                controller.ticket.value?.ticketNo ?? '',
                style: const TextStyle(fontSize: 15),
              ),
            ),
            actions: [
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
            bottom: const TabBar(indicatorColor: Colors.white, tabs: [
              Tab(
                text: 'Summary',
              ),
              Tab(
                text: 'Re-Assign',
              ),
              Tab(
                text: 'History',
              ),
            ]),
          ),
          body: TabBarView(
            children: [
              SummaryView(controller),
              controller.isAdmin.value
                  ? AssignView(controller)
                  : const Center(
                      child: Text('Only For Manager Role.'),
                    ),
              Obx(
                () => HistoryView(controller.isHistoryLoading.value, controller,
                    controller.histories),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
