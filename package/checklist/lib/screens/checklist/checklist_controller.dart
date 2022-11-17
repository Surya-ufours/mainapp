import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../api/api_calls.dart';
import '../../database/dao/checklist_transaction_dao.dart';
import '../../database/dao/question_dao.dart';
import '../../database/dao/score_dao.dart';
import '../../helpers/utils.dart';
import '../../model/checklist.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:i2iutils/widgets/button.dart';
import 'package:signature/signature.dart';

import '../../database/database.dart';
import '../../helpers/session.dart';

class ChecklistController extends GetxController {
  final barcode = Get.arguments['code'];
  final imageCount = Get.arguments['imageCount'];

  final TextEditingController remarkController = TextEditingController();

  final box = GetStorage();
  String userId = "", submitDateTime = '', token = '';
  int companyId = -1, locationId = -1, selectedDeptId = -1, slotId = 0;
  int timeSH = 0, timeEH = 0, currentH = 0;
  String finalStartTime = "", finalEndTime = "";

  RxString compDet = "".obs;
  RxString buildDet = "".obs;
  RxString auditDet = "".obs;
  RxString timeSlotDet = "".obs;
  RxString txtImageCount = "0/0".obs;

  RxBool isLoading = false.obs;
  bool isNightShift = false;
  RxBool isDrawOk = false.obs;

  String submitDate = '';

  final _db = Get.find<GCAppDb>();
  late QuestionDao questionDao;
  late ChecklistTransactionDao transactionDao;
  late ScoreDao scoreDao;

  final SignatureController signController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  final ymdhm = 'yyyy-MM-dd HH:mm';

  List<QuestionData> questionList = [];
  List<ScoreData> scoreList = [];
  RxList<Checklist> checklists = RxList();
  RxList<String> images = RxList();

  bool isHaveImageOnChecklist = false;
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
    submitDateTime = getDate(format: ymdhm);
    isHaveImageOnChecklist = box.read(Session.userDeptShowImage);

    submitDate = getDate(format: 'yyyy-MM-dd');

    questionDao = QuestionDao(_db);

    QuestionData? question = await questionDao.getSatSun(barcode);
    debugPrint('q : ${question.toString()}');
    if (question != null && checkIsRequired(question)) {
      alertUser(6); //time exceed
      return;
    }

    questionList =
        await questionDao.getQuestionsByShift(barcode, selectedDeptId, false);
    debugPrint('q : ${questionList.toString()}');

    if (questionList.isEmpty) {
      //no questions there
      alertUser(4);
      return;
    }

    timeSH = int.parse(questionList[0].starttime.split(':')[0]);
    timeEH = int.parse(questionList[0].endtime.split(':')[0]);
    currentH = int.parse(getDate(format: 'HH'));
    debugPrint('night shift check $currentH $timeSH $timeEH');

    if (currentH < timeSH || currentH >= timeEH) {
      debugPrint('night shift check');

      questionList =
          await questionDao.getQuestionsByShift(barcode, selectedDeptId, true);
      debugPrint('q2 : ${questionList.toString()}');

      if (questionList.isEmpty) {
        //time exceed
        alertUser(5);
        return;
      } else {
        isNightShift = true;
      }
    }

    //get interval
    int slotInterval = questionList[0].interval;
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

    transactionDao = ChecklistTransactionDao(_db);

    //check is have offline data
    int count = await transactionDao.countChecklistTransaction(
        barcode,
        submitDate,
        finalStartTime,
        finalEndTime,
        slotId,
        selectedDeptId,
        questionList[0].WingID);
    debugPrint('count : $count');
    if (count > 0) {
      alertUser(1);
      return;
    }

    //checkOnline
    var params = {
      'locationid': encryptString('', '$locationId'),
      'departmentid': encryptString('', '$selectedDeptId'),
      'wingid': encryptString('', '${questionList[0].WingID}'),
      'qrcode': barcode,
      'slotid': slotId,
      'ischecklist': true,
      'date': submitDate,
      'userid': userId,
      'token': token
    };
    ApiCall().checkIsHaveOnlineRecord(params).then((value) {
      if (!value['status']) {
        alertUser(1);
      }
    });

