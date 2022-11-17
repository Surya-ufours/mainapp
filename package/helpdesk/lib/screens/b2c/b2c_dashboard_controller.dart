import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:i2iutils/helpers/image_picker_helper.dart';
import 'package:i2iutils/widgets/button.dart';
import 'package:i2iutils/helpers/qr_scan.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../api/helpdesk_api_calls.dart';
import '../../helpers/color.dart';
import '../../helpers/loader.dart';
import '../../helpers/notification.dart';
import '../../helpers/strings.dart';
import '../../helpers/utils.dart';
import '../../model/department_response.dart';
import '../../model/feedback_tickets_response.dart';
import '../../model/issue_response.dart';
import '../../routes/hd_app_routes.dart';

class B2CDashboardController extends GetxController {
  final box = GetStorage();
  bool canExit = false;

  bool isShowFeedback = Get.arguments ?? false;
  int userId = -1,
      compId = -1,
      locId = -1,
      buildId = -1,
      floorId = -1,
      wingId = -1,
      complaintTypeId = -1,
      roleId = -1;

  //for feedback
  Rx<FeedbackTicketData?> fData = Rx(null);
  RxBool isLoading = false.obs;

  TextEditingController remarkController = TextEditingController();

  Rx<String?> submitImage = Rx(null);
  final picker = ImagePicker();
  late String path;

  RxList<Department> departmentList = RxList();
  RxList<Issue> issueList = RxList();

  Rx<Department?> selectedDept = Rx(null);
  Rx<Issue?> selectedIssue = Rx(null);

  RxBool qrScanned = false.obs;
  String reqType = '';
  RxInt issueListSize = 0.obs, departmentListSize = 0.obs;
  int FINAL_SIZE = 6;

  @override
  void onInit() {
    userId = box.read(USER_ID) ?? -1;
    compId = box.read(COMP_ID) ?? -1;
    roleId = box.read(ROLE_ID) ?? -1;
    super.onInit();

    var temp = jsonDecode(box.read(LOC_LIST) ?? '[]') as List;
    locId = temp.isNotEmpty ? temp.first['LocationId'] : -1;

    temp = jsonDecode(box.read(BUILDING_LIST) ?? '[]') as List;
    buildId = temp.isNotEmpty ? temp.first['BuildingID'] : -1;

    temp = jsonDecode(box.read(FLOOR_LIST) ?? '[]') as List;
    floorId = temp.isNotEmpty ? temp.first['FloorID'] : -1;

    temp = jsonDecode(box.read(WING_LIST) ?? '[]') as List;
    wingId = temp.isNotEmpty ? temp.first['WingID'] : -1;
  }

