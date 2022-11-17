import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helpdesk/api/helpdesk_api_calls.dart';
import 'package:helpdesk/helpers/loader.dart';
import 'package:helpdesk/helpers/strings.dart';
import 'package:helpdesk/helpers/utils.dart';
import 'package:helpdesk/model/feedback_tickets_response.dart';
import 'package:helpdesk/model/helpdesk_login_response.dart';
import 'package:helpdesk/routes/hd_app_routes.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../api/urls.dart';
import '../../helpers/notification.dart';
import '../../model/all_tickets_response.dart';
import 'package:i2iutils/widgets/boxedittext.dart';
import 'package:i2iutils/widgets/button.dart';

class B2CHomeController extends GetxController {
  RxString image = "".obs;
  RxBool isLoading = false.obs;
  RxBool isServiceEng = false.obs;
  RxBool isAdmin = false.obs;
  RxBool isSuperAdmin = false.obs;

  int userId = -1;

  RxMap<String, int> companyList = RxMap();
  RxMap<String, int> locationList = RxMap();
  RxList<Buildingdetails> buildingList = RxList();
  List<Buildingdetails> buildings = [];
  RxMap<String, int> ticketTypeList = RxMap();

  RxString selectedCompany = "".obs;
  RxString selectedLocation = "".obs;
  RxList<Buildingdetails> selectedBuildingList = RxList();
  var allBuildingDetails = Buildingdetails(0, 0, "All Building", "AB");
  RxString selectedTicketType = "All".obs;

  RxString todayDate = "".obs;
  RxString yesterday = "".obs;
  RxString lastSevenDays = "".obs;
  RxString lastThirtyDays = "".obs;
  RxString customRange = "".obs;

  RxString selectedDateType = "1".obs;
  RxString selectStartDate = ''.obs;
  RxString selectEndDate = ''.obs;
  String label = '';
  DateTimeRange? dateRange;
  bool isShowFeedback = Get.arguments ?? false;
  RxBool canShowType = false.obs;

  //for feedback
  Rx<FeedbackTicketData?> fData = Rx(null);

  final box = GetStorage();

  RxString viewTicketLabel = "View Ticket".obs, myTicketLabel = "My Ticket".obs;
  RxList<Ticketdetails> tickets = RxList();
  RxBool isTicketLoading = false.obs;

  RxBool isAutoPlay=true.obs;

  @override
  void onInit() async {
    super.onInit();
    userId = box.read(USER_ID) ?? -1;
    isAdmin(box.read(IS_ADMIN) ?? false);
    isSuperAdmin(box.read(IS_ADMIN) ?? false);
    isServiceEng(box.read(IS_SE) ?? false);
    setupCompany();
    await getSettings();
    getTicket();
  }

  @override
  void onReady() async {
    super.onReady();
    todayDate(getTodayDate());
    yesterday(getYesterdayDate());
    lastSevenDays(getLastSevenDays());
    lastThirtyDays(getLastThirtyDays());
    label = 'Today ${todayDate.value}';

    selectStartDate(getPastDay(0));
    selectEndDate(getPastDay(0));

    /*final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationPlugin.getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails != null &&
        notificationAppLaunchDetails.didNotificationLaunchApp) {
      // showToastMsg('Payload ${notificationAppLaunchDetails.payload}');
      if (notificationAppLaunchDetails.payload != null) {
        Get.toNamed(Routes.TICKET_DETAIL,
            arguments: {'complaintId': notificationAppLaunchDetails.payload});
      }
    }*/
  }

  getSettings() async {
    if (await isNetConnected()) {
      var response = await HelpdeskApiCall().getSettings('$userId');
      if (response != null) {
        box.write(IS_COST_REQ, response['CostIncurred']);
        box.write(IS_CUST_REF, response['CustRefNo']);
        box.write(IS_REQ_TYPE, response['RequestType'] ?? false);
        box.write(CAN_SHOW_GAL_OPT, response['GalleryOption'] ?? false);
        canShowType(response['ComplaintType'] ?? false);
        box.write(CAN_SHOW_COMP_TYPE, canShowType.value);
        box.write(EMP_ID, response['RequestorID']);

        if (response['Password'] != null &&
            response['Password'].trim() != box.read(USER_PASSWORD)) {
          /*logout(
              isDismiss: false,
              msg: 'Password has been changed.\nTo continue please re-login');*/
        }

        box.write(CAN_SHOW_REQ_BY,
            response['CanShowReqBy'] ?? (isAdmin.value || isSuperAdmin.value));

        int compid = getId(companyList.value, selectedCompany.value);
        if (canShowType.value) await getTicketType('$compid');
      }
    }
  }