    compDet("${questionList[0].CompanyName} - ${questionList[0].LocationName}");
    buildDet(
        "${questionList[0].BuildingShortName} - ${questionList[0].FloorName} - ${questionList[0].WingShortName}");
    auditDet("${questionList[0].categoryname} - ${questionList[0].auditname}");
    timeSlotDet("$finalStartTime - $finalEndTime");

    if (imageCount > 0) {
      txtImageCount('${images.length} / $imageCount');
    } else {
      txtImageCount("${images.length}");
    }

    scoreDao = ScoreDao(_db);
    scoreList = await scoreDao.getScore(questionList[0].auditid);
    debugPrint('s : ${scoreList.toString()}');

    for (QuestionData q in questionList) {
      checklists.add(
          Checklist(q.auditqid, q.auditqname, -1, '', q.questionimage, ''));
    }

    debugPrint('c : ${checklists.toString()}');

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

  bool checkIsRequired(QuestionData checkSatSun) {
    return (!checkSatSun.isSaturdayReq &&
            getDate(format: "EEEE").toLowerCase() == "saturday") ||
        (!checkSatSun.isSundayReq &&
            getDate(format: "EEEE").toLowerCase() == "sunday");
  }

  submitChecklist() async {
    //validation
    if (isValidChecklist()) {
      //invalid checklist entry
      showToastMsg('Invalid Checklist Entries');
    } else if (images.length < imageCount) {
      //show error Capture minimum " + imageCount + " images
      showToastMsg('Capture Minimum $imageCount Images');
    } else if (signController.isEmpty) {
      //invalid signature
      showToastMsg('Invalid Signature');
    } else if (remarkController.text.isEmpty) {
      //Enter Remark
      showToastMsg('Enter Remark');
    } else {
      isLoading(true);

      int diffInSec = getDifferenceInSecond(
          box.read(Session.scanTime), submitDateTime, ymdhm);

      var transaction = ChecklistTransactionCompanion.insert(
        userId: userId,
        companyId: questionList[0].CompanyID,
        locationId: questionList[0].LocationID,
        buildingId: questionList[0].BuildingID,
        wingId: questionList[0].WingID,
        floorId: questionList[0].FloorID,
        auditId: questionList[0].auditid,
        categoryId: questionList[0].categoryid,
        sectorId: questionList[0].sectorid,
        slotId: slotId,
        remark: remarkController.text.trim(),
        isAdmin: box.read(Session.isAdmin),
        qrCode: barcode,
        barcode: barcode,
        signature: base64Encode(await signController.toPngBytes() ?? []),
        submitImages: jsonEncode(images),
        checklists: jsonEncode(checklists),
        submitDate: submitDate,
        submitDateTime: getDate(format: ymdhm),
        scanStartTime: (box.read(Session.scanTime) ?? '').isEmpty ? finalStartTime : box.read(Session.scanTime),
        submitInterval: questionList[0].interval,
        submitStartTime: finalStartTime,
        submitEndTime: finalEndTime,
        timeTaken: '$diffInSec',
        supervisorName: box.read(Session.userName),
        deviceId: (await getDeviceUniqueId()) ?? "",
        guid: getCustomUniqueId(),
      );

      //show toast
      showToastMsg('Checklist Saved');
      await transactionDao.insert(transaction);
      isLoading(false);

      Get.back();
    }
  }

  bool isValidChecklist() {
    return checklists.any((element) => element.scoreId == -1);
  }

  alertUser(int type) {
    isError = true;
    //alert data already submitted type=1
    String title = 'Sorry!';
    String message = "Checklist Already Submitted for this Slot";

    if (type == 4) {
      //category not available
      title = "Access Denied!";
      message = "Sorry! This Category is not available for this Activity";
    } else if (type == 5) {
      //alert time exceed
      title = "Hi ${box.read(Session.userName)}!";
      message = "Sorry! Time exceed to submit this activity";
    } else if (type == 6) {
      //alert time exceed
      title = "Hi ${box.read(Session.userName)}!";
      message = "Sorry! It's a Weekend. Activity disabled";
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
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const Divider(),
              Text(
                message,
                style: const TextStyle(fontSize: 14),
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
