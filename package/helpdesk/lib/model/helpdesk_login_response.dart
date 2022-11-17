/// IsAdmin : false
/// RoleID : 116021
/// UserID : 175055
/// GroupID : 66283
/// CompanyID : 85475
/// CompanyName : "Solas Fire Safety Equipment (P) Ltd."
/// GroupName : "Solas"
/// EmailID : "surya@ufours.com"
/// FirstName : "Surya"
/// ContactNo : "8608486942"
/// isServiceEngineer : false
/// isController : true
/// isEmployee : true
/// isResTimeReq : true
/// logopath : "http://jll.efitfacility.com/UploadImages/solas_logo.png"
/// Status : true
/// Message : "Login Success"
/// ProductId : 8
/// LanguageCode : "en-US"
/// Language : "English"
/// isByShiftTime : false
/// StartTime : ""
/// EndTime : ""
/// CustRefNo : false
/// CostIncurred : false
/// companydetails : [{"CompanyId":85475,"Company":"Solas Fire Safety Equipment (P) Ltd.(0)","ShiftStartTime":"","ShiftEndTime":"","isShiftReq":false}]
/// locationdetails : [{"CompanyId":85475,"LocationId":39439,"Location":"Vasanth Nagar"}]
/// buildingdetails : [{"LocationId":39439,"BuildingID":42309,"Building":"Building 1","BuildingShortName":"B1"}]
/// floordetails : [{"BuildingId":42309,"FloorID":53749,"Floor":"1st Floor","FloorShortName":"1F"},{"BuildingId":42309,"FloorID":53750,"Floor":"2nd Floor","FloorShortName":"2F"},{"BuildingId":42309,"FloorID":53748,"Floor":"Ground Floor","FloorShortName":"GF"}]
/// wingdetails : [{"FloorId":53749,"WingID":63473,"Wing":"No Wing","WingShortName":"NW"},{"FloorId":53750,"WingID":63474,"Wing":"No Wing","WingShortName":"NW"},{"FloorId":53748,"WingID":63475,"Wing":"No Wing","WingShortName":"NW"}]

class HelpdeskLoginResponse {
  HelpdeskLoginResponse(
    this.isAdmin,
    this.roleID,
    this.userID,
    this.groupID,
    this.companyID,
    this.companyName,
    this.groupName,
    this.emailID,
    this.firstName,
    this.contactNo,
    this.isServiceEngineer,
    this.isController,
    this.isEmployee,
    this.isResTimeReq,
    this.logopath,
    this.status,
    this.message,
    this.productId,
    this.languageCode,
    this.language,
    this.isByShiftTime,
    this.startTime,
    this.endTime,
    this.custRefNo,
    this.costIncurred,
    this.companydetails,
    this.locationdetails,
    this.buildingdetails,
    this.floordetails,
    this.wingdetails,
  );

  HelpdeskLoginResponse.fromJson(dynamic json) {
    isAdmin = json['IsAdmin'];
    roleID = json['RoleID'];
    userID = json['UserID'];
    groupID = json['GroupID'];
    companyID = json['CompanyID'];
    companyName = json['CompanyName'];
    groupName = json['GroupName'];
    emailID = json['EmailID'];
    firstName = json['FirstName'];
    contactNo = json['ContactNo'];
    isServiceEngineer = json['isServiceEngineer'];
    isController = json['isController'];
    isEmployee = json['isEmployee'];
    isResTimeReq = json['isResTimeReq'];
    logopath = json['logopath'];
    status = json['Status'];
    message = json['Message'];
    productId = json['ProductId'];
    languageCode = json['LanguageCode'];
    language = json['Language'];
    isByShiftTime = json['isByShiftTime'];
    startTime = json['StartTime'];
    endTime = json['EndTime'];
    custRefNo = json['CustRefNo'];
    costIncurred = json['CostIncurred'];
    if (json['companydetails'] != null) {
      companydetails = [];
      json['companydetails'].forEach((v) {
        companydetails.add(Companydetails.fromJson(v));
      });
    }
    if (json['locationdetails'] != null) {
      locationdetails = [];
      json['locationdetails'].forEach((v) {
        locationdetails.add(Locationdetails.fromJson(v));
      });
    }
    if (json['buildingdetails'] != null) {
      buildingdetails = [];
      json['buildingdetails'].forEach((v) {
        buildingdetails.add(Buildingdetails.fromJson(v));
      });
    }
    if (json['floordetails'] != null) {
      floordetails = [];
      json['floordetails'].forEach((v) {
        floordetails.add(Floordetails.fromJson(v));
      });
    }
    if (json['wingdetails'] != null) {
      wingdetails = [];
      json['wingdetails'].forEach((v) {
        wingdetails.add(Wingdetails.fromJson(v));
      });
    }
  }

