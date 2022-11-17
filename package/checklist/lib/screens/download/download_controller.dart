import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../api/api_calls.dart';
import '../../database/dao/barcode_dao.dart';
import '../../database/dao/parameter_dao.dart';
import '../../database/dao/question_dao.dart';
import '../../database/dao/score_dao.dart';
import '../../database/dao/sub_parameter_dao.dart';
import '../../database/dao/template_dao.dart';
import '../../database/dao/template_detail_dao.dart';
import '../../database/dao/user_dao.dart';
import '../../database/database.dart';
import '../../helpers/session.dart';
import 'package:i2iutils/helpers/common_functions.dart';

class DownloadController extends GetxController {
  final box = GetStorage();
  String userId = "";
  String token = "";
  RxBool isFinish = false.obs;
  int runningIndex=0;

  RxList downloads = [
    {
      "name": "Department",
      "icon": "department.png",
      "color": Colors.grey,
      "tPath": null,
      "value": 0,
    },
    {
      "name": "Barcode",
      "icon": "barcode.png",
      "color": Colors.grey,
      "tPath": null,
      "value": 0,
    },
    {
      "name": "Question",
      "icon": "question.png",
      "color": Colors.grey,
      "tPath": null,
      "value": 0,
    },
    {
      "name": "Score",
      "icon": "score.png",
      "color": Colors.grey,
      "tPath": null,
      "value": 0,
    },
    {
      "name": "Template",
      "icon": "template.png",
      "color": Colors.grey,
      "tPath": null,
      "value": 0,
    },
    {
      "name": "Template Detail",
      "icon": "template_detail.png",
      "color": Colors.grey,
      "tPath": null,
      "value": 0,
    },
    {
      "name": "Parameter",
      "icon": "parameter.png",
      "color": Colors.grey,
      "tPath": null,
      "value": 0,
    },
    {
      "name": "Sub Parameter",
      "icon": "sub_parameter.png",
      "color": Colors.grey,
      "tPath": null,
      "value": 0,
    },
  ].obs;

  late var params;

  UserDao userDao = UserDao(Get.find<GCAppDb>());
  BarcodeDao barcodeDao = BarcodeDao(Get.find<GCAppDb>());
  QuestionDao questionDao = QuestionDao(Get.find<GCAppDb>());
  ScoreDao scoreDao = ScoreDao(Get.find<GCAppDb>());
  TemplateDao templateDao = TemplateDao(Get.find<GCAppDb>());
  TemplateDetailDao detailDao = TemplateDetailDao(Get.find<GCAppDb>());
  ParameterDao parameterDao = ParameterDao(Get.find<GCAppDb>());
  SubParameterDao subParameterDao = SubParameterDao(Get.find<GCAppDb>());

  @override
  void onInit() {
    super.onInit();

    userId = box.read(Session.userId);
    token = box.read(Session.token);

    params = {"userid": userId, "token": token};

      downloadDepartments(0);


  }

  downloadDepartments(int index) async {
    if (await isNetConnected()) {
      downloads[index]['color'] = Colors.green;
      downloads[index]['value'] = null;
      downloads.refresh();
      var response = await ApiCall().getDepartments(params);

      if (response != null && response['status']) {
        String departments = jsonEncode(response['result'] ?? []);
        box.write(Session.userDepartments, departments);
        userDao.updateDepartment(departments);

        setDownload(index);

        downloadBarcodes(1);
      } else {
        //error department
        if(response!=null)showToastMsg(response['message']);
        setDownload(index, isError: true);
      }

    }else{
      setDownload(index, isError: true);
    }
  }

  downloadBarcodes(int index) async {
    if (await isNetConnected()) {
      downloads[index]['color'] = Colors.green;
      downloads[index]['value'] = null;
      downloads.refresh();
      var response = await ApiCall().getBarcodes(params);

      if (response != null && response['status'] &&
          response['result'] != null) {
        await barcodeDao.deleteAll();

        List<BarcodeCompanion> res = ((response['result'] ?? []) as List)
            .map((e) =>
            BarcodeCompanion.insert(
              guid: e['guid'],
              imagecount: e['imagecount'],
              ischecklist: e['ischecklist'],
              islogsheet: e['islogsheet'],
            ))
            .toList();

        await barcodeDao.insert(res);

        setDownload(index);

        downloadQuestions(2);
      } else {
        //error department
        if(response!=null)showToastMsg(response['message']);
        setDownload(index, isError: true);
      }
    }else{
      setDownload(index, isError: true);
    }
  }

