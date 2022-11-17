import 'package:animated_widgets/animated_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/api/urls.dart';
import 'package:helpdesk/helpers/color.dart';
import 'package:helpdesk/helpers/strings.dart';
import 'package:helpdesk/helpers/utils.dart';
import 'package:helpdesk/routes/hd_app_routes.dart';
import 'package:helpdesk/screens/tickets/ticket_item.dart';
import 'package:i2iutils/widgets/button.dart';
import 'package:i2iutils/helpers/hexcolor.dart';
import 'package:helpdesk/widgets/search_dropdown.dart';
import 'package:helpdesk/widgets/shimmer/list_shimmer.dart';

import '../../widgets/multi_dropdown.dart';
import 'b2c_home_controller.dart';

class B2CHomeScreen extends GetView<B2CHomeController> {
  B2CHomeScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(B2CHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        // leading: null,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 15
          ),
        ),
        actions: [
          Obx(() =>
              (controller.fData.value?.feedbackdetails?.isNotEmpty ?? false)
                  ? GestureDetector(
                      onTap: () async {
                        if (controller.fData.value == null) return;
                        var res = await Get.toNamed(HDRoutes.FEEDBACK,
                            arguments: controller.fData.value);
                        if (res != null) {
                          controller.fData.value?.feedbackdetails = res;
                          controller.fData.refresh();
                        }
                      },
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Center(
                              child: ShakeAnimatedWidget(
                                enabled: true,
                                duration: const Duration(milliseconds: 1500),
                                shakeAngle: Rotation.deg(z: 30),
                                curve: Curves.linear,
                                child: Image.asset(
                                  'assets/smiley.png',
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 6,
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  '${controller.fData.value?.feedbackdetails?.length.toString().padLeft(2, '0')}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
                  : const SizedBox.shrink()),
          CachedNetworkImage(
            imageUrl: '${controller.box.read(LOGO)}',
            width: 90,
            errorWidget: (_, __, ___) {
              return Image.asset(
                'assets/logo.png',
                color: Colors.white,
                width: 50,
              );
            },
          ),
        ],
      ),
      body: Obx(
        () => Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                margin: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: true,
                      child: Column(
                        children: [
                          SearchDropDown(controller.companyList,
                              controller.selectedCompany.value,
                              prefix: const Icon(Icons.home_work),
                              isEnabled: controller.companyList.length != 1,
                              onChanged: (val) {
                            if (val != null &&
                                val != controller.selectedCompany.value) {
                              controller.selectedCompany(val);
                              var companyId = getId(
                                  controller.companyList.value,
                                  controller.selectedCompany.value);
                              controller.setupLocation();
                              controller.getTicketType('$companyId');
                            }
                          },containerColor: HexColor("DADADA"),),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: true,
                      child: Column(
                        children: [
                          SearchDropDown(controller.locationList,
                              controller.selectedLocation.value,
                              prefix: const Icon(Icons.pin_drop_rounded),
                              isEnabled: controller.locationList.length != 1,
                              onChanged: (val) {
                            if (val != null &&
                                val != controller.selectedLocation.value) {
                              controller.selectedLocation(val);
                              controller.setupBuilding();
                            }
                          },containerColor: HexColor("DADADA"),),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: true,
                        child: MultiDropDown(
                          controller.selectedBuildingList
                              .map((e) => e.building)
                              .toList(),
                          prefix: const Icon(Icons.location_city),
                          onTab: controller.buildingList.isEmpty
                              ? null
                              : () => controller.showBuilding(),
                          containerColor: HexColor("DADADA"),
                        ),
                      ),
                    ),
                    Obx(() => controller.canShowType.value
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: HexColor("DADADA"),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.only(
                                    left: 12, right: 0, bottom: 8, top: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('CALL FOR STACK',style: TextStyle(fontSize: 9),),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Obx(
                                      () => Wrap(
                                        spacing: 12,
                                        runSpacing: 12,
                                        children: List.generate(
                                          controller.ticketTypeList.length,
                                          (index) {
                                            return InkWell(
                                              onTap: () {
                                                String val = controller
                                                    .ticketTypeList
                                                    .keys
                                                    .elementAt(index);
                                                if (val !=
                                                    controller
                                                        .selectedTicketType
                                                        .value) {
                                                  controller
                                                      .selectedTicketType(
                                                      val);
                                                  controller
                                                      .viewTicketLabel(
                                                      "View ${val.split(' (')[0]} Ticket");
                                                  controller
                                                      .myTicketLabel(
                                                      "My ${val.split(' (')[0]} Ticket");
                                                  controller
                                                      .getTicket();
                                                }
                                              },
                                              child: Container(
                                                padding:
                                                const EdgeInsets
                                                    .symmetric(
                                                    vertical: 8,
                                                    horizontal:
                                                    12),
                                                margin:
                                                const EdgeInsets
                                                    .symmetric(
                                                    horizontal:
                                                    4),
                                                decoration: BoxDecoration(
                                                    color: (controller
                                                        .ticketTypeList
                                                        .keys
                                                        .elementAt(
                                                        index) ==
                                                        controller
                                                            .selectedTicketType
                                                            .value)
                                                        ? Colors
                                                        .black87
                                                        : Colors
                                                        .white),
                                                child: Text(
                                                  controller
                                                      .ticketTypeList
                                                      .keys
                                                      .elementAt(
                                                      index),
                                                  style: TextStyle(
                                                      color: (controller
                                                          .ticketTypeList
                                                          .keys
                                                          .elementAt(
                                                          index) ==
                                                          controller
                                                              .selectedTicketType
                                                              .value)
                                                          ? Colors
                                                          .white
                                                          : Colors
                                                          .black,
                                                      fontSize: 10),
                                                ),
                                              ),
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink()),

                    /*Obx(() => controller.canShowType.value
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              const Text('CALL FOR STACK',style: TextStyle(fontSize: 10),),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.06),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: SizedBox(
                                  height: 90,
                                  child: Swiper(
                                    itemBuilder: (BuildContext context, int i) {
                                      var startIndex = i * 4;

                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: List.generate(
                                            4,
                                            (ii) {
                                              var index = startIndex + ii;

                                              return index >=
                                                      controller
                                                          .ticketTypeList.length
                                                  ? const SizedBox.shrink()
                                                  : Obx(() => InkWell(
                                                        onTap: () {
                                                          String val = controller
                                                              .ticketTypeList
                                                              .keys
                                                              .elementAt(index);
                                                          if (val !=
                                                              controller
                                                                  .selectedTicketType
                                                                  .value) {
                                                            controller
                                                                .selectedTicketType(
                                                                    val);
                                                            controller
                                                                .viewTicketLabel(
                                                                    "View $val Ticket");
                                                            controller
                                                                .myTicketLabel(
                                                                    "My $val Ticket");
                                                            controller
                                                                .getTicket();
                                                          }
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 8,
                                                                  horizontal:
                                                                      12),
                                                          margin:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      4),
                                                          decoration: BoxDecoration(
                                                              color: (controller
                                                                          .ticketTypeList
                                                                          .keys
                                                                          .elementAt(
                                                                              index) ==
                                                                      controller
                                                                          .selectedTicketType
                                                                          .value)
                                                                  ? Colors
                                                                      .black87
                                                                  : Colors
                                                                      .white),
                                                          child: Text(
                                                            controller
                                                                .ticketTypeList
                                                                .keys
                                                                .elementAt(
                                                                    index),
                                                            style: TextStyle(
                                                                color: (controller
                                                                            .ticketTypeList
                                                                            .keys
                                                                            .elementAt(
                                                                                index) ==
                                                                        controller
                                                                            .selectedTicketType
                                                                            .value)
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontSize: 10),
                                                          ),
                                                        ),
                                                      ));
                                            },
                                          ).toList(),
                                        ),
                                      );
                                    },
                                    control: const SwiperControl(
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    itemCount:
                                        (controller.ticketTypeList.length / 4)
                                            .toDouble()
                                            .ceil(),
                                    scrollDirection: Axis.vertical,
                                    indicatorLayout: PageIndicatorLayout.NONE,
                                    loop: false,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink()),*/
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('LIVE TASK SUMMARY', style: TextStyle(fontSize: 9),),
                    const SizedBox(
                      height: 12,
                    ),
                    Obx(
                      () => controller.isTicketLoading.value
                          ? const SizedBox(height: 200, child: ListShimmer(3))
                          : controller.tickets.isEmpty
                              ? const Padding(
                                  padding: EdgeInsets.all(12),
                                  child:
                                      Center(child: Text('No Live Task Found')),
                                )
                              : SizedBox(
                                  height: Get.width*0.55,
                                  child: Swiper(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: TicketItem(
                                            ticket: controller.tickets[index],
                                            controller: controller),
                                      );
                                    },
                                    itemCount: controller.tickets.length,
                                    control: const SwiperControl(
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    loop: false,
                                    autoplay: controller.isAutoPlay.value,
                                    autoplayDelay: 5000,
                                    viewportFraction: 0.8,
                                    scale: 0.8,
                                    indicatorLayout: PageIndicatorLayout.NONE,
                                    onIndexChanged: (i){
                                      controller.isAutoPlay(i!=(controller.tickets.length-1));
                                    },

                                  ),
                                ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: HexColor("DADADA"),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 8, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'DATEWISE FILTER',
                              style: TextStyle(fontSize: 9),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildDate(
                                  controller.todayDate.value.split(" ")[0],
                                  'Today',
                                  Icons.calendar_today_rounded,
                                  1, () {
                                if (controller.selectedTicketType.value !=
                                    '1') {
                                  controller.label =
                                      'Today ${controller.todayDate.value}';
                                  controller.selectedDateType('1');
                                  controller.selectStartDate(getPastDay(0));
                                  controller.selectEndDate(getPastDay(0));
                                }
                              }),
                              const SizedBox(
                                width: 4,
                              ),
                              _buildDate(
                                  controller.yesterday.value.split(" ")[0],
                                  'Yesterday',
                                  Icons.calendar_today_rounded,
                                  2, () {
                                if (controller.selectedTicketType.value !=
                                    '2') {
                                  controller.label =
                                      'Yesterday ${controller.yesterday.value}';

                                  controller.selectedDateType('2');
                                  controller.selectStartDate(getPastDay(1));
                                  controller.selectEndDate(getPastDay(1));
                                }
                              }),
                              const SizedBox(
                                width: 4,
                              ),
                              _buildDate('', 'Last 7 Days',
                                  Icons.calendar_month_rounded, 3, () {
                                if (controller.selectedTicketType.value !=
                                    '3') {
                                  controller.label =
                                      'Last 7 Days (${controller.lastSevenDays.value})';

                                  controller.selectedDateType('3');
                                  controller.selectStartDate(getPastDay(7));
                                  controller.selectEndDate(getPastDay(0));
                                }
                              }),
                              const SizedBox(
                                width: 4,
                              ),
                              _buildDate('', 'Last 30 Days',
                                  Icons.calendar_month_rounded, 4, () {
                                if (controller.selectedTicketType.value !=
                                    '4') {
                                  controller.label =
                                      'Last 30 Days (${controller.lastThirtyDays.value})';

                                  controller.selectedDateType('4');
                                  controller.selectStartDate(getPastDay(30));
                                  controller.selectEndDate(getPastDay(0));
                                }
                              }),
                            ],
                          ),
                          Center(
                            child: SizedBox(
                              width: Get.width*0.55,
                              child: RadioListTile(
                                  dense: true,
                                  activeColor: colorPrimary,
                                  title: const Text(
                                    'Custom Dates',
                                    style: TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.w800),
                                  ),
                                  subtitle: controller.customRange.value.isEmpty
                                      ? null
                                      : Text(
                                          controller.customRange.value,
                                          style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600),
                                        ),
                                  contentPadding: const EdgeInsets.all(0),
                                  value: '5',
                                  groupValue: controller.selectedDateType.value,
                                  onChanged: (val) {
                                    controller.getDateRange(val.toString());
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(
                      () => CustomButton(
                        buttonText: controller.viewTicketLabel.value,
                        onPressed: (controller
                                    .selectedCompany.value.isNotEmpty &&
                                controller.selectedLocation.value.isNotEmpty)
                            ? () {
                                controller.gotoTickets(
                                    allTicketApi,
                                    controller.isServiceEng.value
                                        ? 'Ticket Assigned'
                                        : 'Dashboard');
                              }
                            : null,
                        textSize: 15,
                        height: 38,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    !controller.isServiceEng.value
                        ? Column(
                              children: [
                                CustomButton(
                                  buttonText: 'My Ticket', //controller.myTicketLabel.value
                                  onPressed: (controller.selectedCompany.value
                                              .isNotEmpty &&
                                          controller.selectedLocation.value
                                              .isNotEmpty)
                                      ? () {
                                          controller.gotoTickets(
                                              myTicketApi, 'Ticket Created');
                                        }
                                      : null,
                                  textSize: 15,
                                  height: 38,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 36,
                    ),
                  ],
                ),
              ),
            ),
            controller.isLoading.value
                ? Container(
                    width: Get.width,
                    height: Get.height,
                    color: Colors.white60,
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: colorPrimary,
                    )),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  _buildDate(
      String date, String title, IconData icon, int id, Function() onTab) {
    bool isSelected = controller.selectedDateType.value == '$id';
    return Expanded(
      child: InkWell(
        onTap: onTab,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: isSelected
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                )
              : null,
          child: Column(
            children: [
              Stack(
                children: [
                  Icon(
                    icon,
                    size: 30,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                  Positioned(
                      top: 5,
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          date,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontSize: 10
                          ),
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: isSelected ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
