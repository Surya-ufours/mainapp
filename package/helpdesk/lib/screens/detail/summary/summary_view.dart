import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/helpers/color.dart';
import 'package:i2iutils/helpers/hexcolor.dart';
import 'package:helpdesk/model/status_list_response.dart';
import 'package:helpdesk/screens/detail/helpdesk_details_controller.dart';
import 'package:i2iutils/widgets/boxedittext.dart';
import 'package:i2iutils/widgets/button.dart';
import 'package:helpdesk/widgets/shimmer/list_shimmer.dart';
import 'package:i2iutils/widgets/spinner.dart';

class SummaryView extends StatelessWidget {
  const SummaryView(this.controller, {Key? key}) : super(key: key);

  final HelpdeskDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isHistoryLoading.value
        ? const Padding(
            padding: EdgeInsets.all(8.0),
            child: ListShimmer(1),
          )
        : SingleChildScrollView(
            child: Container(
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
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.ticket.value!.category.trim(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(controller.ticket.value!.subject.trim()),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          controller.open(controller.ticket.value!.imageLink);
                        },
                        child: CachedNetworkImage(
                          imageUrl: controller.ticket.value!.imageLink,
                          height: 70,
                          errorWidget: (_, __, ___) {
                            return Image.asset(
                              'assets/placeholder.png',
                              height: 70,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.black45),
                  Row(
                    children: [
                      const Icon(Icons.numbers),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        controller.ticket.value!.ticketNo.replaceAll("#", ''),
                        maxLines: 2,
                      ),
                    ],
                  ),
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
                          (controller.ticket.value!.custRefNo ?? '').isNotEmpty
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
                  controller.ticket.value!.reqEmail.isNotEmpty
                      ? Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.email),
                                const SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    controller.ticket.value!.reqEmail,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                  controller.ticket.value!.reqPhone.isNotEmpty
                      ? Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.phone),
                                const SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    controller.ticket.value!.reqPhone,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
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
                  controller.ticket.value!.escalationRemark.isEmpty
                      ? const SizedBox.shrink()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(color: Colors.black45),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Escalation Remark',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: colorPrimary),
                                ),
                                Text(
                                  controller.ticket.value!.escalationDateTime,
                                  style: const TextStyle(
                                    fontSize: 9,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              controller.ticket.value!.escalationRemark,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                  (controller.ticket.value!.ticketCost ?? '').isEmpty
                      ? const SizedBox.shrink()
                      : int.parse(controller.ticket.value!.ticketCost ?? '0') <=
                              0
                          ? const SizedBox.shrink()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.currency_rupee),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      controller.ticket.value!.ticketCost ?? '',
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                )
                              ],
                            ),
                  const Divider(color: Colors.black45),
                  //status and time
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildBadge(
                            HexColor(controller.ticket.value!.colorCode
                                .split('-')[1]),
                            controller.ticket.value!.status),
                        _buildBadge(
                            Colors.green, controller.ticket.value!.priority),
                        Obx(() => controller.timerText.isNotEmpty
                            ? _buildBadge(controller.timerColor.value,
                                controller.timerText.value)
                            : const SizedBox.shrink()),
                        _buildBadge(Colors.green,
                            controller.ticket.value!.compliantState),
                      ],
                    ),
                  ),
                  (controller.ticket.value!.compType.isEmpty &&
                          controller.ticket.value!.callType.isEmpty &&
                          controller.ticket.value!.reqType.isEmpty)
                      ? const SizedBox.shrink()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(color: Colors.black12),
                            SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildBadge(Colors.black87,
                                      controller.ticket.value!.compType),
                                  _buildBadge(
                                      Colors.black87,
                                      controller.ticket.value!.reqBy == 1
                                          ? 'Self'
                                          : controller.ticket.value!.reqBy == 2
                                              ? 'Others'
                                              : ''),
                                  _buildBadge(Colors.black87,
                                      controller.ticket.value!.callType),
                                  _buildBadge(Colors.black87,
                                      controller.ticket.value!.reqType),
                                ],
                              ),
                            ),
                          ],
                        ),
                  const Divider(color: Colors.black45),
                  Obx(
                    () => controller.statusList.isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Assigned To',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(controller.ticket.value!.assignedTo),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Assigned To',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(controller.ticket.value!.assignedTo),
                              (controller.assignees.length > 1 &&
                                      controller.isAdmin.value)
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //available assignee
                                        const SizedBox(
                                          height: 6,
                                        ),
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
                                            controller
                                                .selectedAssignee.value,
                                            controller.assignees
                                                .map((element) => {
                                              'id':'${element.userid}',
                                              'value':element.name
                                            })
                                                .toList(),
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 8,
                                                top: 8,
                                                bottom: 8),
                                            onChanged: (val) {
                                              if (val !=
                                                  controller
                                                      .selectedAssignee.value) {
                                                controller
                                                    .selectedAssignee(val);
                                              }
                                            }),
                                        const SizedBox(
                                          height: 6,
                                        )
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              const Divider(color: Colors.black45),
                              const Text(
                                'Change To',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                              ),
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.statusList.length,
                                  itemBuilder: (_, index) {
                                    return Obx(() => RadioListTile(
                                          title: Text(controller
                                              .statusList[index].status),
                                          activeColor: colorPrimary,
                                          value: controller.statusList[index],
                                          groupValue:
                                              controller.selectedStatus.value,
                                          onChanged: (val) {
                                            if (val != null) {
                                              val as StatusList;
                                              controller.selectedStatus(val);
                                              controller
                                                  .isCloseStatus(val.isClosed);
                                            }
                                          },
                                        ));
                                  }),
                              const Divider(color: Colors.black45),
                              Obx(
                                () => ((controller.selectedStatus.value
                                                ?.isClosed ??
                                            false) &&
                                        controller.isCostRequired.value)
                                    // () => controller.isCostRequired.value
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Ticket Cost',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          BoxEditText(
                                            placeholder: 'Rs',
                                            keyboardType: TextInputType.number,
                                            controller:
                                                controller.costController,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                        ],
                                      )
                                    : const SizedBox.shrink(),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: BoxEditText(
                                    placeholder: 'Enter Remark',
                                    maxLines: 3,
                                    controller: controller.remarkController,
                                  )),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  GestureDetector(
                                    onTap: () => controller.selectImage(),
                                    child: controller.submitImage.value != null
                                        ? Image.file(
                                            File(controller.submitImage.value!),
                                            height: 70,
                                          )
                                        : Image.asset(
                                            'assets/placeholder.png',
                                            height: 70,
                                          ),
                                  )
                                ],
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: CustomButton(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 24),
                                  width: 120,
                                  height: 30,
                                  textSize: 12,
                                  buttonColor: Colors.green,
                                  buttonText: 'Update',
                                  onPressed:
                                      controller.selectedStatus.value == null
                                          ? null
                                          : () => controller.updateTicket(),
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
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
