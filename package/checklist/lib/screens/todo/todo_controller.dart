import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:i2iutils/helpers/common_functions.dart';

import '../../api/api_calls.dart';
import '../../helpers/session.dart';
import '../../helpers/utils.dart';
import '../../routes/gc_app_pages.dart';

class TodoController extends GetxController {
  RxString companyId = '-1'.obs;
  RxString locationId = '-1'.obs;
  RxString buildingid = '-1'.obs;
  RxString floorId = '-1'.obs;
  RxString wingId = '-1'.obs;
  RxString selectedDeptId = '0'.obs;
  RxString selectedStatus = '1'.obs;
  RxString checkorlog = '1'.obs;
  RxString selectedStatusTime = '2'.obs;
  String fromTime = "00:00";
  String toTime = "24:00";
  String userId = "";
  String today = '';
  String token = '';

  final box = GetStorage();

  RxBool isLoading = true.obs;

  RxList<Map<String, String>> status = [
    {'id': '0', 'value': 'All Status'},
    {'id': '1', 'value': 'Pending Slots'},
    {'id': '2', 'value': 'Scanned Slots'},
  ].obs;

  List<Map<String, String>> statusTime = [
    {'id': '1', 'value': 'For The Day'},
    {'id': '2', 'value': 'Current Time'}
  ];

  List<Map<String, String>> type = [
    {'id': '1', 'value': 'Checklist'},
    {'id': '2', 'value': 'Logsheet'}
  ];

  RxList<Map<String, String>> departmentList = RxList();
  RxList<Map<String, String>> companyList = RxList();
  RxList<Map<String, String>> locationList = RxList();
  List<Map<String, String>> fullLocationList = [];
  RxList<Map<String, String>> buildingList = RxList();
  RxList<Map<String, String>> floorList = RxList();
  RxList<Map<String, String>> wingList = RxList();

  bool isMissingSlot = false;
  RxList list = RxList();

  @override
  void onInit() {
    super.onInit();

    userId = box.read(Session.userId);
    token = box.read(Session.token);
    companyId('${box.read(Session.userCompanyId)}');
    today = getDate(format: 'yyyy-MM-dd HH:mm');
    fromTime = getDate(format: "HH") + ":00";

    getCompany();
    setDepartments();
  }

  setDepartments() {
    departmentList.add(
      {'id': '0', 'value': 'All Department'},
    );
    departmentList.addAll(
        (jsonDecode(box.read(Session.userDepartments) ?? "[]") as List)
            .map((e) =>
                {'id': '${e['departmentid']}', 'value': '${e['department']}'})
            .toList());
    // selectedDeptId('${box.read(Session.userDeptId)}');
  }

  getCompany() async {
    if (await isNetConnected()) {
      var params = {
        "userid": userId,
        "token": token,
      };

      var response = await ApiCall().getCompanyList(params);
      if (response != null) {
        //CompanyName,CompanyId
        if (response['status'] && response['result'].isNotEmpty) {
          companyList((response['result'] as List)
              .map((e) =>
                  {"id": "${e['CompanyId']}", "value": "${e['CompanyName']}"})
              .toList());
          companyId(companyList.first['id']);

          getLocation();
        } else {
          companyList.clear();
          showToastMsg(response['message']);
        }
      }
    }
  }

  changeCompany() {
    locationList(fullLocationList
        .where((element) => element['companyId'] == companyId.value)
        .toList());
    if (locationList.isNotEmpty) {
      locationId(locationList.first['id']);
    }else{
      showToastMsg('No Location Found!');
    }
  }

  getLocation() async {
    if (await isNetConnected()) {
      var params = {
        "userid": userId,
        "token": token,
      };

      locationList.clear();
      locationId('');

      var response = await ApiCall().getLocationList(params);
      if (response != null) {
        //LocationName,LocationID,CompanyId
        if (response['status'] && response['result'].isNotEmpty) {
          fullLocationList = (response['result'] as List)
              .map((e) => {
                    "id": "${e['LocationID']}",
                    "value": "${e['LocationName']}",
                    "companyId": "${e['CompanyID']}"
                  })
              .toList();

          locationList(fullLocationList
              .where((element) => element['companyId'] == companyId.value)
              .toList());
          if (locationList.isNotEmpty) {
            locationId(locationList.first['id']);
            getBuildings();
          }else{
            showToastMsg('No Location Found!');
          }

        } else {
          showToastMsg(response['message']);
        }
      }
    }
  }

