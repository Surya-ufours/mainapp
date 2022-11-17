/// Status : true
/// Message : "success"
/// Data : {"ID":144675,"Barcode":"2157b165","CompanyID":1015,"CompanyName":"GE Industrial","LocationID":158,"LocationName":"GE Padappai","LocationShortName":"","BuildingID":765,"BuildingName":"Office Block-Eastside","BuildingShortName":"OBES","FloorID":888,"FloorName":"Ground Floor","FloorShortName":"GF","WingID":2157,"WingName":"Visitor Meeting room1","WingShortName":"","DepartmentID":165,"DepartmentName":"Meeting Room","DepartmentLogoFileName":"noimage.jpg"}

class QrCodeDetailResponse {
  QrCodeDetailResponse(
    this.status,
    this.message,
    this.data,
  );

  QrCodeDetailResponse.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    data = json['Data'] != null ? QrCodeDetail.fromJson(json['Data']) : null;
  }

  late bool status;
  late String message;
  late QrCodeDetail? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (data != null) {
      map['Data'] = data?.toJson();
    }
    return map;
  }
}

/// ID : 144675
/// Barcode : "2157b165"
/// CompanyID : 1015
/// CompanyName : "GE Industrial"
/// LocationID : 158
/// LocationName : "GE Padappai"
/// LocationShortName : ""
/// BuildingID : 765
/// BuildingName : "Office Block-Eastside"
/// BuildingShortName : "OBES"
/// FloorID : 888
/// FloorName : "Ground Floor"
/// FloorShortName : "GF"
/// WingID : 2157
/// WingName : "Visitor Meeting room1"
/// WingShortName : ""
/// DepartmentID : 165
/// DepartmentName : "Meeting Room"
/// DepartmentLogoFileName : "noimage.jpg"

class QrCodeDetail {
  QrCodeDetail(
    this.id,
    this.barcode,
    this.companyID,
    this.companyName,
    this.locationID,
    this.locationName,
    this.locationShortName,
    this.buildingID,
    this.buildingName,
    this.buildingShortName,
    this.floorID,
    this.floorName,
    this.floorShortName,
    this.wingID,
    this.wingName,
    this.wingShortName,
    this.departmentID,
    this.departmentName,
    this.departmentLogoFileName,
  );

  QrCodeDetail.fromJson(dynamic json) {
    id = json['ID'];
    barcode = json['Barcode'];
    companyID = json['CompanyID'];
    companyName = json['CompanyName'];
    locationID = json['LocationID'];
    locationName = json['LocationName'];
    locationShortName = json['LocationShortName'];
    buildingID = json['BuildingID'];
    buildingName = json['BuildingName'];
    buildingShortName = json['BuildingShortName'];
    floorID = json['FloorID'];
    floorName = json['FloorName'];
    floorShortName = json['FloorShortName'];
    wingID = json['WingID'];
    wingName = json['WingName'];
    wingShortName = json['WingShortName'];
    departmentID = json['DepartmentID'];
    departmentName = json['DepartmentName'];
    departmentLogoFileName = json['DepartmentLogoFileName'];
  }

  late int id;
  late String barcode;
  late int companyID;
  late String companyName;
  late int locationID;
  late String locationName;
  late String locationShortName;
  late int buildingID;
  late String buildingName;
  late String buildingShortName;
  late int floorID;
  late String floorName;
  late String floorShortName;
  late int wingID;
  late String wingName;
  late String wingShortName;
  late int departmentID;
  late String departmentName;
  late String departmentLogoFileName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['Barcode'] = barcode;
    map['CompanyID'] = companyID;
    map['CompanyName'] = companyName;
    map['LocationID'] = locationID;
    map['LocationName'] = locationName;
    map['LocationShortName'] = locationShortName;
    map['BuildingID'] = buildingID;
    map['BuildingName'] = buildingName;
    map['BuildingShortName'] = buildingShortName;
    map['FloorID'] = floorID;
    map['FloorName'] = floorName;
    map['FloorShortName'] = floorShortName;
    map['WingID'] = wingID;
    map['WingName'] = wingName;
    map['WingShortName'] = wingShortName;
    map['DepartmentID'] = departmentID;
    map['DepartmentName'] = departmentName;
    map['DepartmentLogoFileName'] = departmentLogoFileName;
    return map;
  }
}