  @override
  void onReady() async {
    super.onReady();

    if (!await isNetConnected()) {
      showToastMsg('Check internet connection');
    }

    // var newVersion = NewVersion();
    // newVersion.showAlertIfNecessary(context: Get.context!);

    getFeedbackTickets();
    // checkAppVersion();
    getDepartments();
    getComplaintType();

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

/*  checkAppVersion() async {
    if (await isNetConnected()) {
      try {
        var response = await HelpdeskApiCall().getAppVersion();
        if (response != null && response['ifazidesk'] != null) {
          var result = response['ifazidesk'];
          int currentVersionCode =
              int.parse((await PackageInfo.fromPlatform()).buildNumber);
          int versionCode = result['versionCode'];
          bool forceUpdate = result['forceUpdate'];
          if (versionCode > currentVersionCode) {
            Get.bottomSheet(
                Container(
                  height: 150,
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
                      const Text(
                        'Update Available!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const Divider(),
                      Text('${result['message']}'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomButton(
                        buttonText: 'Update',
                        onPressed: () {
                          if (Platform.isAndroid) {
                            launchUrlString('${result['androidUrl']}',
                                mode: LaunchMode.externalApplication);
                          } else {
                            launchUrlString('${result['iosUrl']}',
                                mode: LaunchMode.externalApplication);
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
                enableDrag: !forceUpdate,
                isDismissible: !forceUpdate);
          }
        }
      } catch (e) {
        //ignored
      }
    }
  }*/

  getFeedbackTickets() async {
    if (await isNetConnected()) {
      var response = await HelpdeskApiCall()
          .getFeedbackTickets('${box.read(COMP_ID)}', '${box.read(USER_ID)}');
      if (response != null && response.status) {
        fData(response.returnData);
        if (response.returnData.feedbackdetails?.isNotEmpty ?? false) {
          if (isShowFeedback) {
            showFeedbackDialog();
          }
        }
      }
    }
  }

  getSettings() async {
    if (await isNetConnected()) {
      var response = await HelpdeskApiCall().getSettings('$userId');
      if (response != null) {
        if (response['RequestType'] ?? false) {
          getRequestList();
        }

        box.write(IS_CUST_REF, response['CustRefNo'] ?? false);
        box.write(IS_REQ_TYPE, response['RequestType'] ?? false);
        box.write(CAN_SHOW_GAL_OPT, response['GalleryOption'] ?? false);
        box.write(EMP_ID, response['RequestorID']);

        if (response['Password'] != null &&
            response['Password'].trim() != box.read(USER_PASSWORD)) {
          /*logout(
              isDismiss: false,
              msg: 'Password has been changed.\nTo continue please re-login');*/
        }
      }
    }
  }

/*  logout(
      {bool isDismiss = true,
      String msg = 'Are you sure to logout from app.'}) async {
    showMessage('Logout ${isDismiss ? '?' : '!'}', msg, Get.context!,
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

  showFeedbackDialog() async {
    await showModalBottomSheet(
        context: Get.context!,
        isDismissible: true,
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
                  'Please share your feedback',
                  style: TextStyle(
                      color: colorPrimary, fontWeight: FontWeight.w800),
                ),
                const Divider(),
                const Text(
                    'One of your tickets were recently closed. Please share your feedback to improve our work. Thanks'),
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                  width: 150,
                  buttonText: 'Give Feedback',
                  onPressed: () async {
                    Get.back();
                    if (fData.value == null) return;
                    var res = await Get.toNamed(HDRoutes.FEEDBACK,
                        arguments: fData.value);
                    if (res != null) {
                      fData.value?.feedbackdetails = res;
                      fData.refresh();
                    }
                  },
                  textSize: 13,
                  height: 35,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          );
        });
  }

  getDepartments() async {
    if (await isNetConnected()) {
      isLoading(true);
      try {
        var response = await HelpdeskApiCall().getDepartments(compId, userId);
        if (response != null) {
          departmentList.clear();
          departmentListSize(0);
          selectedDept.value = null;
          if (response.status) {
            departmentListSize(response.lstDepartment.length > FINAL_SIZE
                ? FINAL_SIZE
                : response.lstDepartment.length);
            departmentList(response.lstDepartment);
            selectedDept(response.lstDepartment.first);
            getIssues();
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

  getIssues({int? cId, int? dId}) async {
    if (await isNetConnected()) {
      isLoading(true);
      try {
        int deptid = dId ?? selectedDept.value?.departmentID ?? -1;

        var response =
            await HelpdeskApiCall().getIssues(cId ?? compId, userId, deptid);
        if (response != null) {
          issueList.clear();
          issueListSize(0);
          selectedIssue.value = null;
          if (response.status) {
            issueListSize(response.lstIssue.length > FINAL_SIZE
                ? FINAL_SIZE
                : response.lstIssue.length);
            issueList(response.lstIssue);
            selectedIssue(issueList.first);
            changeRemark();
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

  changeRemark() {
    remarkController.text = selectedIssue.value?.categoryName ?? '';
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
        try {
          var response = await HelpdeskApiCall().getQrCodeDetails(
              box.read(COMP_ID),
              code,
              userId,
              box.read(ROLE_ID)); //static param 1014, 2157b165
          if (response != null) {
            if (response.status) {
              if (response.data != null) {

                selectedDept(Department(
                    response.data!.departmentID,
                    response.data!.departmentName,
                    "",
                    response.data!.departmentLogoFileName));
                qrScanned(true);

                issueList.clear();
                selectedIssue.value = null;
                getIssues(
                    cId: response.data?.companyID,
                    dId: response.data?.departmentID);
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
      }
      return Future(() => false);
    }));
  }

  getComplaintType() async {
    if (await isNetConnected()) {
      isLoading(true);
      try {
        var response = await HelpdeskApiCall().getComplaintType(
          compId,
        );
        if (response != null && response.isNotEmpty) {
          complaintTypeId = response.first["IssueID"];
        }
        // debugPrint('compTypeId $complaintTypeId');

      } catch (e) {
        debugPrint(e.toString());
      }
      isLoading(false);
    }
  }

  getRequestList() async {
    if (await isNetConnected()) {
      isLoading(true);
      try {
        var response =
            await HelpdeskApiCall().getRequestTypeList(compId, roleId);

        if (response['Status'] && response['RequestType'].isNotEmpty) {
          reqType = '${response['RequestType'].first['requestTypdId']}';
        }
      } catch (e) {
        debugPrint(e.toString());
      }
      isLoading(false);
    }
  }

  createB2CTicket() async {
    if (remarkController.text.isEmpty) {
      showToastMsg('Enter Remarks');
    } else {
      if (await isNetConnected()) {
        String name = (box.read(EMP_ID) ?? '').isEmpty
            ? box.read(EMP_NAME)
            : '${box.read(EMP_NAME)} (${box.read(EMP_ID)})';

        Get.focusScope?.unfocus();

        var params = {
          "CompanyID": compId,
          "LocationID": locId,
          "BuildingID": buildId,
          "FloorID": floorId,
          "WingID": wingId,
          "DepartmentID": selectedDept.value!.departmentID,
          "IssueID": selectedIssue.value!.categoryID,
          "Description": remarkController.text,
          "PriorityID": selectedIssue.value!.priorityID,
          "ResponseTime": selectedIssue.value!.responseTime,
          "UserID": userId,
          "RequesterName": name,
          "RequestType": reqType,
          "RequestedBy": 1,
          "ComplaintTypeID": complaintTypeId,
          "CustRefNo": '-',
          "bas64Image":
              submitImage.value != null && submitImage.value!.isNotEmpty
                  ? base64Encode(File(submitImage.value!).readAsBytesSync())
                  : "",
          "filetype": ".jpeg",
          "CallTypeID": 'From App',
          "RequesterMailID": box.read(EMP_EMAIL),
          "RequesterMobileNo": box.read(EMP_PHONE),
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
                      remarkController.clear();
                      Get.back();
                      Get.toNamed(HDRoutes.B2C_DASHBOARD);
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
}