  getBuildings() async {
    if (await isNetConnected()) {
      var params = {
        "userid": userId,
        "token": token,
        "LocationID": encryptString('', locationId.value)
      };

      buildingid('');
      buildingList.clear();

      var response = await ApiCall().getBuildingList(params);
      if (response != null) {
        //LocationName,LocationID,CompanyId
        if (response['status'] && response['result'].isNotEmpty) {
          buildingList((response['result'] as List)
              .map((e) => {
                    "id": "${e['BuildingID']}",
                    "value": "${e['BuildingName']}",
                  })
              .toList());

          buildingid(buildingList.first['id']);

          getFloors();
        } else {
          showToastMsg(response['message']);
        }
      }
    }
  }

  getFloors() async {
    if (await isNetConnected()) {
      var params = {
        "userid": userId,
        "token": token,
        "locationid": encryptString('', locationId.value),
        "buildingId": encryptString('', buildingid.value)
      };

      floorId('');
      floorList.clear();

      var response = await ApiCall().getFloorList(params);
      if (response != null) {
        //FloorID,FloorName
        if (response['status'] && response['result'].isNotEmpty) {
          floorList.add({
            "id": "0",
            "value": "All Floor",
          });
          floorList.addAll((response['result'] as List)
              .map((e) => {
                    "id": "${e['FloorID']}",
                    "value": "${e['FloorName']}",
                  })
              .toList());

          floorId(floorList.first['id']);

          getWings();
        } else {
          showToastMsg(response['message']);
        }
      }
    }
  }

  getWings() async {
    if (await isNetConnected()) {
      var params = {
        "userid": userId,
        "token": token,
        "locationid": encryptString('', locationId.value),
        "buildingId": encryptString('', buildingid.value),
        "floorId": encryptString('', floorId.value)
      };

      wingId('');
      wingList.clear();

      var response = await ApiCall().getWingList(params);
      if (response != null) {
        //LocationName,LocationID,CompanyId
        if (response['status'] && response['result'].isNotEmpty) {
          wingList.add({
            "id": "0",
            "value": "All Wing",
          });

          wingList.addAll((response['result'] as List)
              .map((e) => {
                    "id": "${e['WingID']}",
                    "value": "${e['WingName']}",
                  })
              .toList());

          wingId(wingList.first['id']);

          progressTodo();
        } else {
          showToastMsg(response['message']);
        }
      }
    }
  }

