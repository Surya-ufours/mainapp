class LoginResponse {
  LoginResponse({
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
    this.isTenant,
    this.isSuperAdmin,
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
    this.requestorID,
    this.clientcode,
    this.clientname,
    this.companydetails,
    this.locationdetails,
    this.buildingdetails,
    this.floordetails,
    this.wingdetails,
  });

  LoginResponse.fromJson(dynamic json) {
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
    isTenant = json["isTenent"];
    isSuperAdmin = json["isSuperAdmin"];
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
    requestorID = json['RequestorID'];
    clientcode = json['clientcode'];
    clientname = json['clientname'];

    if (json['companydetails'] != null) {
      companydetails = [];
      json['companydetails'].forEach((v) {
        companydetails?.add(Companydetails.fromJson(v));
      });
    }
    if (json['locationdetails'] != null) {
      locationdetails = [];
      json['locationdetails'].forEach((v) {
        locationdetails?.add(Locationdetails.fromJson(v));
      });
    }
    if (json['buildingdetails'] != null) {
      buildingdetails = [];
      json['buildingdetails'].forEach((v) {
        buildingdetails?.add(Buildingdetails.fromJson(v));
      });
    }
    if (json['floordetails'] != null) {
      floordetails = [];
      json['floordetails'].forEach((v) {
        floordetails?.add(Floordetails.fromJson(v));
      });
    }
    if (json['wingdetails'] != null) {
      wingdetails = [];
      json['wingdetails'].forEach((v) {
        wingdetails?.add(Wingdetails.fromJson(v));
      });
    }
  }

  bool? isAdmin;
  int? roleID;
  int? userID;
  int? groupID;
  int? companyID;
  String? companyName;
  String? groupName;
  String? emailID;
  String? firstName;
  String? contactNo;
  bool? isServiceEngineer;
  bool? isController;
  bool? isEmployee;
  bool? isTenant;
  bool? isSuperAdmin;
  bool? isResTimeReq;
  String? logopath;
  bool? status;
  String? message;
  int? productId;
  String? languageCode;
  String? language;
  bool? isByShiftTime;
  String? startTime;
  String? endTime;
  String? requestorID;
  String? clientcode;
  String? clientname;
  List<Companydetails>? companydetails;
  List<Locationdetails>? locationdetails;
  List<Buildingdetails>? buildingdetails;
  List<Floordetails>? floordetails;
  List<Wingdetails>? wingdetails;

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
    map["isTenent"] = isTenant;
    map["isSuperAdmin"] = isSuperAdmin;
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
    map['RequestorID'] = requestorID;
    map['clientcode'] = clientcode;
    map['clientname'] = clientname;

    if (companydetails != null) {
      map['companydetails'] = companydetails?.map((v) => v.toJson()).toList();
    }
    if (locationdetails != null) {
      map['locationdetails'] = locationdetails?.map((v) => v.toJson()).toList();
    }
    if (buildingdetails != null) {
      map['buildingdetails'] = buildingdetails?.map((v) => v.toJson()).toList();
    }
    if (floordetails != null) {
      map['floordetails'] = floordetails?.map((v) => v.toJson()).toList();
    }
    if (wingdetails != null) {
      map['wingdetails'] = wingdetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Wingdetails {
  Wingdetails({
    this.floorId,
    this.wingID,
    this.wing,
    this.wingShortName,
  });

  Wingdetails.fromJson(dynamic json) {
    floorId = json['FloorId'];
    wingID = json['WingID'];
    wing = json['Wing'];
    wingShortName = json['WingShortName'];
  }

  int? floorId;
  int? wingID;
  String? wing;
  String? wingShortName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FloorId'] = floorId;
    map['WingID'] = wingID;
    map['Wing'] = wing;
    map['WingShortName'] = wingShortName;
    return map;
  }
}

class Floordetails {
  Floordetails({
    this.buildingId,
    this.floorID,
    this.floor,
    this.floorShortName,
  });

  Floordetails.fromJson(dynamic json) {
    buildingId = json['BuildingId'];
    floorID = json['FloorID'];
    floor = json['Floor'];
    floorShortName = json['FloorShortName'];
  }

  int? buildingId;
  int? floorID;
  String? floor;
  String? floorShortName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BuildingId'] = buildingId;
    map['FloorID'] = floorID;
    map['Floor'] = floor;
    map['FloorShortName'] = floorShortName;
    return map;
  }
}

class Buildingdetails {
  Buildingdetails({
    this.locationId,
    this.buildingID,
    this.building,
    this.buildingShortName,
  });

  Buildingdetails.fromJson(dynamic json) {
    locationId = json['LocationId'];
    buildingID = json['BuildingID'];
    building = json['Building'];
    buildingShortName = json['BuildingShortName'];
  }

  int? locationId;
  int? buildingID;
  String? building;
  String? buildingShortName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['LocationId'] = locationId;
    map['BuildingID'] = buildingID;
    map['Building'] = building;
    map['BuildingShortName'] = buildingShortName;
    return map;
  }
}

class Locationdetails {
  Locationdetails({
    this.companyId,
    this.locationId,
    this.location,
  });

  Locationdetails.fromJson(dynamic json) {
    companyId = json['CompanyId'];
    locationId = json['LocationId'];
    location = json['Location'];
    business2Consumer = json['Business2Consumer'];
  }

  int? companyId;
  int? locationId;
  String? location;
  bool? business2Consumer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CompanyId'] = companyId;
    map['LocationId'] = locationId;
    map['Location'] = location;
    map['Business2Consumer'] = business2Consumer;
    return map;
  }
}

class Companydetails {
  Companydetails({
    this.companyId,
    this.company,
    this.shiftStartTime,
    this.shiftEndTime,
    this.isShiftReq,
  });

  Companydetails.fromJson(dynamic json) {
    companyId = json['CompanyId'];
    company = json['Company'];
    shiftStartTime = json['ShiftStartTime'];
    shiftEndTime = json['ShiftEndTime'];
    isShiftReq = json['isShiftReq'];
  }

  int? companyId;
  String? company;
  String? shiftStartTime;
  String? shiftEndTime;
  bool? isShiftReq;

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
