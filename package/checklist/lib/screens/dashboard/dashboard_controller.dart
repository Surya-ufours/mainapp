import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../api/api_calls.dart';
import '../../helpers/utils.dart';
import '../../model/checklist_wise.dart';
import '../../model/over_all.dart';
import '../../model/template_wise.dart';
import 'package:i2iutils/helpers/common_functions.dart';

import '../../helpers/session.dart';
import '../../routes/gc_app_pages.dart';

class DashboardController extends GetxController {
  RxString companyId = '-1'.obs;
  RxString locationId = '-1'.obs;
  RxString buildingid = '-1'.obs;
  RxString floorId = '-1'.obs;
  RxString wingId = '-1'.obs;
  RxString selectedStatusTime = '1'.obs;
  RxString checkorlog = '1'.obs;
  RxString selectedPer = '0'.obs;
  String userId = "";
  String selectedTime = "24:00";
  String today = '';
  String token = '';

  final box = GetStorage();

  RxBool isLoading = true.obs;

  RxList<TemplateWise> templates = RxList();
  List<TemplateWise> tempTemplates = RxList();
  RxList<ChecklistWise> checklists = RxList();
  List<ChecklistWise> tempChecklists = RxList();

  List<Map<String, String>> status = [
    {'id': '1', 'value': 'Checklist'},
    {'id': '2', 'value': 'Logsheet'}
  ];

  List<Map<String, String>> statusTime = [
    {'id': '1', 'value': '% For The Day'},
    {'id': '2', 'value': '% as of now'}
  ];

  List<Map<String, String>> percentage = [
    {'id': '0', 'value': 'All'},
    {'id': '1', 'value': '0%'},
    {'id': '2', 'value': '1% - 25%'},
    {'id': '3', 'value': '25% - 50%'},
    {'id': '4', 'value': '50% - 75%'},
    {'id': '5', 'value': '75% - 99%'},
    {'id': '6', 'value': '100%'}
  ];

  RxList<Map<String, String>> companyList = RxList();
  RxList<Map<String, String>> locationList = RxList();
  List<Map<String, String>> fullLocationList = [];
  RxList<Map<String, String>> buildingList = RxList();
  RxList<Map<String, String>> floorList = RxList();
  RxList<Map<String, String>> wingList = RxList();

  RxList dashboard = RxList();
  RxList departments = RxList();

  RxString selectedName = ''.obs;
  int selectedDeptId = -1;