  setupCompany() {
    var temp = jsonDecode(box.read(COMP_LIST) ?? '[]') as List;
    log(temp.toString());
    List<Companydetails> companies =
        temp.map((e) => Companydetails.fromJson(e)).toList();
    companyList.clear();
    if (companies.length > 1 || companies.isEmpty) {
      companyList.addAll({'All Company': 0});
    }
    if (companies.isNotEmpty) {
      companyList.addAll({for (var e in companies) e.company: e.companyId});
    }
    selectedCompany(companyList.keys.elementAt(companyList.length > 1 ? 1 : 0));
    setupLocation();
  }

  setupLocation() {
    int compid = getId(companyList.value, selectedCompany.value);

    var temp = jsonDecode(box.read(LOC_LIST) ?? '[]') as List;
    List<Locationdetails> locations =
        temp.map((e) => Locationdetails.fromJson(e)).toList();

    if (compid != 0) {
      locations.removeWhere((element) => element.companyId != compid);
    }

    locationList.clear();
    if (locations.length > 1 || locations.isEmpty) {
      locationList.addAll({'All Location': 0});
    }
    if (locations.isNotEmpty) {
      locationList.addAll({for (var e in locations) e.location: e.locationId});
    }
    selectedLocation(
        locationList.keys.elementAt(locationList.length > 1 ? 1 : 0));
    setupBuilding();
  }

  setupBuilding() {
    int locId = getId(locationList.value, selectedLocation.value);

    buildingList.clear();
    var temp = jsonDecode(box.read(BUILDING_LIST) ?? '[]') as List;
    buildings = temp.map((e) => Buildingdetails.fromJson(e)).toList();

    if (locId != 0) {
      buildings.removeWhere((element) => element.locationId != locId);
    }

    buildingList.addAll(buildings);
    selectedBuildingList(buildingList);
  }

  void showBuilding() async {
    await showDialog(
      context: Get.context!,
      builder: (ctx) {
        return MultiSelectDialog(
          items:
              buildingList.map((e) => MultiSelectItem(e, e.building)).toList(),
          initialValue: selectedBuildingList,
          onConfirm: (values) {
            selectedBuildingList(values as List<Buildingdetails>);
            getTicket();
          },
        );
      },
    );
  }

  getTicketType(String companyId) async {
    if (await isNetConnected()) {
      isLoading(true);
      try {
        var response = await HelpdeskApiCall().getTicketTypes(companyId);
        ticketTypeList.clear();
        if (response != null) {
          if (response.status) {
            if (response.requestType.length > 1 ||
                response.requestType.isEmpty) {
              ticketTypeList.addAll({'All': 0});
            }
            ticketTypeList.addAll(
                {for (var e in response.requestType) e.type: e.ticketTypeId});
          }
          selectedTicketType(ticketTypeList.keys.elementAt(0));
          viewTicketLabel("View ${selectedTicketType.value} Ticket");
          myTicketLabel("My ${selectedTicketType.value} Ticket");
        }
      } catch (e) {
        debugPrint(e.toString());
      }
      isLoading(false);
    }
  }

  getDateRange(String val) async {
    dateRange = await customDateRange(dateRange);
    if (dateRange == null) return;

    selectStartDate(formatter.format(dateRange!.start));
    selectEndDate(formatter.format(dateRange!.end));

    customRange('${selectStartDate.value} - ${selectEndDate.value}');
    selectedDateType(val);
    label = 'Custom Days (${customRange.value})';
  }

  gotoTickets(String api, String title) {
    if (canShowType.value && selectedTicketType.isEmpty) {
      showToastMsg('Select Ticket Type');
      return;
    }

    if (selectedBuildingList.isEmpty) {
      showToastMsg('Select Building');
      return;
    }

    var params = {
      'companyName': selectedCompany.value,
      'companyid': '${getId(companyList.value, selectedCompany.value)}',
      'locationName': selectedLocation.value,
      'locationid': '${getId(locationList.value, selectedLocation.value)}',
      'duration': label,
      'userid': '$userId',
      'TicketDate':
          sendFormatter.format(formatter.parse(selectStartDate.value)),
      'enddate': sendFormatter.format(formatter.parse(selectEndDate.value)),
      'apiUrl': api,
      'ticketType': canShowType.value
          ? '${getId(ticketTypeList.value, selectedTicketType.value)}'
          : '0',
      'title': title,
      "building": selectedBuildingList.value,
      "complaintType": selectedTicketType.value,
    };

    Get.toNamed(HDRoutes.TICKETS, arguments: params);
  }

/*  logout(
      {bool isDismiss = true,
      String msg = 'Are you sure to logout from app.'}) async {
    showMessage('Logout ${isDismiss ? '?' : '!'}', msg,Get.context!,
        isDismiss: isDismiss,
        cancelBtn: isDismiss
            ? TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ))
            : null,
        actionBtn: TextButton(
            onPressed: () async {
              if (await isNetConnected()) {
                showLoader(title: 'Logging Out');
                var response = await HelpdeskApiCall().doLogout(userId);
                hideLoader();
                if (response != null && response['Status']) {
                  String? name, password;
                  name = box.read(USER_EMAIL);
                  password = isDismiss ? box.read(USER_PASSWORD) : '';
                  box.erase();
                  box.write(USER_EMAIL, name);
                  box.write(USER_PASSWORD, password);
                  Get.offAllNamed(HDRoutes.LOGIN);
                } else {
                  showToastMsg('Something went wrong');
                }
              }
            },
            child: const Text('Logout')));
  }*/