  downloadQuestions(int index) async {
    if (await isNetConnected()) {
      downloads[index]['color'] = Colors.green;
      downloads[index]['value'] = null;
      downloads.refresh();

      var response = await ApiCall().getQuestions(params);

      if (response != null && response['status']) {
        await questionDao.deleteAll();

        var res = ((response['result'] ?? []) as List)
            .map((e) =>
            QuestionCompanion.insert(
                isNightActivity: e['isNightActivity'],
                isSaturdayReq: e['isSaturdayReq'],
                isSundayReq: e['isSundayReq'],
                endtime: e['endtime'],
                starttime: e['starttime'],
                guid: e['guid'],
                questionimage: e['questionimage'],
                colourcode: e['colourcode'],
                enddate: e['enddate'],
                categoryname: e['categoryname'],
                startdate: e['startdate'],
                auditname: e['auditname'],
                WingShortName: e['WingShortName'],
                WingName: e['WingName'],
                FloorShortName: e['FloorShortName'],
                FloorName: e['FloorName'],
                BuildingShortName: e['BuildingShortName'],
                BuildingName: e['BuildingName'],
                LocationName: e['LocationName'],
                CompanyName: e['CompanyName'],
                auditqname: e['auditqname'],
                userid: e['userid'],
                interval: e['repeatid'],
                sectorid: e['sectorid'],
                score: e['score'],
                scoreid: e['scoreid'],
                categoryid: e['categoryid'],
                auditid: e['auditid'],
                WingID: e['WingID'],
                FloorID: e['FloorID'],
                BuildingID: e['BuildingID'],
                LocationID: e['LocationID'],
                CompanyID: e['CompanyID'],
                auditqid: e['auditqid']))
            .toList();

        await questionDao.insert(res);

        setDownload(index);

        downloadScores(3);
      } else {
        //error department
        if(response!=null)showToastMsg(response['message']);
        setDownload(index, isError: true);
      }
    }else{
      setDownload(index, isError: true);
    }
  }

  downloadScores(int index) async {
    if (await isNetConnected()) {
      downloads[index]['color'] = Colors.green;
      downloads[index]['value'] = null;
      downloads.refresh();
      var response = await ApiCall().getScores(params);

      if (response != null && response['status']) {
        await scoreDao.deleteAll();

        List<ScoreCompanion> res = ((response['result'] ?? []) as List)
            .map((e) =>
            ScoreCompanion.insert(
                colourcode: e['colourcode'],
                score: e['score'],
                scorename: e['scorename'],
                orderno: e['orderno'],
                auditid: e['auditid'],
                scoreid: e['scoreid']))
            .toList();

        await scoreDao.insert(res);

        setDownload(index);

        downloadTemplates(4);
      } else {
        //error department
        if(response!=null)showToastMsg(response['message']);
        setDownload(index, isError: true);
      }
    }else{
      setDownload(index, isError: true);
    }
  }

  downloadTemplates(int index) async {
    if (await isNetConnected()) {
      downloads[index]['color'] = Colors.green;
      downloads[index]['value'] = null;
      downloads.refresh();
      var response = await ApiCall().getTemplates(params);

      if (response != null && response['status']) {
        await templateDao.deleteAll();

        List<TemplateCompanion> res = ((response['result'] ?? []) as List)
            .map((e) =>
            TemplateCompanion.insert(
                templatename: e['templatename'],
                categoryname: e['categoryname'],
                guid: e['guid'],
                templateid: e['templateid'],
                categoryid: e['categoryid'],
                isSaturdayReq: e['isSaturdayReq'],
                isSundayReq: e['isSundayReq']))
            .toList();

        await templateDao.insert(res);

        setDownload(index);

        downloadTemplateDetails(5);
      } else {
        //error department
        if(response!=null)showToastMsg(response['message']);
        setDownload(index, isError: true);
      }
    }else{
      setDownload(index, isError: true);
    }
  }

