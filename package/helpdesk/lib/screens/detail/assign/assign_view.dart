import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/screens/detail/helpdesk_details_controller.dart';
import 'package:i2iutils/widgets/button.dart';
import 'package:helpdesk/widgets/shimmer/list_shimmer.dart';
import 'package:i2iutils/widgets/spinner.dart';

class AssignView extends StatelessWidget {
  const AssignView(
    this.controller, {
    Key? key,
  }) : super(key: key);

  final HelpdeskDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isHistoryLoading.value
        ? const Padding(
            padding: EdgeInsets.all(8.0),
            child: ListShimmer(1),
          )
        : Column(
            children: [
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.pin_drop_rounded),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(controller.ticket.value!.location),
                          ],
                        ),
                        Row(
                          children: [
                            Text(controller.ticket.value!.building),
                            const SizedBox(
                              width: 4,
                            ),
                            const Icon(Icons.location_city),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.app_registration),
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  '${controller.ticket.value!.floor} - ${controller.ticket.value!.wing}',
                                  maxLines: 2,
                                ),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                        Row(
                          children: [
                            _buildBadge(
                                controller.ticket.value!.compliantType[0]
                                            .toLowerCase() ==
                                        "i"
                                    ? Colors.red
                                    : Colors.amber,
                                controller.ticket.value!.compliantType),
                            const SizedBox(
                              width: 4,
                            ),
                            const Icon(Icons.style),
                          ],
                        ),
                      ],
                    ),
                    controller.isCustRef &&
                            (controller.ticket.value!.custRefNo ?? '')
                                .isNotEmpty
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.confirmation_number),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'Customer Ref - ${controller.ticket.value!.custRefNo}',
                                  ),
                                ],
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'Requested By ${controller.ticket.value!.requestorName}',
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.timer),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          controller.ticket.value!.requestTime,
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black45,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      'Assigned To',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w800),
                    ),
                    Text(controller.ticket.value!.assignedTo),
                    const SizedBox(
                      height: 6,
                    ),
                    /*controller.ticket.value.isClosed
                        ? Center(
                            child: Image.asset(
                            'assets/closed.png',
                            height: 100,
                          ))
                        : const SizedBox.shrink(),*/
                    /*!(controller.ticket.value.isClosed ||
                                controller.assignees.length < 2) &&
                            controller.assignees.isNotEmpty*/
                    controller.assignees.length > 1 &&
                            controller.statusList.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //available assignee
                              const Text(
                                'Available Assignee',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Spinner(
                                  controller.selectedAssignee.value,
                                  controller.assignees
                                      .map((element) => {
                                        'id':'${element.userid}',
                                    'value':element.name
                                  })
                                      .toList(),
                                  padding:
                                      const EdgeInsets.only(left: 20, right: 8),
                                  onChanged: (val) {
                                    if (val !=
                                        controller.selectedAssignee.value) {
                                      controller.selectedAssignee(val);
                                    }
                                  }),
                              Align(
                                alignment: Alignment.center,
                                child: CustomButton(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 24),
                                    width: 120,
                                    height: 30,
                                    textSize: 12,
                                    buttonColor: Colors.green,
                                    buttonText: 'Re-Assign',
                                    onPressed: () => controller.assignTicket()),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ));
  }

  _buildBadge(Color color, String text) {
    return text.isEmpty
        ? const SizedBox.shrink()
        : Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(4)),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          );
  }
}