  void progressTodo() async {
    if (locationId != -1 && buildingid != -1 && floorId != -1 && wingId != -1) {
      isLoading(true);

      var params;

      if (isMissingSlot) {
        params = {
          'companyid': encryptString('', companyId.value),
          'locationid': encryptString('', locationId.value),
          'buildingid': encryptString('', buildingid.value),
          'floorid': encryptString('', floorId.value),
          'wingid': encryptString('', wingId.value),
          'departmentid': encryptString('', selectedDeptId.value),
          'categoryid': encryptString('', '0'),
          'status': 1,
          'isdetail': false,
          'date': today,
          'fromtime': '00:00',
          'totime': '${getDate(format: 'HH')}:00',
          'userid': userId,
          'token': token,
        };
      } else if (fromTime != "00:00" && selectedStatus.value == '1') {
        String tt = (int.parse(getDate(format: "HH")) + 1).toString();
        if (tt.length < 2) tt = "0$tt";

        params = {
          'companyid': encryptString('', companyId.value),
          'locationid': encryptString('', locationId.value),
          'buildingid': encryptString('', buildingid.value),
          'floorid': encryptString('', floorId.value),
          'wingid': encryptString('', wingId.value),
          'departmentid': encryptString('', selectedDeptId.value),
          'categoryid': encryptString('', '0'),
          'status': selectedStatus.value,
          'isdetail': false,
          'date': today,
          'fromtime': fromTime,
          'totime': '$tt:00',
          'userid': userId,
          'token': token,
        };
      } else if (fromTime == "00:00" && selectedStatus.value == '1') {
        String tt = (int.parse(getDate(format: "HH"))).toString();
        if (tt.length < 2) tt = "0$tt";

        params = {
          'companyid': encryptString('', companyId.value),
          'locationid': encryptString('', locationId.value),
          'buildingid': encryptString('', buildingid.value),
          'floorid': encryptString('', floorId.value),
          'wingid': encryptString('', wingId.value),
          'departmentid': encryptString('', selectedDeptId.value),
          'categoryid': encryptString('', '0'),
          'status': selectedStatus.value,
          'isdetail': false,
          'date': today,
          'fromtime': '$tt:00',
          'totime': toTime,
          'userid': userId,
          'token': token,
        };
      } else {
        params = {
          'companyid': encryptString('', companyId.value),
          'locationid': encryptString('', locationId.value),
          'buildingid': encryptString('', buildingid.value),
          'floorid': encryptString('', floorId.value),
          'wingid': encryptString('', wingId.value),
          'departmentid': encryptString('', selectedDeptId.value),
          'categoryid': encryptString('', '0'),
          'status': selectedStatus.value,
          'isdetail': false,
          'date': today,
          'fromtime': fromTime,
          'totime': toTime,
          'userid': userId,
          'token': token,
        };
      }

      var response;
      if (checkorlog.value == '1') {
        response = await ApiCall().getTodosChecklist(params);
      } else {
        response = await ApiCall().getTodosLogsheet(params);
      }

      if (response != null) {
        if (response['status']) {
          list(response['result']);
        } else {
          list.clear();
          showToastMsg(response['message']);
        }
      }

      isLoading(false);
    }
  }

  moveToDetail(list) {
    var params = {
      'todo': list,
      'companyId': companyId.value,
      'locationId': locationId.value,
      'buildingId': buildingid.value,
      'floorId': floorId.value,
      'wingId': wingId.value,
      'departmentId': selectedDeptId.value,
      'categoryId': '',
      'status': '',
      'isMissingSlot': isMissingSlot,
      'isChecklist': checkorlog.value == '1',
      'userId': userId,
      'token': token,
    };

    if (fromTime != "00:00" && (selectedStatus.value == '1' || selectedStatus.value == '3')) {
      String tt = (int.parse(getDate(format: "HH")) + 1).toString();
      if (tt.length < 2) tt = "0$tt";

      params.addAll({
        'fromTime': fromTime,
        'toTime': '$tt:00',
      });
    } else if (fromTime != "00:00" &&
        (selectedStatus.value == '1' || selectedStatus.value == '3')) {
      String tt = (int.parse(getDate(format: "HH")) + 1).toString();
      if (tt.length < 2) tt = "0$tt";

      params.addAll({
        'fromTime': '$tt:00',
        'toTime': toTime,
      });
    } else {
      params.addAll({
        'fromTime': fromTime,
        'toTime': toTime,
      });
    }
    debugPrint(params['isChecklist'].toString());

    Get.toNamed(GCRoutes.todoDetail, arguments: params);
  }

  onChangeStatusTime() {
    if (selectedStatusTime.value == '1') {
      fromTime = "00:00";
      status.add({'id': '3', 'value': 'Missed Slots'});
    } else {
      fromTime = getDate(format: "HH") + ":00";
      if(selectedStatus.value=='3') {
        selectedStatus('0');
      }
      status.removeLast();
    }

    toTime = "24:00";
    today = getDate(format: "yyyy-MM-dd") + " " + toTime;

    // if (!isMissingSlot) {
      progressTodo();
    // } else {
    //   selectedStatus('0');
    // }
  }
}