  downloadTemplateDetails(int index) async {
    if (await isNetConnected()) {
      downloads[index]['color'] = Colors.green;
      downloads[index]['value'] = null;
      downloads.refresh();
      var response = await ApiCall().getTemplateDetails(params);

      if (response != null && response['status']) {
        await detailDao.deleteAll();

        List<TemplateDetailCompanion> res = ((response['result'] ?? []) as List)
            .map((e) =>
            TemplateDetailCompanion.insert(
                UserID: e['UserID'],
                equipmentname: e['equipmentname'],
                equipmentnameid: e['equipmentnameid'],
                templatename: e['templatename'],
                equipmenttemplateid: e['equipmenttemplateid'],
                guid: e['guid'],
                interval: e['interval'],
                endtime: e['endtime'],
                starttime: e['starttime'],
                categoryname: e['categoryname'],
                categoryid: e['categoryid'],
                auditname: e['auditname'],
                auditid: e['auditid'],
                wingname: e['wingname'],
                wingid: e['wingid'],
                floorname: e['floorname'],
                floorid: e['floorid'],
                buildingname: e['buildingname'],
                BuildingID: e['BuildingID'],
                LocationName: e['LocationName'],
                locationid: e['locationid'],
                sectorid: e['sectorid'],
                companyname: e['companyname'],
                companyid: e['companyid']))
            .toList();

        await detailDao.insert(res);

        setDownload(index);

        downloadParameters(6);
      } else {
        //error department
        if(response!=null)showToastMsg(response['message']);
        setDownload(index, isError: true);
      }
    }else{
      setDownload(index, isError: true);
    }
  }

  downloadParameters(int index) async {
    if (await isNetConnected()) {
      downloads[index]['color'] = Colors.green;
      downloads[index]['value'] = null;
      downloads.refresh();
      var response = await ApiCall().getParameters(params);

      if (response != null && response['status']) {
        await parameterDao.deleteAll();

        List<ParameterCompanion> res = ((response['result'] ?? []) as List)
            .map((e) =>
            ParameterCompanion.insert(
                issubparamavailable: e['issubparamavailable'],
                guid: e['guid'],
                templatename: e['templatename'],
                equipmentname: e['equipmentname'],
                parametername: e['parametername'],
                ParameterLimits: e['ParameterLimits'],
                userid: e['userid'],
                auditid: e['auditid'],
                buildingid: e['buildingid'],
                locationid: e['locationid'],
                equipmentparamid: e['equipmentparamid'],
                equipmentnameid: e['equipmentnameid'],
                equipmenttemplateid: e['equipmenttemplateid']))
            .toList();

        await parameterDao.insert(res);

        setDownload(index);

        downloadSubParameters(7);
      } else {
        //error department
        if(response!=null)showToastMsg(response['message']);
        setDownload(index, isError: true);
      }
    }else{
      setDownload(index, isError: true);
    }
  }

  downloadSubParameters(int index) async {
    if (await isNetConnected()) {
      downloads[index]['color'] = Colors.green;
      downloads[index]['value'] = null;
      downloads.refresh();
      var response = await ApiCall().getSubParameters(params);

      if (response != null && response['status']) {
        await subParameterDao.deleteAll();

        List<SubParameterCompanion> res = ((response['result'] ?? []) as List)
            .map((e) =>
            SubParameterCompanion.insert(
                ParameterLimits: e['ParameterLimits'],
                equiplimits: e['equiplimits'],
                equipsubparamname: e['equipsubparamname'],
                parametername: e['parametername'],
                equipmentname: e['equipmentname'],
                templatename: e['templatename'],
                equiplimitid: e['equiplimitid'],
                equipsubparamid: e['equipsubparamid'],
                equipmentparamid: e['equipmentparamid'],
                equipmentnameid: e['equipmentnameid'],
                equiptemplateid: e['equiptemplateid'],
                issubparamavailable: e['issubparamavailable']))
            .toList();

        await subParameterDao.insert(res);

        setDownload(index);

        isFinish(true);
      } else {
        //error department
        if(response!=null)showToastMsg(response['message']);
        setDownload(index, isError: true);
      }
    }else{
      setDownload(index, isError: true);
    }
  }

  setDownload(
    int index, {
    bool isError = false,
  }) {
    downloads[index]['color'] = isError ? Colors.red : Colors.green;
    downloads[index]['tPath'] = isError ? "retry.png" : "ok.png";
    downloads[index]['value'] = isError ? 0 : 1;
    runningIndex=index;
    downloads.refresh();
  }

  reDownload() {
    switch(runningIndex){
      case 0: downloadDepartments(runningIndex);break;
      case 1: downloadBarcodes(runningIndex);break;
      case 2: downloadQuestions(runningIndex);break;
      case 3: downloadScores(runningIndex);break;
      case 4: downloadTemplates(runningIndex);break;
      case 5: downloadTemplateDetails(runningIndex);break;
      case 6: downloadParameters(runningIndex);break;
      case 7: downloadSubParameters(runningIndex);break;
    }
  }
}
