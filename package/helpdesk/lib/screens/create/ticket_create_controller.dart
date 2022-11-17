import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helpdesk/api/helpdesk_api_calls.dart';
import 'package:i2iutils/helpers/qr_scan.dart';
import 'package:helpdesk/helpers/loader.dart';
import 'package:helpdesk/helpers/strings.dart';
import 'package:helpdesk/helpers/utils.dart';
import 'package:helpdesk/model/department_response.dart';
import 'package:helpdesk/model/helpdesk_login_response.dart';
import 'package:helpdesk/model/issue_response.dart';
import 'package:helpdesk/model/qr_code_detail_response.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:i2iutils/helpers/image_picker_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class TicketCreateController extends GetxController {
  RxMap<String, int> companyList = RxMap();
  RxMap<String, int> locationList = RxMap();
  RxMap<String, int> buildingList = RxMap();
  RxMap<String, int> floorList = RxMap();
  RxMap<String, int> wingList = RxMap();
  RxMap<String, int> communicationList = RxMap();
  RxMap<String, int> complaintTypeList = RxMap();
  RxMap<String, int> requestTypeList = RxMap();
  RxList<Department> departmentList = RxList();
  RxList<Issue> issueList = RxList();
  Rx<QrCodeDetail?> details = Rx(null);

  RxBool isLoginLoading = false.obs;

  RxString selectedCompany = "".obs;
  RxString selectedLocation = "".obs;
  RxString selectedBuilding = "".obs;
  RxString selectedFloor = "".obs;
  RxString selectedWing = "".obs;
  RxString selectedCommunication = "".obs;
  RxString selectedComplaintType = "".obs;
  RxString selectedReqType = "".obs;
  Rx<Department?> selectedDept = Rx(null);
  Rx<Issue?> selectedIssue = Rx(null);

  RxInt selectedReqBy = 1.obs;

  TextEditingController remarkController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController reqIdController = TextEditingController();
  TextEditingController refNOController = TextEditingController();

  Rx<String?> submitImage = Rx(null);
  final picker = ImagePicker();
  late String path;
  int userId = -1;
  int roleId = -1;
  RxBool isLoading = false.obs,
      isRefNo = false.obs,
      isReqType = false.obs,
      isCompType = false.obs,
      canShowReqBy = false.obs,
      canShowLocation = false.obs,
      canShowBuilding = false.obs,
      canShowCompany = true.obs;

  int qrCompanyId=0,qrLocationId=0,qrBuildingId=0,qrFloorId=0,qrWingId=0;

  final box = GetStorage();

  @override
  void onInit() async {
    debugPrint(box.read(LOGO));
    super.onInit();
    path = (await getTemporaryDirectory()).path;

    userId = box.read(USER_ID) ?? -1;
    roleId = box.read(ROLE_ID) ?? -1;

    isRefNo(box.read(IS_CUST_REF) ?? false);
    isReqType(box.read(IS_REQ_TYPE) ?? false);
    isCompType(box.read(CAN_SHOW_COMP_TYPE) ?? false);
    canShowReqBy(box.read(CAN_SHOW_REQ_BY) ?? false);

    setupForm(true);
    setupCompany();
  }

  setupForm(bool isSelf) {
    if (isSelf) {
      nameController.text = box.read(EMP_NAME) ?? '';
      emailController.text = box.read(EMP_EMAIL) ?? '';
      phoneController.text = box.read(EMP_PHONE) ?? '';
      reqIdController.text = box.read(EMP_ID) ?? '';
    } else {
      nameController.clear();
      emailController.clear();
      phoneController.clear();
      reqIdController.clear();
    }
  }

  setupCompany({String company = ""}) {
    companyList.clear();
    if ((Get.arguments['companyId'] ?? 0) != 0) {
      companyList.addAll(
          {"${Get.arguments["companyName"]}": Get.arguments["companyId"]});
      selectedCompany(Get.arguments["companyName"]);
    } else {
      selectedCompany(company);
      var temp = jsonDecode(box.read(COMP_LIST) ?? '[]') as List;
      log(temp.toString());
      List<Companydetails> companies =
          temp.map((e) => Companydetails.fromJson(e)).toList();
      companyList.addAll({for (var e in companies) e.company: e.companyId});
      if (companies.isNotEmpty) selectedCompany(companies.first.company);
    }
    canShowCompany(companyList.length > 1);
    companyChanged();
  }

  companyChanged() {
    setupLocation();
    getDepartments();
    getRequestList();
    getComplaintType();
    getModeOfCommunication();
  }

  getRequestList({int? compId}) async {
    if (await isNetConnected()) {
      isLoading(true);
      try {
        int compid = compId ?? getId(companyList.value, selectedCompany.value);

        var response =
            await HelpdeskApiCall().getRequestTypeList(compid, roleId);
        requestTypeList.clear();
        if (response['Status']) {
          requestTypeList.addAll({
            for (var e in response['RequestType'])
              e['requestType']: e['requestTypdId']
          });
        }
      } catch (e) {
        debugPrint(e.toString());
      }
      isLoading(false);
    }
  }

  getComplaintType({int? compId}) async {
    if (Get.arguments['complaintType']?.isNotEmpty ?? false) {
      complaintTypeList.clear();
      complaintTypeList.addAll(
          {Get.arguments['complaintType']: Get.arguments['complaintId']});
      selectedComplaintType(Get.arguments['complaintType']);
      isCompType(false);
    } else {
      if (await isNetConnected()) {
        isLoading(true);
        try {
          int compid =
              compId ?? getId(companyList.value, selectedCompany.value);

          var response = await HelpdeskApiCall().getComplaintType(
            compid,
          );
          complaintTypeList.clear();

          complaintTypeList
              .addAll({for (var e in response) e['IssueName']: e['IssueID']});

          if (!isCompType.value) {
            selectedComplaintType(complaintTypeList.keys.first);
          }
        } catch (e) {
          debugPrint(e.toString());
        }
        isLoading(false);
      }
    }
  }

  getModeOfCommunication({int? compId}) async {
    if (await isNetConnected()) {
      isLoading(true);
      try {
        var response = await HelpdeskApiCall().getModeOfCommunication(
          box.read(GROUP_ID) ?? 0,
        );
        communicationList.clear();

        communicationList.addAll(
            {for (var e in response) e['CallTypeName']: e['CallTypeID']});
      } catch (e) {
        debugPrint(e.toString());
      }
      isLoading(false);
    }
  }

  setupLocation({String location = ""}) {
    locationList.clear();
    if (((Get.arguments['companyId'] ?? 0) != 0) &&
        ((Get.arguments['locationId'] ?? 0) != 0)) {
      locationList.addAll(
          {"${Get.arguments["locationName"]}": Get.arguments["locationId"]});
      selectedLocation(Get.arguments["locationName"]);
    } else {
      selectedLocation(location);
      int compid = getId(companyList.value, selectedCompany.value);

      var temp = jsonDecode(box.read(LOC_LIST) ?? '[]') as List;
      List<Locationdetails> locations =
          temp.map((e) => Locationdetails.fromJson(e)).toList();
      locations.removeWhere((element) => element.companyId != compid);
      locationList.addAll({for (var e in locations) e.location: e.locationId});

      if (locations.isNotEmpty) selectedLocation(locations.first.location);
    }
    canShowLocation(locationList.length > 1);

    buildingList.clear();
    selectedBuilding("");
    floorList.clear();
    selectedFloor("");
    wingList.clear();
    selectedWing("");

    setupBuilding();
  }

  setupBuilding({String building = ""}) {
    buildingList.clear();
    selectedBuilding(building);

    if ((Get.arguments["building"]?.isNotEmpty ?? false) &&
        (Get.arguments['companyId'] != 0 && Get.arguments['locationId'] != 0)) {
      buildingList.addAll(
          {for (var e in Get.arguments['building']) e.building: e.buildingID});
      if (buildingList.isNotEmpty) {
        selectedBuilding(Get.arguments['building'].first.building);
      }
    } else {
      int locid = getId(locationList.value, selectedLocation.value);

      var temp = jsonDecode(box.read(BUILDING_LIST) ?? '[]') as List;
      List<Buildingdetails> buildings =
          temp.map((e) => Buildingdetails.fromJson(e)).toList();
      buildings.removeWhere((element) => element.locationId != locid);

      buildingList.addAll({for (var e in buildings) e.building: e.buildingID});
      if (buildingList.isNotEmpty) selectedBuilding(buildings.first.building);
    }
    canShowBuilding(buildingList.length > 1);

    floorList.clear();
    selectedFloor("");
    wingList.clear();
    selectedWing("");

    setupFloor();
  }

  setupFloor({String floor = ""}) {
    floorList.clear();
    selectedFloor(floor);
    int buildid = getId(buildingList.value, selectedBuilding.value);

    var temp = jsonDecode(box.read(FLOOR_LIST) ?? '[]') as List;
    List<Floordetails> floors =
        temp.map((e) => Floordetails.fromJson(e)).toList();
    floors.removeWhere((element) => element.buildingId != buildid);

    floorList.addAll({for (var e in floors) e.floor: e.floorID});

    wingList.clear();
    selectedWing("");
  }

  setupWing({String wing = ""}) {
    wingList.clear();
    selectedWing(wing);
    int floorid = getId(floorList.value, selectedFloor.value);

    var temp = jsonDecode(box.read(WING_LIST) ?? '[]') as List;
    List<Wingdetails> wings = temp.map((e) => Wingdetails.fromJson(e)).toList();
    wings.removeWhere((element) => element.floorId != floorid);

    wingList.addAll({for (var e in wings) e.wing: e.wingID});
  }

  getDepartments() async {
    if (await isNetConnected()) {
      isLoading(true);
      try {
        int compid = getId(companyList.value, selectedCompany.value);

        var response = await HelpdeskApiCall().getDepartments(compid, userId);
        if (response != null) {
          departmentList.clear();
          selectedDept.value = null;
          if (response.status) {
            departmentList(response.lstDepartment);
          } else {
            showToastMsg(response.message);
          }
        }
      } catch (e) {
        debugPrint(e.toString());
      }
      isLoading(false);
    }
  }

  getIssues({int? compId, int? deptId}) async {
    if (await isNetConnected()) {
      isLoading(true);
      try {
        int compid = compId ?? getId(companyList.value, selectedCompany.value);
        int deptid = deptId ?? selectedDept.value?.departmentID ?? -1;

        var response =
            await HelpdeskApiCall().getIssues(compid, userId, deptid);
        if (response != null) {
          issueList.clear();
          selectedIssue.value = null;
          if (response.status) {
            issueList(response.lstIssue);
          } else {
            showToastMsg(response.message);
          }
        }
      } catch (e) {
        debugPrint(e.toString());
      }
      isLoading(false);
    }
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

  qrScan() async {
    Get.to(QrScan((code) async {
      debugPrint(code);

      if (await isNetConnected()) {
        isLoading(true);
        try {
          var response = await HelpdeskApiCall().getQrCodeDetails(
              box.read(COMP_ID),
              code,
              userId,
              box.read(ROLE_ID)); //static param 1014, 2157b165
          if (response != null) {
            if (response.status) {
              if (response.data != null) {
                details(response.data);

                selectedCompany(response.data!.companyName);
                qrCompanyId=response.data!.companyID;

                selectedLocation(response.data!.locationName);
                qrLocationId=response.data!.locationID;

                selectedBuilding(response.data!.buildingName);
                qrBuildingId=response.data!.buildingID;

                selectedFloor(response.data!.floorName);
                qrFloorId=response.data!.floorID;

                selectedWing(response.data!.wingName);
                qrWingId=response.data!.wingID;

                selectedDept(Department(
                    response.data!.departmentID,
                    response.data!.departmentName,
                    "",
                    response.data!.departmentLogoFileName));

                issueList.clear();
                selectedIssue.value = null;
                getIssues(
                    compId: response.data?.companyID,
                    deptId: response.data?.departmentID);
                return Future(() => true);

              } else {
                showToastMsg("QRCode Doesn't Exist");
              }
            } else {
              showToastMsg(response.message);
            }
          }
        } catch (e) {
          debugPrint(e.toString());
        }
        isLoading(false);
      }

      return Future(() => false);
    }));


  }

  createTicket() async {
    if (selectedCompany.isEmpty) {
      showToastMsg('Select Company');
    } else if (selectedLocation.isEmpty) {
      showToastMsg('Select Location');
    } else if (selectedBuilding.isEmpty) {
      showToastMsg('Select Building');
    } else if (selectedFloor.isEmpty) {
      showToastMsg('Select Floor');
    } else if (selectedWing.isEmpty) {
      showToastMsg('Select Wing');
    } else if (selectedDept.value == null) {
      showToastMsg('Select Category');
    } else if (selectedIssue.value == null) {
      showToastMsg('Select Complaint Name');
    } else if (isCompType.value && selectedComplaintType.isEmpty) {
      showToastMsg('Select Complaint Type');
    } else if (selectedReqBy.value == 2 && selectedCommunication.isEmpty) {
      showToastMsg('Select Mode Of Communication');
    } else if (isReqType.value && selectedReqType.isEmpty) {
      showToastMsg('Select Request Type');
    } else if (selectedReqBy.value == 2 && nameController.text.isEmpty) {
      showToastMsg('Enter Name');
    } else if (selectedReqBy.value == 2 && phoneController.text.isEmpty) {
      showToastMsg('Enter Mobile Number');
    } else if (remarkController.text.isEmpty) {
      showToastMsg('Enter Remarks');
    } else {
      if (await isNetConnected()) {
        String name = reqIdController.text.isEmpty
            ? nameController.text
            : '${nameController.text} (${reqIdController.text})';

        Get.focusScope?.unfocus();

        var params = {
          "CompanyID": details.value==null ? getId(companyList.value, selectedCompany.value) : qrCompanyId,
          "LocationID": details.value==null ? getId(locationList.value, selectedLocation.value): qrLocationId,
          "BuildingID": details.value==null ? getId(buildingList.value, selectedBuilding.value): qrBuildingId,
          "FloorID": details.value==null ? getId(floorList.value, selectedFloor.value): qrFloorId,
          "WingID": details.value==null ? getId(wingList.value, selectedWing.value): qrWingId,
          "DepartmentID": selectedDept.value!.departmentID,
          "IssueID": selectedIssue.value!.categoryID,
          "Description": remarkController.text,
          "PriorityID": selectedIssue.value!.priorityID,
          "ResponseTime": selectedIssue.value!.responseTime,
          "UserID": userId,
          "RequesterName": name,
          "RequestType": isReqType.value
              ? getId(requestTypeList.value, selectedReqType.value)
              : '',
          // "RequesterBy": selectedReqBy.value == 1 ? 'Self' : 'Others',
          "RequestedBy": canShowReqBy.value ? selectedReqBy.value : 0,
          "ComplaintTypeID": isCompType.value
              ? getId(complaintTypeList.value, selectedComplaintType.value)
              : '',
          "CustRefNo":
              refNOController.text.isEmpty ? '-' : refNOController.text,
          "bas64Image":
              submitImage.value != null && submitImage.value!.isNotEmpty
                  ? base64Encode(File(submitImage.value!).readAsBytesSync())
                  : "",
          "filetype": ".jpeg",
          "CallTypeID": selectedReqBy.value != 1
              ? getId(communicationList.value, selectedCommunication.value)
              : 'From App',
          "RequesterMailID": emailController.text,
          "RequesterMobileNo": phoneController.text,
        };

        showLoader();
        var response =
            await HelpdeskApiCall().createTicket(params, submitImage.value);
        hideLoader();
        if (response != null) {
          if (response['Status']) {
            showMessage('Ticket Created!', '${response['Message']}',Get.context!,
                isDismiss: false,
                actionBtn: TextButton(
                    onPressed: () async {
                      Get.back();
                      Get.back(result: {
                        "status": true,
                        "complaintId": response["CompliantId"]
                      });
                    },
                    child: const Text('Okay')));
          } else {
            showMessage('Failed to Create', '${response['Message']}',Get.context!,
                isDismiss: false,
                actionBtn: TextButton(
                    onPressed: () async {
                      Get.back();
                    },
                    child: const Text('Okay')));
          }
        }
      }
    }
  }

  clearScan() {
    setupCompany(company: selectedCompany.value);
    qrCompanyId=0;
    setupLocation(location: selectedLocation.value);
    qrLocationId=0;
    setupBuilding(building: selectedBuilding.value);
    qrBuildingId=0;
    setupFloor(floor: selectedFloor.value);
    qrFloorId=0;
    setupWing(wing: selectedWing.value);
    qrWingId=0;

    departmentList.clear();
    selectedDept.value = null;
    issueList.clear();
    selectedIssue.value = null;

    // getDepartments();
    // getIssues();
    // getRequestList();
    details.value = null;
  }
}
