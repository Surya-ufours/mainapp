import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../database/dao/logsheet_transaction_dao.dart';
import '../../database/dao/parameter_dao.dart';
import '../../database/dao/template_dao.dart';
import '../../database/dao/template_detail_dao.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:i2iutils/widgets/button.dart';
import 'package:signature/signature.dart';

import '../../api/api_calls.dart';
import '../../database/dao/sub_parameter_dao.dart';
import '../../database/database.dart';
import '../../helpers/session.dart';
import '../../helpers/utils.dart';
import '../../model/parameters.dart';

class LogsheetController extends GetxController {
  final barcode = Get.arguments['code'];
  final templateId = Get.arguments['templateId'];
  final imageCount = Get.arguments['imageCount'];

  final TextEditingController remarkController = TextEditingController();

  final box = GetStorage();
  String userId = "", submitDateTime = '', token = '';
  int companyId = -1, locationId = -1, selectedDeptId = -1, slotId = 0;
  int timeSH = 0, timeEH = 0, currentH = 0;
  String finalStartTime = "00:00", finalEndTime = "00:00";

  RxString compDet = "".obs;
  RxString buildDet = "".obs;
  RxString auditDet = "".obs;
  RxString timeSlotDet = "".obs;
  RxString txtImageCount = "0/0".obs;

  RxBool isLoading = false.obs;
  RxBool switchValue = true.obs;
  RxBool isDrawOk = false.obs;

  String submitDate = '';

  final _db = Get.find<GCAppDb>();
  late ParameterDao parameterDao;

  late SubParameterDao subParameterDao;

  late TemplateDao templateDao;

  late TemplateDetailDao detailDao;
  late LogsheetTransactionDao transactionDao;

  final SignatureController signController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  final ymdhm = 'yyyy-MM-dd HH:mm';

  RxList<Parameter> parameterList = RxList();

  RxList<String> images = RxList();

  bool isHaveImageOnChecklist = false;

  late TemplateDetailData detail;
  bool isError = false;

  @override
  void onInit() async {
    super.onInit();

    if (barcode == null) return;

    userId = box.read(Session.userId);
    token = box.read(Session.token);
    companyId = box.read(Session.userCompanyId);
    locationId = box.read(Session.userLocationId);
    selectedDeptId = box.read(Session.userDeptId);
    isHaveImageOnChecklist = box.read(Session.userDeptShowImage);

    submitDateTime = getDate(format: ymdhm);
    submitDate = getDate(format: 'yyyy-MM-dd');

    parameterDao = ParameterDao(_db);
    subParameterDao = SubParameterDao(_db);
    detailDao = TemplateDetailDao(_db);
    templateDao = TemplateDao(_db);
    transactionDao = LogsheetTransactionDao(_db);

    var template = await templateDao.getSatSun(barcode);
    debugPrint('q : ${template.toString()}');
    if (template != null && checkIsRequired(template)) {
      alertUser(6); //time exceed
      return;
    }

    var t = await detailDao.getTemplateDetail(barcode, templateId);
    debugPrint(t.toString());
    if (t == null) {
      alertUser(7);
      return;
    }

    detail = t;

    timeSH = int.parse(detail.starttime.split(':')[0]);
    timeEH = int.parse(detail.endtime.split(':')[0]);
    currentH = int.parse(getDate(format: 'HH'));
    debugPrint('night shift check $currentH $timeSH $timeEH');

    if (currentH < timeSH || currentH >= timeEH) {
      //time exceed
      alertUser(5);
      return;
    }

    //get interval
    int slotInterval = detail.interval;
    //get slot no logic ---- currentHour - slotTimeStartHour + 1 / interval like (((15-8) / 2)+1 )
    double currentSlot =
        (((currentH - timeSH) / slotInterval) + 1).floorToDouble();
    slotId = currentSlot.toInt();

    /*find corresponding time between using slot id
         * (3 * 2) + 8 = 14 is end so 14 - 2 is start then result is 12:00 - 14:00
         *  08:00 to 20:00 interval 2 and 3rd slot so result is 12 - 14
         */
    int currentEndTime = (slotId * slotInterval) + timeSH;
    finalStartTime = "${currentEndTime - slotInterval}:00";
    finalEndTime = "$currentEndTime:00";
    if (finalStartTime.length < 5) finalStartTime = "0$finalStartTime";
    if (finalEndTime.length < 5) finalEndTime = "0$finalEndTime";

    transactionDao = LogsheetTransactionDao(_db);

    //check is have offline data
    int count = await transactionDao.countLogsheetTransaction(
        barcode,
        submitDate,
        finalStartTime,
        finalEndTime,
        slotId,
        selectedDeptId,
        detail.wingid);
    debugPrint('count : $count');
    if (count > 0) {
      alertUser(1);
      return;
    }

    //checkOnline
    var params = {
      'locationid': encryptString('', '$locationId'),
      'departmentid': encryptString('', '$selectedDeptId'),
      'wingid': encryptString('', '${detail.wingid}'),
      'qrcode': barcode,
      'slotid': slotId,
      'ischecklist': false,
      'date': submitDate,
      'userid': userId,
      'token': token
    };
    ApiCall().checkIsHaveOnlineRecord(params).then((value) {
      if (!value['status']) {
        alertUser(1);
      }
    });

    compDet("${detail.companyname} - ${detail.LocationName}");
    buildDet(
        "${detail.buildingname} - ${detail.floorname} - ${detail.wingname}");
    auditDet("${detail.categoryname} - ${detail.auditname}");
    timeSlotDet("$finalStartTime - $finalEndTime");

    if (imageCount > 0) {
      txtImageCount('${images.length} / $imageCount');
    } else {
      txtImageCount("${images.length}");
    }

    var p = await parameterDao.getParameters(
        barcode, templateId, detail.equipmentnameid);
    debugPrint(p.toString());
    p.forEach((element) async {
      if (element.issubparamavailable) {
        var s = await subParameterDao.getSubParameters(
            element.equipmenttemplateid,
            element.equipmentnameid,
            element.equipmentparamid);
        element.subParameters(s);
      }
    });
    debugPrint(p.toString());

    parameterList(p);

    signController.onDrawMove = () {
      isDrawOk(signController.isNotEmpty);
    };
  }

