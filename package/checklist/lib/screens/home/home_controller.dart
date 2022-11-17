import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:i2iutils/helpers/hexcolor.dart';
import 'package:i2iutils/widgets/button.dart';
import 'package:i2iutils/helpers/qr_scan.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../api/api_calls.dart';
import '../../database/dao/barcode_dao.dart';
import '../../database/dao/checklist_transaction_dao.dart';
import '../../database/dao/logsheet_transaction_dao.dart';
import '../../database/dao/template_detail_dao.dart';
import '../../database/dao/user_dao.dart';
import '../../database/database.dart';
import '../../helpers/session.dart';
import '../../helpers/utils.dart';
import '../../routes/gc_app_pages.dart';
import '../../screens/home/sync_data.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  bool isHoliday = false;
  String userId = "", today = '', token = '';
  int companyId = -1, locationId = -1, selectedDeptId = -1;
  RxString selectedDepartment = 'loading...'.obs;
  late List departments;
  final _appDb = Get.find<GCAppDb>();
  late UserDao userDao;
  late BarcodeDao barcodeDao;
  late TemplateDetailDao detailDao;
  late ChecklistTransactionDao checklistDao;
  late LogsheetTransactionDao logsheetDao;

  RxInt checklistCount = 0.obs, logsheetCount = 0.obs;

  TextEditingController barcodeController = TextEditingController();

  RxBool isUploading = false.obs, hideUploadLabel = false.obs;

  @override
  void onInit() {
    super.onInit();

    userId = box.read(Session.userId);
    token = box.read(Session.token);
    companyId = box.read(Session.userCompanyId);
    locationId = box.read(Session.userLocationId);
    selectedDeptId = box.read(Session.userDeptId) ?? -1;
    today = getDate(format: 'yyyy-MM-dd');

    departments = jsonDecode(box.read(Session.userDepartments) ??
        "[]"); // use departmentid, department, isImageUpload4AllChecklist

    userDao = UserDao(_appDb);
    barcodeDao = BarcodeDao(_appDb);
    detailDao = TemplateDetailDao(_appDb);
    checklistDao = ChecklistTransactionDao(_appDb);
    logsheetDao = LogsheetTransactionDao(_appDb);

    var res = departments.firstWhere(
        (element) => element['departmentid'] == selectedDeptId,
        orElse: () => null);
    if (res != null) {
      selectedDeptId = res['departmentid'];
      selectedDepartment(res['department']);
      box.write(Session.userDeptShowImage, res['isImageUpload4AllChecklist']);
    } else if (departments.isNotEmpty) {
      selectedDeptId = departments.first['departmentid'];
      selectedDepartment(departments.first['department']);
      box.write(Session.userDeptShowImage,
          departments.first['isImageUpload4AllChecklist']);
      box.write(Session.userDeptId, selectedDeptId);
    } else {
      selectedDepartment('Department Not Found');
    }

    checkLeave();
  }

  @override
  void onReady() async{
    super.onReady();

    if (!(box.read(Session.isGreenchecklistHaveDB) ?? false)) {
      if((box.read(Session.key) ?? '').isEmpty) {
        if (await isNetConnected()) {
          var response = await ApiCall().getSecureKey();
          if (response != null) {
            box.write(Session.key, response['key'].toString());
          }
        } else {
          showToastMsg('Check internet connection');
        }
      }

      Get.offAllNamed(GCRoutes.download);

    }

    if ((Get.arguments ?? false) && await isNetConnected()) {
      Get.toNamed(GCRoutes.todo);
    }

    watchUnSyncCount();

    checkTimeSetting(Get.context!);
    checkRootedDevice(Get.context!);
  }

  watchUnSyncCount() async {
    var cStream = await checklistDao.getUnSyncChecklistCount();
    cStream.listen((event) {
      checklistCount(event);
      box.write(Session.offlineChecklistCount, event);
      if (checklistCount.value == 0 && logsheetCount.value == 0) {
        hideUploadLabel(true);
      }
    });

    var lStream = await logsheetDao.getUnSyncLogsheetCount();
    lStream.listen((event) {
      box.write(Session.offlineLogsheetCount, event);
      logsheetCount(event);
      if (checklistCount.value == 0 && logsheetCount.value == 0) {
        hideUploadLabel(true);
      }
    });
  }

  checkLeave() async {

    if (await isNetConnected()) {
      var params = {
        "companyid": encryptString('', '$companyId'),
        "locationid": encryptString('', '$locationId'),
        "departmentid": encryptString('', '$selectedDeptId'),
        "date": today,
        "userid": userId,
        "token": token,
      };

      var response = await ApiCall().checkLeaveByDepartment(params);
      if (response != null) {
        if (response['status']) {
          isHoliday = response['IsHoliday'];
        } else if (response['message']
            .toString()
            .contains('Invalid Token!!!')) {
          //toast the message
          showToastMsg('Invalid Token! Please Re-login', longToast: true);
          box.remove(Session.token);
          Get.offAllNamed(GCRoutes.login);
        }
      }
    }
  }

  logout() {
    Get.bottomSheet(Container(
      height: 190,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Logout?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const Divider(),
          const Text(
            'Are you sure to logout from this device.',
            style: TextStyle(fontSize: 14),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              hideUploadLabel.value
                  ? ''
                  : 'Some of your data not synced to server, Do you want to continue your logout process?',
              style: TextStyle(
                color: HexColor('f22e1f'),
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          CustomButton(
              width: 100,
              buttonText: 'Yes',
              onPressed: () async {
                String uname = box.read(Session.userEmail) ?? '';
                String password = box.read(Session.userPassword) ?? '';
                bool isRemember = box.read(Session.isRememberMe) ?? false;

                //always store
                String token = box.read(Session.token) ?? '';
                String key = box.read(Session.key) ?? '';
                String userId = box.read(Session.userId) ?? '';

                await box.erase();
                if (isRemember) {
                  box.write(Session.userEmail, uname);
                  box.write(Session.userPassword, password);
                }

                box.write(Session.token, token);
                box.write(Session.key, key);
                box.write(Session.userId, userId);

                Get.offAllNamed(GCRoutes.login);
              }),
        ],
      ),
    ));
  }

  showDepartmentBottomSheet() {
    Get.bottomSheet(Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 6,
          ),
          const Text(
            'Select Department',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const Divider(),
          departments.isEmpty
              ? const Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: Text('Department Not Found'),
                )
              : const SizedBox.shrink(),
          Expanded(
            child: ListView.builder(
                itemCount: departments.length,
                itemBuilder: (_, index) => ListTile(
                      onTap: () {
                        box.write(Session.userDeptShowImage,
                            departments[index]['isImageUpload4AllChecklist']);
                        selectedDeptId = departments[index]['departmentid'];
                        box.write(Session.userDeptId, selectedDeptId);
                        selectedDepartment(departments[index]['department']);
                        Get.back();
                      },
                      title: Text('${departments[index]['department']}'),
                      trailing:
                          departments[index]['departmentid'] == selectedDeptId
                              ? Image.asset('assets/ok.png', width: 25)
                              : null,
                    )),
          ),
        ],
      ),
    ));
  }

  showOptionsBottomSheet(String code, int count) {
    Get.bottomSheet(
      Container(
        height: 170,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 6,
            ),
            const Text(
              'Select Entry',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Get.back();
                Get.toNamed(GCRoutes.checklist,
                    arguments: {'code': code, 'imageCount': count});
              },
              title: const Text('Checklist'),
              leading: Image.asset(
                'assets/todo.png',
                width: 25,
              ),
            ),
            ListTile(
              onTap: () async {
                Get.back();
                //get logsheets if have on directly go to logsheet screen
                var list = await detailDao.getTemplateDetailByDeptId(
                    code, selectedDeptId);
                if (list.length == 1) {
                  Get.toNamed(GCRoutes.logsheet, arguments: {
                    "code": code,
                    "templateId": list.first.equipmenttemplateid,
                    'imageCount': count,
                    'name': list.first.equipmentname
                  });
                } else {
                  showLogsheetBottomSheet(
                    code,
                    count,
                    list,
                  );
                }
              },
              title: const Text('Log-sheet'),
              leading: Image.asset('assets/template_detail.png', width: 25),
            )
          ],
        ),
      ),
      isDismissible: false,
    );
  }

  showLogsheetBottomSheet(
      String code, int count, List<TemplateDetailData> list) {
    Get.bottomSheet(
      Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 6,
            ),
            const Text(
              'Select Log-sheet',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const Divider(),
            list.isEmpty
                ? const Text("Logsheeet's Not Found")
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (_, index) {
                        return ListTile(
                          onTap: () {
                            Get.toNamed(GCRoutes.logsheet, arguments: {
                              "code": code,
                              "templateId": list[index].equipmenttemplateid,
                              'imageCount': count,
                              'name': list[index].equipmentname
                            });
                          },
                          title: Text(list[index].equipmentname),
                        );
                      },
                      itemCount: list.length,
                    ),
                  ),
          ],
        ),
      ),
      isDismissible: false,
    );
  }

  scanQR() async {
    var count = await barcodeDao.getBarcodeCount() ?? 0;
    debugPrint('barcode count : $count');
    if (count <= 0) {
      //toast message and return No Data Found
      showToastMsg('No Data Found');
      return;
    }
    if (isHoliday) {
      //show Sorry! It's a Holiday. Activity disabled
      showToastMsg("Sorry! It's a Holiday. Activity disabled");
      return;
    }

    Get.to(QrScan((code) async {
      debugPrint(code);
      //check database and if have asset move to next screen, close it before
      if (code.length <= 4) {
        showToastMsg('Invalid QR-Code');
        return Future(() => false);
      }

      BarcodeData? data = await barcodeDao.getBarcode(code);
      int checkCode = 0;
      if (data != null) {
        data = await barcodeDao.getBarcodeSql(code, selectedDeptId);
        if (data != null) {
          checkCode = (data.ischecklist && data.islogsheet)
              ? 3
              : (!data.ischecklist && data.islogsheet)
                  ? 2
                  : (data.ischecklist && !data.islogsheet)
                      ? 1
                      : 0;
        } else {
          checkCode = 4;
        }
      }

      /*
      * checkCode means
      * 0 - No Data for barcode
      * 1 - have only checklist
      * 2 - have only logsheet
      * 3 - have both
      * 4 - access denied
      * */

      switch (checkCode) {
        case 0:
          //showToast message
          showToastMsg('No Data Found');

          return Future(() => false);

        case 4:
          //show toast
          showToastMsg('Access Denied!');
          return Future(() => false);

        case 1:
          box.write(Session.scanTime, getDate(format: 'yyyy-MM-dd HH:mm'));
          Get.back(result: true);
          Get.toNamed(GCRoutes.checklist,
              arguments: {'code': code, 'imageCount': data?.imagecount ?? 0});
          return Future(() => true);

        case 2:
          box.write(Session.scanTime, getDate(format: 'yyyy-MM-dd HH:mm'));
          Get.back(result: true);
          //get logsheets if have on directly go to logsheet screen
          var list =
              await detailDao.getTemplateDetailByDeptId(code, selectedDeptId);
          if (list.length == 1) {
            Get.toNamed(GCRoutes.logsheet, arguments: {
              "code": code,
              "templateId": list.first.equipmenttemplateid,
              'imageCount': data?.imagecount ?? 0,
              'name': list.first.equipmentname
            });
          } else {
            showLogsheetBottomSheet(
              code,
              data?.imagecount ?? 0,
              list,
            );
          }

          return Future(() => true);

        case 3:
          box.write(Session.scanTime, getDate(format: 'yyyy-MM-dd HH:mm'));
          Get.back();
          showOptionsBottomSheet(code, data?.imagecount ?? 0);
          return Future(() => true);
      }
      showToastMsg('Something wrong');

      return Future(() => false);
    }));
  }

  submitQrcode() async {
    var code = barcodeController.text.toString().trim();
    if (code.length <= 4) {
      showToastMsg('Invalid QR-Code');
      return;
    }

    var count = await barcodeDao.getBarcodeCount() ?? 0;
    debugPrint('barcode count : $count');
    if (count <= 0) {
      //toast message and return No Data Found
      showToastMsg('No Data Found');
      return;
    }
    if (isHoliday) {
      //show Sorry! It's a Holiday. Activity disabled
      showToastMsg("Sorry! It's a Holiday. Activity disabled");
      return;
    }

    BarcodeData? data = await barcodeDao.getBarcode(code);
    debugPrint(data.toString());
    int checkCode = 0;
    if (data != null) {
      data = await barcodeDao.getBarcodeSql(code, selectedDeptId);
      debugPrint(data.toString());
      if (data != null) {
        checkCode = (data.ischecklist && data.islogsheet)
            ? 3
            : (!data.ischecklist && data.islogsheet)
                ? 2
                : (data.ischecklist && !data.islogsheet)
                    ? 1
                    : 0;
      } else {
        checkCode = 4;
      }
    }
    debugPrint('checkCode $checkCode');

    /*
      * checkCode means
      * 0 - No Data for barcode
      * 1 - have only checklist
      * 2 - have only logsheet
      * 3 - have both
      * 4 - access denied
      * */

    switch (checkCode) {
      case 0:
        //showToast message
        showToastMsg('No Data Found');
        break;

      case 4:
        //show toast
        showToastMsg('Access Denied!');
        break;

      case 1:
        box.write(Session.scanTime, getDate(format: 'yyyy-MM-dd HH:mm'));
        Get.toNamed(GCRoutes.checklist,
            arguments: {'code': code, 'imageCount': data?.imagecount ?? 0});
        break;

      case 2:
        box.write(Session.scanTime, getDate(format: 'yyyy-MM-dd HH:mm'));
        //get logsheets if have on directly go to logsheet screen
        var list =
            await detailDao.getTemplateDetailByDeptId(code, selectedDeptId);
        if (list.length == 1) {
          Get.toNamed(GCRoutes.logsheet, arguments: {
            "code": code,
            "templateId": list.first.equipmenttemplateid,
            'imageCount': data?.imagecount ?? 0,
            'name': list.first.equipmentname
          });
        } else {
          showLogsheetBottomSheet(
            code,
            data?.imagecount ?? 0,
            list,
          );
        }
        break;

      case 3:
        box.write(Session.scanTime, getDate(format: 'yyyy-MM-dd HH:mm'));
        showOptionsBottomSheet(code, data?.imagecount ?? 0);
        break;
    }
  }

  uploadingOffline() async {
    isUploading(true);
    SyncData(
      checklistDao,
      logsheetDao,
      {
        'version': await getAppVersion(),
        'os': '${await getDeviceOs()}',
        'token': '${box.read(Session.token)}'
      },
      () => isUploading(false),
      (error) {
        debugPrint(error);
      },
    ).execute();
  }

  backupDatabase() async {
    // if(await isHaveStoragePermission()) {
    showToastMsg('Please wait');

    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    var str =
        (await getExternalStorageDirectories(type: StorageDirectory.downloads))
            ?.first
            .path;

    str = (await getExternalStorageDirectory())?.path;
    debugPrint('str --- $str');

    if (str == null) return;

    await file.copy(
        '/storage/emulated/0/greenchecklist_db_${getDate(format: 'yyyyMMdd_HHmm')}.sqlite');

    showToastMsg('Backup Completed');
    // }
  }
}
