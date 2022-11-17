import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/model/all_tickets_response.dart';

import '../../helpers/color.dart';
import 'package:i2iutils/helpers/hexcolor.dart';
import '../../routes/hd_app_routes.dart';

class TicketItem extends StatelessWidget {
  final Ticketdetails ticket;
  final dynamic controller;

  const TicketItem({Key? key, required this.ticket, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