  late bool isAdmin;
  late int roleID;
  late int userID;
  late int groupID;
  late int companyID;
  late String companyName;
  late String groupName;
  late String emailID;
  late String firstName;
  late String contactNo;
  late bool isServiceEngineer;
  late bool isController;
  late bool isEmployee;
  late bool isResTimeReq;
  late String logopath;
  late bool status;
  late String message;
  late int productId;
  late String languageCode;
  late String language;
  late bool isByShiftTime;
  late String startTime;
  late String endTime;
  late bool custRefNo;
  late bool costIncurred;
  late List<Companydetails> companydetails;
  late List<Locationdetails> locationdetails;
  late List<Buildingdetails> buildingdetails;
  late List<Floordetails> floordetails;
  late List<Wingdetails> wingdetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IsAdmin'] = isAdmin;
    map['RoleID'] = roleID;
    map['UserID'] = userID;
    map['GroupID'] = groupID;
    map['CompanyID'] = companyID;
    map['CompanyName'] = companyName;
    map['GroupName'] = groupName;
    map['EmailID'] = emailID;
    map['FirstName'] = firstName;
    map['ContactNo'] = contactNo;
    map['isServiceEngineer'] = isServiceEngineer;
    map['isController'] = isController;
    map['isEmployee'] = isEmployee;
    map['isResTimeReq'] = isResTimeReq;
    map['logopath'] = logopath;
    map['Status'] = status;
    map['Message'] = message;
    map['ProductId'] = productId;
    map['LanguageCode'] = languageCode;
    map['Language'] = language;
    map['isByShiftTime'] = isByShiftTime;
    map['StartTime'] = startTime;
    map['EndTime'] = endTime;
    map['CustRefNo'] = custRefNo;
    map['CostIncurred'] = costIncurred;
    if (companydetails != null) {
      map['companydetails'] = companydetails.map((v) => v.toJson()).toList();
    }
    if (locationdetails != null) {
      map['locationdetails'] = locationdetails.map((v) => v.toJson()).toList();
    }
    if (buildingdetails != null) {
      map['buildingdetails'] = buildingdetails.map((v) => v.toJson()).toList();
    }
    if (floordetails != null) {
      map['floordetails'] = floordetails.map((v) => v.toJson()).toList();
    }
    if (wingdetails != null) {
      map['wingdetails'] = wingdetails.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// FloorId : 53749
/// WingID : 63473
/// Wing : "No Wing"
/// WingShortName : "NW"

class Wingdetails {
  Wingdetails(
    this.floorId,
    this.wingID,
    this.wing,
    this.wingShortName,
  );

  Wingdetails.fromJson(dynamic json) {
    floorId = json['FloorId'];
    wingID = json['WingID'];
    wing = json['Wing'];
    wingShortName = json['WingShortName'];
  }

  late int floorId;
  late int wingID;
  late String wing;
  late String wingShortName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FloorId'] = floorId;
    map['WingID'] = wingID;
    map['Wing'] = wing;
    map['WingShortName'] = wingShortName;
    return map;
  }
}

/// BuildingId : 42309
/// FloorID : 53749
/// Floor : "1st Floor"
/// FloorShortName : "1F"

class Floordetails {
  Floordetails(
    this.buildingId,
    this.floorID,
    this.floor,
    this.floorShortName,
  );

  Floordetails.fromJson(dynamic json) {
    buildingId = json['BuildingId'];
    floorID = json['FloorID'];
    floor = json['Floor'];
    floorShortName = json['FloorShortName'];
  }

  late int buildingId;
  late int floorID;
  late String floor;
  late String floorShortName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BuildingId'] = buildingId;
    map['FloorID'] = floorID;
    map['Floor'] = floor;
    map['FloorShortName'] = floorShortName;
    return map;
  }
}

/// LocationId : 39439
/// BuildingID : 42309
/// Building : "Building 1"
/// BuildingShortName : "B1"

class Buildingdetails {
  Buildingdetails(
    this.locationId,
    this.buildingID,
    this.building,
    this.buildingShortName,
  );

  Buildingdetails.fromJson(dynamic json) {
    locationId = json['LocationId'];
    buildingID = json['BuildingID'];
    building = json['Building'];
    buildingShortName = json['BuildingShortName'];
  }

  late int locationId;
  late int buildingID;
  late String building;
  late String buildingShortName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['LocationId'] = locationId;
    map['BuildingID'] = buildingID;
    map['Building'] = building;
    map['BuildingShortName'] = buildingShortName;
    return map;
  }
}

/// CompanyId : 85475
/// LocationId : 39439
/// Location : "Vasanth Nagar"

class Locationdetails {
  Locationdetails(
    this.companyId,
    this.locationId,
    this.location,
  );

  Locationdetails.fromJson(dynamic json) {
    companyId = json['CompanyId'];
    locationId = json['LocationId'];
    location = json['Location'];
  }

  late int companyId;
  late int locationId;
  late String location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CompanyId'] = companyId;
    map['LocationId'] = locationId;
    map['Location'] = location;
    return map;
  }
}

/// CompanyId : 85475
/// Company : "Solas Fire Safety Equipment (P) Ltd.(0)"
/// ShiftStartTime : ""
/// ShiftEndTime : ""
/// isShiftReq : false

class Companydetails {
  Companydetails(
    this.companyId,
    this.company,
    this.shiftStartTime,
    this.shiftEndTime,
    this.isShiftReq,
  );

  Companydetails.fromJson(dynamic json) {
    companyId = json['CompanyId'];
    company = json['Company'];
    shiftStartTime = json['ShiftStartTime'];
    shiftEndTime = json['ShiftEndTime'];
    isShiftReq = json['isShiftReq'];
  }

  late int companyId;
  late String company;
  late String shiftStartTime;
  late String shiftEndTime;
  late bool isShiftReq;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CompanyId'] = companyId;
    map['Company'] = company;
    map['ShiftStartTime'] = shiftStartTime;
    map['ShiftEndTime'] = shiftEndTime;
    map['isShiftReq'] = isShiftReq;
    return map;
  }
}
