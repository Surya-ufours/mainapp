import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helpdesk/api/helpdesk_api_calls.dart';
import 'package:helpdesk/helpers/strings.dart';
import 'package:helpdesk/helpers/utils.dart';
import 'package:helpdesk/model/all_tickets_response.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:i2iutils/widgets/boxedittext.dart';
import 'package:i2iutils/widgets/button.dart';
import 'package:intl/intl.dart';

class TicketController extends GetxController {
  var args = Get.arguments;
  RxBool isLoading = false.obs;
  RxList<Statusdetails> statusDetails = RxList();
  RxList<Ticketdetails> tickets = RxList();
  List<Ticketdetails> tempTickets = [];
  RxInt selectedStatusId = 0.obs;
  RxBool isAdmin = false.obs, isServiceEng = false.obs;

  final box = GetStorage();

  final remarkController = TextEditingController();
  bool isB2c = false;

  @override
  void onInit() {
    isAdmin(box.read(IS_ADMIN) ?? false);
    isServiceEng(box.read(IS_SE) ?? false);
    isB2c = box.read(IS_B2C) ?? false;

    super.onInit();
    getTicket();

    /*FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint(message.toString());
      if (message.data['CompliantId'] != null) {
        getTicket();
      }
    });*/
  }

  getTicket() async {
    if (await isNetConnected()) {
      isLoading(true);
      var params = {
        'userid': '${args['userid']}',
        'TicketDate': '${args['TicketDate']}',
        'enddate': '${args['enddate']}',
        'companyid': '${args['companyid']}',
        'locationid': '${args['locationid']}',
        'complainttypeid': '${args['ticketType']}',
        'BuildingIds':
            args['building'].map((element) => element.buildingID).join(","),
        'appdatetime': DateTime.now().toString(),
      };

      try {
        var response =
            await HelpdeskApiCall().getTickets(args['apiUrl'], params);

        if (response != null) {
          if (response.status) {
            statusDetails(response.statusdetails!);
            response.ticketdetails?.forEach((element) {
              element.requestTime = DateFormat('dd MMM yyyy hh:mm a').format(
                  DateFormat('dd/MM/yyyy hh:mm:ss a')
                      .parse(element.requestTime));
              element.responseTime = DateFormat('dd MMM yyyy hh:mm a').format(
                  DateFormat('dd/MM/yyyy hh:mm:ss a')
                      .parse(element.responseTime));
            });
            tempTickets = response.ticketdetails!;
            tickets(response.ticketdetails!);
            if (selectedStatusId.value == 0) {
              selectedStatusId(statusDetails.first.statusid);
            } else {
              if (statusDetails.first.statusid == selectedStatusId.value) {
                tickets(tempTickets);
              } else {
                tickets(tempTickets
                    .where(
                        (element) => element.statusid == selectedStatusId.value)
                    .toList());
              }
            }
          } else {
            showToastMsg(response.message);
          }
        }
      } catch (e) {
        showToastMsg(e.toString());
      }
      isLoading(false);
    }
  }

  onStatusChange(Statusdetails status) {
    if (selectedStatusId.value != status.statusid) {
      selectedStatusId(status.statusid);

      if (statusDetails.first.statusid == status.statusid) {
        tickets(tempTickets);
      } else {
        tickets(tempTickets
            .where((element) => element.statusid == status.statusid)
            .toList());
      }
    }
  }

  escalateTicket(Ticketdetails ticket) async {
    if (await isNetConnected()) {
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
