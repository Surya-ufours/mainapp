import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:easy_image_viewer/easy_image_viewer.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helpdesk/api/helpdesk_api_calls.dart';
import 'package:helpdesk/helpers/color.dart';
import 'package:helpdesk/helpers/loader.dart';
import 'package:helpdesk/helpers/strings.dart';

import 'package:helpdesk/model/all_tickets_response.dart';
import 'package:helpdesk/model/assignee_response.dart';
import 'package:helpdesk/model/histories.dart';
import 'package:helpdesk/model/status_list_response.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:i2iutils/helpers/image_picker_helper.dart';
import '../../helpers/notification.dart';

class HelpdeskDetailsController extends GetxController {
  String complaintId = Get.arguments['complaintId'] ?? '-1';

  Rx<Ticketdetails?> ticket = Rx(null);

  RxBool isAdmin = false.obs;
  RxBool isHistoryLoading = true.obs;
  RxList<Histories> histories = RxList();
  RxList<StatusList> statusList = RxList();
  Rx<StatusList?> selectedStatus = Rx(null);

  RxString timerText = ''.obs;
  Rx<Color> timerColor = Colors.green.obs;

  RxList<Assignees> assignees = RxList();
  RxString selectedAssignee = ''.obs;
  final picker = ImagePicker();

  TextEditingController remarkController = TextEditingController();
  TextEditingController costController = TextEditingController();
  Rx<String?> submitImage = Rx(null);
  late String path;
  RxBool isCostRequired = false.obs, isCloseStatus = false.obs;
  bool isCustRef = false;
  bool isAssignee = false;
  Timer? timer;

  final GetStorage box = GetStorage();
  List<int> assignedAssigneeId = [];

  @override
  void onInit() async {
    isCustRef = box.read(IS_CUST_REF) ?? false;
    isAdmin(box.read(IS_ADMIN) ?? false);
    if (!isAdmin.value) {
      isAdmin(box.read(IS_SA) ?? false);
    }
    isCostRequired(box.read(IS_COST_REQ) ?? false);
    super.onInit();

    getTicketHistory();

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   debugPrint(message.toString());
    //   if (message.data['CompliantId'] != null) {
    //     if (message.data['CompliantId'] == complaintId) {
    //       getTicketHistory();
    //     }
    //   }
    // });
    //
    // FirebaseNotification.detailsController = this;
  }

  @override
  void dispose() {
    timer?.cancel();
    // FirebaseNotification.detailsController = null;
    super.dispose();
  }

  getTicketHistory({String? cid}) async {
    complaintId = cid ?? complaintId;

    if (await isNetConnected()) {
      isHistoryLoading(true);

      try {
        var response = await HelpdeskApiCall().getTicketHistory(complaintId);
        if (response != null) {
          if (response.status) {
            try {
              response.ticketdetails.requestTime =
                  DateFormat('dd MMM yyyy hh:mm a').format(
                      DateFormat('dd/MM/yyyy hh:mm:ss a')
                          .parse(response.ticketdetails.requestTime));
              response.ticketdetails.responseTime =
                  DateFormat('dd MMM yyyy hh:mm a').format(
                      DateFormat('dd/MM/yyyy hh:mm:ss a')
                          .parse(response.ticketdetails.responseTime));

              response.ticketdetails.histories?.forEach((element) {
                element.statusDate = DateFormat('dd MMM yyyy')
                    .format(DateFormat('dd/MM/yyyy').parse(element.statusDate));
              });
            } catch (e) {
              //ignore
            }

            ticket(response.ticketdetails);
            prepareTime();
            if (response.ticketdetails.histories != null) {
              histories(List.from(response.ticketdetails.histories!.reversed));
            }
          }
        }
      } catch (e) {
        debugPrint(e.toString());
      }
      isHistoryLoading(false);
      getAssignee();
    }
  }