  @override
  void onReady() {
    super.onReady();
    checkTimeSetting(Get.context!);
    checkRootedDevice(Get.context!);
  }


  submitLogsheet() async {
    //validation
    if (switchValue.value && images.length < imageCount) {
      //show error Capture minimum " + imageCount + " images
      showToastMsg('Capture Minimum $imageCount Images');
    } else if (!switchValue.value || isInValidLogsheet()) {
      //invalid checklist entry
      print('Invalid Logsheet Entries');
    } else if (signController.isEmpty) {
      //invalid signature
      showToastMsg('Invalid Signature');
    } else if (remarkController.text.isEmpty) {
      //Enter Remark
      showToastMsg('Enter Remark');
    }  else {
      isLoading(true);

      try {
        // int diffInSec = getDifferenceInSecond(
        //     box.read(Session.scanTime), submitDateTime, ymdhm);

        var transaction = LogsheetTransactionCompanion.insert(
          userId: userId,
          companyId: detail.companyid,
          companyName: detail.companyname,
          locationId: detail.locationid,
          locationName: detail.LocationName,
          buildingId: detail.BuildingID,
          buildingName: detail.buildingname,
          wingId: detail.wingid,
          wingName: detail.wingname,
          floorId: detail.floorid,
          floorName: detail.floorname,
          auditId: detail.auditid,
          auditName: detail.auditname,
          categoryId: detail.categoryid,
          categoryName: detail.categoryname,
          sectorId: detail.sectorid,
          slotId: slotId,
          remark: remarkController.text.trim(),
          equipmentId: detail.equipmentnameid,
          equipmentTemplateId: detail.equipmenttemplateid,
          barcode: barcode,
          signature: base64Encode(await signController.toPngBytes() ?? []),
          submitDate: submitDate,
          submitDateTime: getDate(format: ymdhm),
          submitInterval: detail.interval,
          submitStartTime: finalStartTime,
          submitEndTime: finalEndTime,
          logsheets: jsonEncode(parameterList),
          submitImages: jsonEncode(images),
          isOnOff: switchValue.value,
          supervisorName: box.read(Session.userName),
          deviceId: (await getDeviceUniqueId()) ?? "",
          guid: getCustomUniqueId(),
        );

        //show toast
        showToastMsg('Logsheet Saved');
        await transactionDao.insert(transaction);
        isLoading(false);

        Get.back();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  bool checkIsRequired(TemplateData checkSatSun) {
    return (!checkSatSun.isSaturdayReq &&
            getDate(format: "EEEE").toLowerCase() == "saturday") ||
        (!checkSatSun.isSundayReq &&
            getDate(format: "EEEE").toLowerCase() == "sunday");
  }

  bool isInValidLogsheet() {
    return parameterList.any((element) => element.userValue == -1);
  }

  alertUser(int type) {
    isError = true;
    //alert data already submitted type=1
    String title = 'Sorry!';
    String message = 'Logsheet Already Submitted for this Slot';

    if (type == 5) {
      //alert time exceed
      title = "Hi " + box.read(Session.userName) + "!";
      message = "Sorry! Time exceed to submit this activity";
    } else if (type == 6) {
      title = "Hi " + box.read(Session.userName) + "!";
      message = "Sorry! It's a Weekend. Activity disabled";
    } else if (type == 7) {
      title = "Access Denied!";
      message = "Sorry! This Category is not available for this Activity";
    }

    Get.bottomSheet(
        Container(
          height: 150,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const Divider(),
              Text(
                message,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              CustomButton(
                  width: 100,
                  buttonText: 'Okay',
                  onPressed: () async {
                    Get.back(); //close bottom sheet
                    Get.back(); //close screen
                  }),
            ],
          ),
        ),
        enableDrag: false,
        isDismissible: false);
  }
}