  @override
  void onInit() {
    super.onInit();

    userId = box.read(Session.userId);
    token = box.read(Session.token);
    companyId('${box.read(Session.userCompanyId)}');
    today = getDate(format: 'yyyy-MM-dd');

    getCompany();
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
            "value": "All",
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
            "value": "All",
          });

          wingList.addAll((response['result'] as List)
              .map((e) => {
                    "id": "${e['WingID']}",
                    "value": "${e['WingName']}",
                  })
              .toList());

          wingId(wingList.first['id']);

          if (checkorlog.value == '1') {
            getChecklist();
          } else {
            getLogsheet();
          }
        } else {
          showToastMsg(response['message']);
        }
      }
    }
  }

  getChecklist() async {
    if (await isNetConnected()) {
      isLoading(true);
      selectedName('');
      var params = {
        "userid": userId,
        "token": token,
        "companyid": encryptString('', companyId.value),
        "LocationID": encryptString('', locationId.value),
        "buildingid": encryptString('', buildingid.value),
        "floorid": encryptString('', floorId.value),
        "wingid": encryptString('', wingId.value),
        "date": today,
        "time": selectedTime,
      };

      var response = await ApiCall().getDashboardChecklist(params);
      if (response != null) {
        if (response.status && response.result != null) {
          if (response.result!.overall != null) {
            Overall overall = response.result!.overall!;
            if (overall.met != "0" && overall.notMet != 0) {
              //prepare chart
              dashboard([
                {
                  'imagePath': 'menu.png',
                  'key': 'Completed',
                  'value': '${overall.met}%',
                },
                {
                  'imagePath': 'menu.png',
                  'key': 'Not Completed',
                  'value': '${overall.notMet}%',
                }
              ]);
            } else {
              dashboard.clear();
              departments.clear();
              checklists.clear();
              templates.clear();
            }
          }

          if (response.result!.departmentwise!.isNotEmpty) {
            //add checklists

            tempChecklists = response.result!.checklistwise ?? [];

            departments(response.result!.departmentwise
                ?.map((e) => {
                      'id': e.departmentId,
                      'key': '${double.parse(e.met) / 100}',
                      'value': e.departmentName
                    })
                .toList());

            //prepare department charts
          }
        } else {
          showToastMsg(response.message);
          //no result
        }
      }

      isLoading(false);
    }
  }

  getLogsheet() async {
    if (await isNetConnected()) {
      isLoading(true);
      selectedName('');
      var params = {
        "userid": userId,
        "token": token,
        "companyid": encryptString('', companyId.value),
        "LocationID": encryptString('', locationId.value),
        "buildingid": encryptString('', buildingid.value),
        "floorid": encryptString('', floorId.value),
        "wingid": encryptString('', wingId.value),
        "date": today,
        "time": selectedTime,
      };

      var response = await ApiCall().getDashboardLogsheet(params);
      if (response != null) {
        if (response.status && response.result != null) {
          if (response.result!.overall != null) {
            Overall overall = response.result!.overall!;
            //prepare chart
            if (overall.met != "0" && overall.notMet != 0) {
              //prepare chart
              dashboard([
                {
                  'imagePath': 'menu.png',
                  'key': 'Completed',
                  'value': '${overall.met}%',
                },
                {
                  'imagePath': 'menu.png',
                  'key': 'Not Completed',
                  'value': '${overall.notMet}%',
                }
              ]);
            } else {
              dashboard.clear();
              departments.clear();
              templates.clear();
              checklists.clear();
            }
          }

          if (response.result!.templatewise != null &&
              response.result!.templatewise!.isNotEmpty) {
            //prepare department charts
            tempTemplates = response.result!.templatewise ?? [];

            departments(response.result!.categorywise
                ?.map((e) => {
                      'id': e.categoryId,
                      'key': '${double.parse(e.met) / 100}',
                      'value': e.categoryName
                    })
                .toList());
          }
        } else {
          showToastMsg(response.message);
          //no result
        }
      }

      isLoading(false);
    }
  }

  filterChecklist(int departmentId) async {
    if (tempChecklists.isNotEmpty) {
      selectedDeptId = departmentId;
      checklists(tempChecklists
          .where((element) => element.departmentId == departmentId)
          .toList());
    }
  }

  filterLogsheet(int catId) async {
    selectedDeptId = catId;
    if (tempTemplates.isNotEmpty) {
      templates(tempTemplates
          .where((element) => element.categoryId == catId)
          .toList());
    }
  }

  filterChecklistPercentage(String? val) {
    switch (val) {
      case "0":
        checklists(tempChecklists
            .where((element) => element.departmentId == selectedDeptId)
            .toList());
        break;

      case "1":
        checklists(tempChecklists
            .where((element) =>
                double.parse(element.met) >= 0 &&
                double.parse(element.met) < 1 &&
                element.departmentId == selectedDeptId)
            .toList());
        break;

      case "2":
        checklists(tempChecklists
            .where((element) =>
                double.parse(element.met) >= 1 &&
                double.parse(element.met) < 25 &&
                element.departmentId == selectedDeptId)
            .toList());
        break;

      case "3":
        checklists(tempChecklists
            .where((element) =>
                double.parse(element.met) >= 25 &&
                double.parse(element.met) < 50 &&
                element.departmentId == selectedDeptId)
            .toList());
        break;

      case "4":
        checklists(tempChecklists
            .where((element) =>
                double.parse(element.met) >= 50 &&
                double.parse(element.met) < 75 &&
                element.departmentId == selectedDeptId)
            .toList());
        break;
      case "5":
        checklists(tempChecklists
            .where((element) =>
                double.parse(element.met) >= 75 &&
                double.parse(element.met) < 99 &&
                element.departmentId == selectedDeptId)
            .toList());
        break;
      case "6":
        checklists(tempChecklists
            .where((element) =>
                double.parse(element.met) >= 100 &&
                element.departmentId == selectedDeptId)
            .toList());
        break;

      default:
        break;
    }
  }

  filterLogsheetPercentage(String? val) {
    switch (val) {
      case "0":
        templates(tempTemplates
            .where((element) => element.categoryId == selectedDeptId)
            .toList());
        break;

      case "1":
        templates(tempTemplates
            .where((element) =>
                double.parse(element.met) >= 0 &&
                double.parse(element.met) < 1 &&
                element.categoryId == selectedDeptId)
            .toList());
        break;

      case "2":
        templates(tempTemplates
            .where((element) =>
                double.parse(element.met) >= 1 &&
                double.parse(element.met) < 25 &&
                element.categoryId == selectedDeptId)
            .toList());
        break;

      case "3":
        templates(tempTemplates
            .where((element) =>
                double.parse(element.met) >= 25 &&
                double.parse(element.met) < 50 &&
                element.categoryId == selectedDeptId)
            .toList());
        break;

      case "4":
        templates(tempTemplates
            .where((element) =>
                double.parse(element.met) >= 50 &&
                double.parse(element.met) < 75 &&
                element.categoryId == selectedDeptId)
            .toList());
        break;
      case "5":
        templates(tempTemplates
            .where((element) =>
                double.parse(element.met) >= 75 &&
                double.parse(element.met) < 99 &&
                element.categoryId == selectedDeptId)
            .toList());
        break;
      case "6":
        templates(tempTemplates
            .where((element) =>
                double.parse(element.met) >= 100 &&
                element.categoryId == selectedDeptId)
            .toList());
        break;

      default:
        break;
    }
  }

  onChecklistClick(ChecklistWise checklist, bool isComplete) {
    if (double.parse(isComplete ? checklist.met : checklist.notMet) > 0) {
      var params = {
        'isChecklist': true,
        'isComplete': isComplete,
        'locationId': locationId.value,
        'buildingId': buildingid.value,
        'floorId': floorId.value,
        'wingId': wingId.value,
        'time': selectedTime,
        'date': today,
        'userId': userId,
        'token': token,
        'checklist': checklist,
      };

      Get.toNamed(GCRoutes.dashboardDetail, arguments: params);
    } else {
      showToastMsg('No Records');
    }
  }

  onLogsheetClick(TemplateWise template, bool isComplete) {
    if (double.parse(isComplete ? template.met : template.notMet) > 0) {
      var params = {
        'isChecklist': false,
        'isComplete': isComplete,
        'locationId': locationId.value,
        'buildingId': buildingid.value,
        'floorId': floorId.value,
        'wingId': wingId.value,
        'time': selectedTime,
        'date': today,
        'userId': userId,
        'token': token,
        'template': template,
      };

      Get.toNamed(GCRoutes.dashboardDetail, arguments: params);
    } else {
      showToastMsg('No Records');
    }
  }
}
