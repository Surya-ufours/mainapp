import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Parameter {
  Parameter.fromJson(dynamic json) {
    userid = json['userid'];
    auditid = json['auditid'];
    buildingid = json['buildingid'];
    locationid = json['locationid'];
    ParameterLimits = json['parameter_limits'];
    issubparamavailable = json['issubparamavailable']==1;
    parametername = json['parametername'];
    equipmentparamid = json['equipmentparamid'];
    equipmentname = json['equipmentname'];
    equipmentnameid = json['equipmentnameid'];
    templatename = json['templatename'];
    guid = json['guid'];
    equipmenttemplateid = json['equipmenttemplateid'];
    userValue = json['userValue'] ?? -1;
  }


  Parameter(
      this.userid,
      this.auditid,
      this.buildingid,
      this.locationid,
      this.ParameterLimits,
      this.issubparamavailable,
      this.parametername,
      this.equipmentparamid,
      this.equipmentname,
      this.equipmentnameid,
      this.templatename,
      this.guid,
      this.equipmenttemplateid,
      this.userValue);

  int id = -1;
  int userid = -1;
  int auditid = -1;
  int buildingid = -1;
  int locationid = -1;
  String ParameterLimits = '';
  bool issubparamavailable = false;
  String parametername = '';
  int equipmentparamid = -1;
  String equipmentname = '';
  int equipmentnameid = -1;
  String templatename = '';
  String guid = '';
  int equipmenttemplateid = -1;
  double userValue =-1;
  Rx<List<Parameter>?> subParameters=Rx(null);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userid'] = userid;
    map['auditid'] = auditid;
    map['buildingid'] = buildingid;
    map['locationid'] = locationid;
    map['parameter_limits'] = ParameterLimits;
    map['issubparamavailable'] = issubparamavailable;
    map['parametername'] = parametername;
    map['equipmentparamid'] = equipmentparamid;
    map['equipmentname'] = equipmentname;
    map['equipmentnameid'] = equipmentnameid;
    map['templatename'] = templatename;
    map['guid'] = guid;
    map['equipmenttemplateid'] = equipmenttemplateid;
    map['userValue'] = userValue;
    return map;
  }
}
