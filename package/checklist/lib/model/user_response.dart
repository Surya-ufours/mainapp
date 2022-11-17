import 'dart:convert';

class UserResponse {

  UserResponse.fromJson(dynamic json) {
    status = json['status'];
    statusId = json['statusId'];
    message = json['message'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result.add(ApiUser.fromJson(v));
      });
    }
    userId = json['userId'];
    isHoliday = json['IsHoliday'];
  }
  late bool status;
  late num statusId;
  late String message;
  late List<ApiUser> result;
  late num userId;
  late bool isHoliday;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusId'] = statusId;
    map['message'] = message;
    map['result'] = result.map((v) => v.toJson()).toList();
    map['userId'] = userId;
    map['IsHoliday'] = isHoliday;
    return map;
  }

}

class ApiUser {

  /*
  * departments json
  * {
    "departmentid": 334,
    "department": "House Keeping",
    "isImageUpload4AllChecklist": false
    }
  *
  * */



  ApiUser.fromJson(dynamic json) {
    userID = json['userID'];
    companyID = json['CompanyID'];
    locationID = json['locationID'];
    companyName = json['companyName'];
    companylogo = json['companylogo'];
    locationame = json['locationame'];
    ischecklist = json['ischecklist'];
    isAdmin = json['isAdmin'];
    isHelpdesk = json['isHelpdesk'];
    islogsheet = json['islogsheet'];
    name = json['name'];
    emailid = json['emailid'];
    mobileno = json['mobileno'];
    roleShortName = json['RoleShortName'];
    language = json['Language'];
    productID = json['ProductID'];
    appTypes = json['AppTypes'];
    userstatus = json['userstatus'];
    department = jsonEncode(json['Department'] ?? []);
    token = json['Token'] ?? '';

  }


  late String userID;
  late int companyID;
  late int locationID;
  late String companyName;
  late String companylogo;
  late String locationame;
  late bool ischecklist;
  late bool isAdmin;
  late bool isHelpdesk;
  late bool islogsheet;
  late String name;
  late String emailid;
  late String mobileno;
  late String roleShortName;
  late String language;
  late int productID;
  late String appTypes;
  late String userstatus;
  late String department;
  late String token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userID'] = userID;
    map['CompanyID'] = companyID;
    map['locationID'] = locationID;
    map['companyName'] = companyName;
    map['companylogo'] = companylogo;
    map['locationame'] = locationame;
    map['ischecklist'] = ischecklist;
    map['isAdmin'] = isAdmin;
    map['isHelpdesk'] = isHelpdesk;
    map['islogsheet'] = islogsheet;
    map['name'] = name;
    map['emailid'] = emailid;
    map['mobileno'] = mobileno;
    map['RoleShortName'] = roleShortName;
    map['Language'] = language;
    map['ProductID'] = productID;
    map['AppTypes'] = appTypes;
    map['userstatus'] = userstatus;
    map['Department'] = department;
    map['Token'] = token;

    return map;
  }

  ApiUser(
      this.userID,
      this.companyID,
      this.locationID,
      this.companyName,
      this.companylogo,
      this.locationame,
      this.ischecklist,
      this.isAdmin,
      this.isHelpdesk,
      this.islogsheet,
      this.name,
      this.emailid,
      this.mobileno,
      this.roleShortName,
      this.language,
      this.productID,
      this.appTypes,
      this.userstatus,
      this.department,
      this.token);
}