  getAssignee() async {
    try {
      isHistoryLoading(true);
      var response = await HelpdeskApiCall().getAssignees(complaintId);
      isHistoryLoading(false);
      if (response != null && response.status) {
        assignees(response.lstassignee);
        if (response.lstprovider.isNotEmpty) {
          assignedAssigneeId =
              response.lstprovider.map((e) => e.userid).toList();
        }

        isAssignee = response.lstprovider.firstWhereOrNull(
                (element) => element.userid == box.read(USER_ID)) !=
            null;

        if (assignees.isNotEmpty) {
          if (response.lstprovider.isNotEmpty) {
            selectedAssignee('${response.lstprovider.first.userid}');
          } else {
            selectedAssignee('${assignees.first.userid}');
          }
        }
      }

      if (isAdmin.value) {
        getStatusList();
      } else if (isAssignee) {
        getStatusList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getStatusList() async {
    isHistoryLoading(true);
    try {
      var response = await HelpdeskApiCall().getStatusList(
          ticket.value!.statusid,
          ticket.value!.companyID,
          (box.read(ROLE_ID) ?? -1));
      if (response != null && response.status) {
        statusList(response.statusdetails);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    isHistoryLoading(false);
  }

  prepareTime() {
    if (ticket.value!.isStopTimer) {
      timerText('00:00:00');
      timerColor(Colors.orange);
    } else {
      if (ticket.value!.isClosed) {
        timerText('Time Over');
        timerColor(Colors.grey);
      } else if (ticket.value!.isonHold) {
        timerText(ticket.value!.stopTime);
        timerColor(Colors.grey);
      } else {
        //load time to stopping time
        int startTime = int.parse(ticket.value!.shiftStart);
        startTime = startTime ~/ 1000;

        timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          int time = startTime - timer.tick;
          if (time < 0) {
            timer.cancel();
            timerText('Time Over - ESC L1');
            timerColor(Colors.red);
          } else {
            timerText(formatHHMMSS(time));
            if (time <= 1800 && timerColor.value != Colors.orange) {
              timerColor(Colors.orange);
            }
          }
        });
      }
    }
  }

  String formatHHMMSS(int seconds) {
    final hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    final minutes = (seconds / 60).truncate();

    final hoursStr = (hours).toString().padLeft(2, '0');
    final minutesStr = (minutes).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  selectImage() async {
    Get.focusScope?.unfocus();
    var path= await getImage(
      Get.context!,
      canDrawDateTime: true,
      pickerOption: (box.read(CAN_SHOW_GAL_OPT) ?? false) ? PickerOption.all : PickerOption.camera,
    );
    if (path != null) {
      submitImage(path);
    }
  }

  open(String image) {
    final imageProvider = Image.network(image).image;
    showImageViewer(Get.context!, imageProvider,
        useSafeArea: true, immersive: false);
  }

  assignTicket() async {
    int id = int.parse(selectedAssignee.value);
    /*assignees
        .firstWhere((element) => element.name == selectedAssignee.value)
        .userid;*/

    if (assignedAssigneeId.firstWhereOrNull((element) => element == id) ==
        null) {
      var params = {
        "complaintId": "${ticket.value!.complaintId}",
        "assigneeid": "$id",
        "uid": "${box.read(USER_ID) ?? -1}",
        "statusid": ticket.value!.statusid,
      };

      showLoader();
      var response = await HelpdeskApiCall().updateAssignee(
        params,
      );
      hideLoader();
      if (response != null) {
        showToastMsg(response['Message']);
        if (response['Status']) {
          Get.back(result: true);
        }
      }
    } else {
      showToastMsg('Already Assigned');
    }
  }

  updateTicket() async {
    Get.focusScope?.unfocus();
    if (await isNetConnected()) {
      if (selectedStatus.value != null) {
        if (isCostRequired.value &&
            isCloseStatus.value &&
            costController.text.isEmpty) {
          //alert for get cost of price
          return showToastMsg('Enter Price Amount');
        } else {
          if (selectedStatus.value!.isControlsMandatory) {
            if (remarkController.text.isEmpty) {
              return showToastMsg('Enter Remark');
            }
            if (submitImage.value == null) return showToastMsg('Select Image');
          }
          //call api
          String? strDate =
              DateFormat("dd/MM/yyyy HH:mm").format(DateTime.now());
          if (selectedStatus.value!.isVisitdatetime) {
            //show datetime picker
            var response = await HelpdeskApiCall()
                .getTimingList(ticket.value!.complaintId);
            if (response != null && response['Status']) {
              strDate = await showModalBottomSheet(
                  context: Get.context!,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  )),
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Choose the proposed Date & Time of Visit',
                            style: TextStyle(
                              color: colorPrimary,
                            ),
                          ),
                          const Divider(),
                          Expanded(
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: response['Data'].length,
                                itemBuilder: (_, index) {
                                  return ListTile(
                                    onTap: () {
                                      Get.back(
                                          result: response['Data'][index]
                                              ['interval']);
                                    },
                                    leading: Radio(
                                        value: 0,
                                        groupValue: 1,
                                        onChanged: (val) {}),
                                    title: Text(
                                      response['Data'][index]['interval'],
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    );
                  });
            }
          }
          debugPrint('str date $strDate');

          if (strDate == null) return;

          int id;
          if (isAdmin.value) {
            id = int.parse(selectedAssignee.value);
            /*assignees
                .firstWhere((element) => element.name == selectedAssignee.value)
                .userid;*/
          } else {
            id = box.read(USER_ID);
          }

          var params = {
            "complaintId": "${ticket.value!.complaintId}",
            "serviceEngineerIDs": [
              {"ServiceEngineerID": id}
            ],
            "description": remarkController.text,
            "companyid": "${ticket.value!.companyID}",
            "locationid": "${ticket.value!.locationID}",
            "UserID": "${box.read(USER_ID) ?? -1}",
            "statusid": "${selectedStatus.value?.statusid}",
            "TicketCost": costController.text,
            "VisitDatetime": strDate,
            "bas64Image": (submitImage.value != null &&
                    submitImage.value!.isNotEmpty)
                ? base64.encode(await File(submitImage.value!).readAsBytes())
                : '',
            "filetype": ".jpeg"
          };

          showLoader();
          var response = await HelpdeskApiCall().updateTicket(params);
          hideLoader();
          if (response != null) {
            showToastMsg(response['Message']);
            if (response['Status']) {
              Get.back(result: true);
            }
          }
        }
      }
    }
  }
}
