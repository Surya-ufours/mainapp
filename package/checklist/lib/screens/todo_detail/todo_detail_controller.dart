import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:i2iutils/helpers/qr_scan.dart';

import '../../api/api_calls.dart';
import '../../database/dao/barcode_dao.dart';
import '../../database/dao/template_detail_dao.dart';
import '../../database/database.dart';
import '../../helpers/session.dart';
import '../../helpers/utils.dart';
import '../../routes/gc_app_pages.dart';

class TodoDetailController extends GetxController{
  var args=Get.arguments;
  RxList list=RxList();
  RxBool isLoading=true.obs;
  bool isMissingSlot=false;
  int CH=0;
  final _appDb = Get.find<GCAppDb>();
  late BarcodeDao barcodeDao;
  late TemplateDetailDao detailDao;

  final box=GetStorage();

  @override
  void onInit() {
    super.onInit();
    CH= int.parse(getDate(format: "HH"));
    barcodeDao = BarcodeDao(_appDb);
    detailDao = TemplateDetailDao(_appDb);
    getTodoDetails();
  }


  getTodoDetails() async{

    if(await isNetConnected()){
    var params={
        'companyid':encryptString('', args['companyId']),
        'locationid':encryptString('', args['locationId']),
        'buildingid':encryptString('', args['buildingId']),
        'departmentid':encryptString('', '${args['todo']['departmentid']}'),
        'categoryid':encryptString('', '${args['todo']['categoryid']}'),
        'status': args['todo']['iscompleted'],
        'floorid':encryptString('', args['floorId']),
        'wingid':encryptString('', args['wingId']),
        'isdetail': true,
        'date': '${getDate(format: "yyyy-MM-dd")} ${args['toTime']}',
        'fromtime': args['isMissingSlot'] ? '00:00':args['fromTime'],
        'totime': args['isMissingSlot'] ? '${getDate(format: 'HH')}:00': args['toTime'],
        'userid':args['userId'],
        'token': args['token'],
      };

    var response;
    if(args['isChecklist']){
      response=await ApiCall().getTodosChecklist(params);
    }else{
      response=await ApiCall().getTodosLogsheet(params);
    }

      if(response!=null){
        if(response['status']){
          list(response['result']);
        }else{
          showToastMsg(response['message']);
        }
      }

      isLoading(false);

    }
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
              onTap: (){
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
                    code, args['todo']['departmentid']);
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
        data = await barcodeDao.getBarcodeSql(code, args['todo']['departmentid']);
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
          await detailDao.getTemplateDetailByDeptId(code, args['todo']['departmentid']);
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


}