  getTicket() async {
    if (await isNetConnected()) {
      isTicketLoading(true);
      var params = {
        'userid': '$userId',
        // 'TicketDate': '07/01/2022',
        // 'enddate': '08/22/2022',
        'TicketDate':
            sendFormatter.format(formatter.parse(selectStartDate.value)),
        'enddate': sendFormatter.format(formatter.parse(selectEndDate.value)),
        'companyid': '${getId(companyList.value, selectedCompany.value)}',
        'locationid': '${getId(locationList.value, selectedLocation.value)}',
        'complainttypeid': canShowType.value
            ? '${getId(ticketTypeList.value, selectedTicketType.value)}'
            : '0',
        'BuildingIds': selectedBuildingList.value
            .map((element) => element.buildingID)
            .join(","),
        'appdatetime': DateTime.now().toString(),
      };

      try {
        var response = await HelpdeskApiCall().getTickets(allTicketApi, params);

        if (response != null) {
          if (response.status) {
            response.ticketdetails?.forEach((element) {
              element.requestTime = DateFormat('dd MMM yyyy hh:mm a').format(
                  DateFormat('dd/MM/yyyy hh:mm:ss a')
                      .parse(element.requestTime));
              element.responseTime = DateFormat('dd MMM yyyy hh:mm a').format(
                  DateFormat('dd/MM/yyyy hh:mm:ss a')
                      .parse(element.responseTime));
            });
            response.ticketdetails!
                .removeWhere((element) => element.isClosed == true);
            tickets(response.ticketdetails!);

            // print('tickets ${tickets.length}');

            if(selectedTicketType.value.toLowerCase().startsWith('all')) {
              Map<String, int> callForStack = {};
              for (var element in ticketTypeList.entries) {
                if (element.value == 0) {
                  callForStack.addAll({
                    '${element.key.split(' (')[0]} (${tickets.length})': element
                        .value
                  });
                } else {
                  callForStack.addAll({'${element.key.split(' (')[0]} (${response.ticketdetails!
                      .where((e) => e.ticketTypeId == element.value)
                      .length})': element.value});
                }
              }

              ticketTypeList(callForStack);
                selectedTicketType(ticketTypeList.keys.elementAt(0));
            }

          } else {
            showToastMsg(response.message);
          }
        }
      } catch (e) {
        showToastMsg(e.toString());
      }
      isTicketLoading(false);
    }
  }

  escalateTicket(Ticketdetails ticket) async {
    if (await isNetConnected()) {
      TextEditingController remarkController = TextEditingController();
      Get.bottomSheet(
        Container(
          height: 250,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                ticket.ticketNo,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const Divider(),
              BoxEditText(
                placeholder: 'Escalation Remark...',
                maxLines: 5,
                controller: remarkController,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomButton(
                buttonText: 'Escalate',
                onPressed: () async {
                  if (remarkController.text.isEmpty) {
                    showToastMsg('Enter Escalation Remarks');
                    return;
                  }

                  if (await isNetConnected()) {
                    var params = {
                      "complaintId": '${ticket.complaintId}',
                      "LocationID": ticket.locationID,
                      "CDate": DateTime.now().toString(),
                      "Description": remarkController.text,
                      "statusid": ticket.statusid,
                    };
                    var response =
                        await HelpdeskApiCall().sendEscalation(params);
                    if (response != null) {
                      remarkController.clear();
                      Get.back();
                      showToastMsg(response['Message']);
                      getTicket();
                    }
                  }
                },
                width: 100,
                height: 32,
                smallText: true,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      );
    }
  }
}
