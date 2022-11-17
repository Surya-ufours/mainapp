import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:i2iutils/helpers/hexcolor.dart';

import '../../helpers/session.dart';
import '../../model/all_tickets_response.dart';
import 'helpdesk_controller.dart';
import 'ticket_item.dart';

class HelpdeskScreen extends GetView<HelpdeskController> {
  HelpdeskScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(HelpdeskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Helpdesk'),
        bottom: PreferredSize(
          preferredSize: Size(Get.width, 50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${controller.box.read(Session.userCompanyName)}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    Text('${controller.box.read(Session.userLocationName)}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(()=>Text('${controller.fromDate} to ${controller.toDate}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700))),
                    InkWell(
                        onTap: () => controller.changeDate(),
                        child: const Text(
                          'Change Dates',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600,decoration: TextDecoration.underline,fontSize: 12),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
        actions: [
          CachedNetworkImage(
            imageUrl: '${controller.box.read(Session.userCompanyLogo)}',
            width: 50,
            errorWidget: (_, __, ___) {
              return Image.asset(
                'assets/logo.png',
                color: Colors.white,
                width: 50,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller.getTicket();
            },
          ),
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        controller.statusDetails.isEmpty
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text('No Records Found')),
                              )
                            : SizedBox(
                                height: 90,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.statusDetails.length,
                                  itemBuilder: (_, index) {
                                    Statusdetails status =
                                        controller.statusDetails[index];
                                    return _buildStatusWidget(status);
                                  },
                                ),
                              ),
                        const SizedBox(
                          height: 8,
                        ),
                        controller.tickets.isEmpty
                            ? const Padding(
                                padding: EdgeInsets.all(16),
                                child: Center(child: Text('No Records Found')),
                              )
                            : Expanded(
                                child: RefreshIndicator(
                                  onRefresh: () async {
                                    await controller.getTicket();
                                  },
                                  child: ListView.builder(
                                    itemCount: controller.tickets.length,
                                    itemBuilder: (_, index) {
                                      Ticketdetails ticket =
                                          controller.tickets[index];
                                      // return _buildTicketItem(ticket);
                                      return TicketItem(
                                          ticket: ticket,
                                          controller: controller);
                                    },
                                  ),
                                ),
                              ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  _buildStatusWidget(Statusdetails status) {
    return GestureDetector(
      onTap: () {
        controller.onStatusChange(status);
      },
      child: Obx(
        () => Card(
          color: controller.selectedStatusId.value == status.statusid
              ? HexColor(status.colorcode.split('-')[1])
              : null,
          margin: const EdgeInsets.all(4),
          elevation:
              controller.selectedStatusId.value == status.statusid ? 6 : 1,
          shadowColor: controller.selectedStatusId.value == status.statusid
              ? HexColor(status.colorcode.split('-')[1])
              : null,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: SizedBox(
            width: 110,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${status.tickets}',
                    style: TextStyle(
                        color:
                            controller.selectedStatusId.value == status.statusid
                                ? Colors.white
                                : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    status.status,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color:
                            controller.selectedStatusId.value == status.statusid
                                ? Colors.white
                                : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
