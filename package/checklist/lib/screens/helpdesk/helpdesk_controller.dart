import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../api/api_calls.dart';
import 'package:i2iutils/helpers/common_functions.dart';

import '../../helpers/session.dart';
import '../../model/all_tickets_response.dart';

class HelpdeskController extends GetxController{

  final box = GetStorage();
  RxBool isLoading = true.obs;
  RxList<Statusdetails> statusDetails = RxList();
  RxList<Ticketdetails> tickets = RxList();
  List<Ticketdetails> tempTickets = [];
  RxInt selectedStatusId = 0.obs;

  RxString fromDate=''.obs;
  RxString toDate=''.obs;

  int userId=-1,companyId=-1,locationId=-1;

  DateTimeRange? dateRange;
  String mdy='MM/dd/yyyy';

  @override
  void onInit() async{
    super.onInit();

    fromDate(getDate(format: mdy));
    toDate(getDate(format: mdy));

    userId=box.read(Session.hdUserId) ?? -1;
    companyId=box.read(Session.hdUserCompanyId) ?? -1;
    locationId=box.read(Session.hdUserLocationId) ?? -1;

    if(userId==-1){
      //get helpdesk user details

      var params={
        'CompanyID':'${box.read(Session.userCompanyId)}',
        'LocationID':'${box.read(Session.userLocationId)}',
        'BuildingID':'0',
        'Floor':'',
        'Wing':'',
        'Complaint':'greenchklist',
        'CompliantNature':'',
      };
      // {"CompanyID":"166076","LocationID":"288198","BuildingID":"0","Floor":"","Wing":"","Complaint":"greenchklist","CompliantNature":""}
      var response=await ApiCall().getHelpdeskDetail(params);
      if(response!=null){
        if(response['RtnStatus']){
          userId=response['RtnData'][0]['UserID'];
          companyId=response['RtnData'][0]['CompanyId'];
          // groupId=response['RtnData'][0]['GroupId'];
        }else{
          showToastMsg(response['RtnMessage'] ?? 'Something went wrong');
        }
      }

    }

    getTicket();
  }

  getTicket() async {
    if (await isNetConnected()) {
      isLoading(true);
      var params = {
        'userid': '$userId',
        'TicketDate': '$fromDate',
        'enddate': '$toDate',
        'companyid': '$companyId',
        'locationid': '$locationId',
        'complainttypeid': '0',
        'BuildingIds': '',
        'appdatetime': DateTime.now().toString(),
      };

     // https://ifazility.com/HelpdeskAPI_RESTNew/api/Dashboard/{GetServiceEngineerTickets_Company_V3}
      // {"userid":"148729","TicketDate":"03-11-2022","enddate":"03-11-2022","companyid":"85477","locationid":"-1","complainttypeid":"0","BuildingIds":"","appdatetime":"2022-11-03 17:16:09.032064"}

      try {
        var response =
        await ApiCall().getTickets(params);

        if (response != null) {
          if (response.status) {
            statusDetails(response.statusdetails!);
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

  changeDate() async{
    dateRange = await customDateRange(dateRange);
    if (dateRange == null) return;

    fromDate(getDate(format: mdy,dateTime: dateRange!.start));
    toDate(getDate(format: mdy,dateTime: dateRange!.end));

    getTicket();

  }

  Future<DateTimeRange?> customDateRange(DateTimeRange? dates) async {
    return await showDateRangePicker(
      context: Get.context!,
      initialDateRange: dates,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      locale: const Locale('en', "IN"),
      fieldStartHintText: 'dd/MM/yyyy',
      fieldEndHintText: 'dd/MM/yyyy',
    );
  }

}