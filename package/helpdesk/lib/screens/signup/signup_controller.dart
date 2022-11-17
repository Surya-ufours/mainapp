/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/api/helpdesk_api_calls.dart';
import 'package:helpdesk/helpers/utils.dart';
import 'package:helpdesk/routes/main_app_routes.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class SignupController extends GetxController {
  RxInt activeStep = 0.obs;
  RxBool isLoading = false.obs;

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();

  //second screen
  RxMap<String, int> companyList = RxMap();
  RxString selectedCompany = "".obs;

  RxList locationList = RxList();
  RxList selectedLocationList = RxList();

  RxList buildingList = RxList();
  RxList selectedBuildingList = RxList();

  RxList floorList = RxList();
  RxList selectedFloorList = RxList();

  String compId = '', locIds = '', buildIds = '', floorIds = '', domain = '';

  nextPage() async {
    if (fnameController.text.isEmpty) {
      showToastMsg('Enter First Name');
    } else if (lnameController.text.isEmpty) {
      showToastMsg('Enter Last Name');
    } else if (emailController.text.isEmpty) {
      showToastMsg('Enter EmailID');
    } else if (!GetUtils.isEmail(emailController.text)) {
      showToastMsg('Enter Correct EmailID');
    } else if (mobileController.text.isEmpty) {
      showToastMsg('Enter Mobile Number');
    } else if (passwordController.text.isEmpty) {
      showToastMsg('Enter Password');
    } else if (cpasswordController.text.isEmpty) {
      showToastMsg('Enter Confirm Password');
    } else if (passwordController.text != cpasswordController.text) {
      showToastMsg("Password doesn't match");
    } else {
      if (await isNetConnected()) {
        Get.focusScope?.unfocus();
        domain = emailController.text.split('@')[1];
        isLoading(true);
        if (await isNetConnected()) {
          var response = await HelpdeskApiCall().getDomainCompanies(domain);
          if (response != null) {
            if (response['Status']) {
              if (response['ReturnData'].isNotEmpty) {
                companyList.addAll({
                  for (var e in response['ReturnData'])
                    e['CompanyName']: e['CompanyID']
                });
                selectedCompany(companyList.keys.first);
                compId = '${companyList.values.first}';
                setupLocation();
                activeStep(1);
              }
            } else {
              showToastMsg('${response['Message']}');
            }
          }
        }
        isLoading(false);
      }
    }
  }

  setupLocation() async {
    locationList.clear();
    selectedLocationList.clear();
    buildingList.clear();
    selectedBuildingList.clear();
    floorList.clear();
    selectedFloorList.clear();
    compId = getId(companyList.value, selectedCompany.value).toString();

    isLoading(true);
    var response =
        await HelpdeskApiCall().getLocationList(compId.toString(), domain);
    if (response != null) {
      if (response['Status']) {
        locationList(response['ReturnData']);
      } else {
        showToastMsg('${response['Message']}');
      }
    }
    isLoading(false);
  }

  setupBuilding() async {
    buildingList.clear();
    selectedBuildingList.clear();
    floorList.clear();
    selectedFloorList.clear();

    if (selectedLocationList.isEmpty) return;

    locIds = '';
    for (var element in selectedLocationList) {
      locIds = '$locIds,${element['LocationID']}';
    }
    locIds = locIds.substring(1, locIds.length);

    isLoading(true);
    var response = await HelpdeskApiCall().getBuildingList(locIds);
    if (response != null) {
      if (response['Status']) {
        buildingList(response['ReturnData']);
      } else {
        showToastMsg('${response['Message']}');
      }
    }
    isLoading(false);
    setupFloor();
  }

  setupFloor() async {
    floorList.clear();
    selectedFloorList.clear();
    if (selectedBuildingList.isEmpty) return;

    buildIds = '';
    for (var element in selectedBuildingList) {
      buildIds = '$buildIds,${element['BuildingID']}';
    }
    buildIds = buildIds.substring(1, buildIds.length);

    isLoading(true);
    var response = await HelpdeskApiCall().getFloorList(buildIds);
    if (response != null) {
      if (response['Status']) {
        floorList(response['ReturnData']);
      } else {
        showToastMsg('${response['Message']}');
      }
    }
    isLoading(false);
  }

  void showLocations() async {
    await showDialog(
      context: Get.context!,
      builder: (ctx) {
        return MultiSelectDialog(
          items: locationList
              .map((e) => MultiSelectItem(e, e['LocationName']))
              .toList(),
          initialValue: selectedLocationList,
          onConfirm: (values) {
            selectedLocationList(values);
            setupBuilding();
          },
        );
      },
    );
  }

  void showBuilding() async {
    await showDialog(
      context: Get.context!,
      builder: (ctx) {
        return MultiSelectDialog(
          items: buildingList
              .map((e) => MultiSelectItem(e, e['BuildingName']))
              .toList(),
          initialValue: selectedBuildingList,
          onConfirm: (values) {
            selectedBuildingList(values);
            setupFloor();
          },
        );
      },
    );
  }

  void showFloor() async {
    await showDialog(
      context: Get.context!,
      builder: (ctx) {
        return MultiSelectDialog(
          items:
              floorList.map((e) => MultiSelectItem(e, e['FloorName'])).toList(),
          initialValue: selectedFloorList,
          onConfirm: (values) {
            selectedFloorList(values);
          },
        );
      },
    );
  }

  submit() async {
    String floorIds = '';
    for (var element in selectedFloorList) {
      floorIds = '$floorIds,${element['FloorID']}';
    }
    floorIds = floorIds.isEmpty ? '' : floorIds.substring(1, floorIds.length);

    if (selectedCompany.isEmpty) {
      showToastMsg('Select Company');
    } else if (locIds.isEmpty) {
      showToastMsg('Select Location');
    } else if (buildIds.isEmpty) {
      showToastMsg('Select Building');
    } else if (floorIds.isEmpty) {
      showToastMsg('Select Floor');
    } else {
      if (await isNetConnected()) {
        isLoading(true);
        var params = {
          'LocationID': locIds,
          'BuildingIds': buildIds,
          'CompanyID': compId,
          'FloorID': floorIds,
          'Password': passwordController.text,
          'MobileNo': mobileController.text,
          'EmailID': emailController.text,
          'LastName': lnameController.text,
          'FirstName': fnameController.text,
          'Domain': domain,
          'UserID': 0,
        };

        var response = await HelpdeskApiCall().signupTenant(params);
        if (response != null) {
          if (response['Status']) {
            //alert
            showMessage('Success', '${response['Message']}',
                isDismiss: false,
                actionBtn: TextButton(
                    onPressed: () async {
                      Get.offAllNamed(Routes.LOGIN);
                    },
                    child: const Text('Okay')));
          } else {
            //alert
            showMessage(
              'Failed',
              '${response['Message']}',
              isDismiss: true,
            );
          }
        }
        isLoading(false);
      }
    }
  }
}
*/
