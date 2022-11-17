import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/helpers/color.dart';
import 'package:i2iutils/helpers/hexcolor.dart';
import 'package:helpdesk/helpers/strings.dart';
import 'package:helpdesk/model/all_tickets_response.dart';
import 'package:helpdesk/routes/hd_app_routes.dart';
import 'package:helpdesk/screens/tickets/ticket_item.dart';
import 'package:helpdesk/widgets/shimmer/list_shimmer.dart';

import 'ticket_controller.dart';

class TicketScreen extends GetView<TicketController> {
  TicketScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(TicketController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(controller.args['title']),
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
                    Text('${controller.args['companyName']}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    Text('${controller.args['locationName']}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text('${controller.args['duration']}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
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
            Expanded(
              child: controller.isLoading.value
                  ? ListShimmer(6)
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
      floatingActionButton: controller.isB2c
          ? null
          : FloatingActionButton.small(
              onPressed: () async {
                var res = await Get.toNamed(HDRoutes.TICKET_CREATE, arguments: {
                  'companyName': controller.args['companyName'],
                  'companyId': int.parse(controller.args['companyid']),
                  'locationName': controller.args['locationName'],
                  'locationId': int.parse(controller.args['locationid']),
                  "building": controller.args['building'],
                  "complaintType": controller.args['complaintType'],
                  "complaintId": int.parse(controller.args['ticketType']),
                });

                if (res != null && res["status"]) {
                  controller.getTicket();
                  Get.toNamed(HDRoutes.TICKET_DETAIL,
                      arguments: {"complaintId": "${res['complaintId']}"});
                }
              },
              child: const Icon(Icons.add),
              tooltip: "Generate Ticket",
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

  _buildTicketItem(Ticketdetails ticket) {
    return GestureDetector(
      onTap: () async {
        var res = await Get.toNamed(HDRoutes.TICKET_DETAIL,
            arguments: {'complaintId': '${ticket.complaintId}'});
        if (res != null && res) {
          controller.getTicket();
        }
      },
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(
              color: HexColor(ticket.colorCode.split('-')[1]), width: 2),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ticket.ticketType.isEmpty
                          ? const SizedBox.shrink()
                          : _buildBadge(Colors.green, ticket.ticketType[0]),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        ticket.ticketNo,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Text(
                  ticket.requestTime,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text(ticket.category)),
                const SizedBox(
                  width: 2,
                ),
                Row(
                  children: [
                    ticket.compliantType.isEmpty
                        ? const SizedBox.shrink()
                        : _buildBadge(
                            ticket.compliantType[0].toLowerCase() == "i"
                                ? Colors.red
                                : Colors.amber,
                            ticket.compliantType[0]),
                    const SizedBox(
                      width: 4,
                    ),
                    _buildBadge(Colors.green, ticket.priority),
                    const SizedBox(
                      width: 4,
                    ),
                    _buildBadge(HexColor(ticket.colorCode.split('-')[1]),
                        ticket.status),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    ticket.subject,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                )
              ],
            ),
            ticket.escalationRemark.isEmpty && !ticket.hadEscalation
                ? const SizedBox.shrink()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(color: Colors.black45),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ticket.escalationRemark.isEmpty
                                ? ''
                                : 'Escalation Remark',
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: colorPrimary),
                          ),
                          ticket.hadEscalation
                              ? GestureDetector(
                                  onTap: () {
                                    controller.escalateTicket(ticket);
                                  },
                                  child: const Text(
                                    'Escalate My Ticket?',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w800,
                                        color: colorPrimary,
                                        decoration: TextDecoration.underline,
                                        letterSpacing: 1),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                      ticket.escalationRemark.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ticket.escalationRemark,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  ticket.escalationDateTime,
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  _buildBadge(Color color, String text) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
      ),
    );
  }
}
