import 'histories.dart';

/// Status : true
/// Message : "Data Found"
/// statusdetails : [{"statusid":6123,"status":"Total","colorcode":"Lite Yellow - #F3DFA2","tickets":2,"ShortName":"T","isonHold":false,"isTotal":true,"isClosed":false,"isControlsMandatory":false}]
/// ticketdetails : [{"ComplaintId":1115040,"TicketNo":"#SR21122411366940925","Category":"Check the cleanliness of w/c","Subject":"","Status":"Closed","Statusid":6129,"Priority":"Critical","RequestorName":"Saran A","AssignedTo":"HK Sup","RequestDate":"24/12/2021","RequestTime":"2:39PM","TicketResponseTime":"2021-12-25T02:10:46","ColorCode":"Green - #008000","StatusShortName":"C","CompanyID":11,"locationID":36694,"Company":"i2i Softwares","location":"Bangalore","building":"i2i Tower A","floor":"1st Floor","wing":"East Wing","IsClosed":false,"isonHold":false,"StatusCount":5,"ImageLink":"","FileType":"","ResponseTime":"12/25/2021 2:10:46 AM","StopTime":"0: 0:29:51","ShiftStart":"","ShiftEnd":"","IsShiftReq":false,"TicketType":"Complaint","TicketTypeId":17382,"isIntegration52Weekistock":0,"IsShown":2,"CompliantType":"Internal","IsStopTimer":false,"CustRefNo":"1234","TicketCost":"100","CompliantState":"Within SLA"}]

class AllTicketsResponse {
  AllTicketsResponse(
    this.status,
    this.message,
    this.statusdetails,
    this.ticketdetails,
  );

  AllTicketsResponse.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    if (json['statusdetails'] != null) {
      statusdetails = [];
      json['statusdetails'].forEach((v) {
        statusdetails?.add(Statusdetails.fromJson(v));
      });
    }
    if (json['ticketdetails'] != null) {
      ticketdetails = [];
      json['ticketdetails'].forEach((v) {
        ticketdetails?.add(Ticketdetails.fromJson(v));
      });
    }
  }

  late bool status;
  late String message;
  late List<Statusdetails>? statusdetails;
  late List<Ticketdetails>? ticketdetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (statusdetails != null) {
      map['statusdetails'] = statusdetails?.map((v) => v.toJson()).toList();
    }
    if (ticketdetails != null) {
      map['ticketdetails'] = ticketdetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// ComplaintId : 1115040
/// TicketNo : "#SR21122411366940925"
/// Category : "Check the cleanliness of w/c"
/// Subject : ""
/// Status : "Closed"
/// Statusid : 6129
/// Priority : "Critical"
/// RequestorName : "Saran A"
/// AssignedTo : "HK Sup"
/// RequestDate : "24/12/2021"
/// RequestTime : "2:39PM"
/// TicketResponseTime : "2021-12-25T02:10:46"
/// ColorCode : "Green - #008000"
/// StatusShortName : "C"
/// CompanyID : 11
/// locationID : 36694
/// Company : "i2i Softwares"
/// location : "Bangalore"
/// building : "i2i Tower A"
/// floor : "1st Floor"
/// wing : "East Wing"
/// IsClosed : false
/// isonHold : false
/// StatusCount : 5
/// ImageLink : ""
/// FileType : ""
/// ResponseTime : "12/25/2021 2:10:46 AM"
/// StopTime : "0: 0:29:51"
/// ShiftStart : ""
/// ShiftEnd : ""
/// IsShiftReq : false
/// TicketType : "Complaint"
/// TicketTypeId : 17382
/// isIntegration52Weekistock : 0
/// IsShown : 2
/// CompliantType : "Internal"
/// IsStopTimer : false
/// CustRefNo : "1234"
/// TicketCost : "100"
/// CompliantState : "Within SLA"

class Ticketdetails {
  Ticketdetails(
    this.complaintId,
    this.ticketNo,
    this.category,
    this.subject,
    this.status,
    this.statusid,
    this.priority,
    this.requestorName,
    this.assignedTo,
    this.requestDate,
    this.requestTime,
    this.ticketResponseTime,
    this.colorCode,
    this.statusShortName,
    this.companyID,
    this.locationID,
    this.company,
    this.location,
    this.building,
    this.floor,
    this.wing,
    this.isClosed,
    this.isonHold,
    this.statusCount,
    this.imageLink,
    this.fileType,
    this.responseTime,
    this.stopTime,
    this.shiftStart,
    this.shiftEnd,
    this.isShiftReq,
    this.ticketType,
    this.ticketTypeId,
    this.isIntegration52Weekistock,
    this.isShown,
    this.compliantType,
    this.isStopTimer,
    this.custRefNo,
    this.ticketCost,
    this.compliantState,
    this.histories,
  );

  Ticketdetails.fromJson(dynamic json) {
    complaintId = json['ComplaintId'];
    ticketNo = json['TicketNo'];
    category = json['Category'];
    subject = json['Subject'];
    status = json['Status'];
    statusid = json['Statusid'];
    priority = json['Priority'];
    requestorName = json['RequestorName'];
    assignedTo = json['AssignedTo'];
    requestDate = json['RequestDate'];
    requestTime = json['RequestTime'];
    ticketResponseTime = json['TicketResponseTime'];
    colorCode = json['ColorCode'];
    statusShortName = json['StatusShortName'];
    companyID = json['CompanyID'];
    locationID = json['locationID'];
    company = json['Company'];
    location = json['location'];
    building = json['building'];
    floor = json['floor'];
    wing = json['wing'];
    isClosed = json['IsClosed'];
    isonHold = json['isonHold'];
    statusCount = json['StatusCount'];
    imageLink = json['ImageLink'];
    fileType = json['FileType'];
    responseTime = json['ResponseTime'];
    stopTime = json['StopTime'];
    shiftStart = json['ShiftStart'];
    shiftEnd = json['ShiftEnd'];
    isShiftReq = json['IsShiftReq'];
    ticketType = json['TicketType'];
    ticketTypeId = json['TicketTypeId'];
    isIntegration52Weekistock = json['isIntegration52Weekistock'];
    isShown = json['IsShown'];
    compliantType = json['CompliantType'];
    isStopTimer = json['IsStopTimer'];
    custRefNo = json['CustRefNo'];
    ticketCost = json['TicketCost'];
    compliantState = json['CompliantState'];
    if (json['lsthistory'] != null) {
      histories = [];
      json['lsthistory'].forEach((v) {
        histories?.add(Histories.fromJson(v));
      });
    }

    reqBy = json['RequestedBy'] ?? '';
    reqType = json['RequestTypeName'] ?? '';
    callType = json['CallTypeName'] ?? '';
    compType = json['ComplaintTypeName'] ?? '';
    reqEmail = json['MailID'] ?? '';
    reqPhone = json['MobileNo'] ?? '';
    escalationRemark = json['escalateRemark'] ?? '';
    escalationDateTime = json['escalateDateTime'] ?? '';
    hadEscalation = json['HadEscalation'];
  }

  late int complaintId;
  late String ticketNo;
  late String category;
  late String subject;
  late String status;
  late int statusid;
  late String priority;
  late String requestorName;
  late String assignedTo;
  late String requestDate;
  late String requestTime;
  late String ticketResponseTime;
  late String colorCode;
  late String statusShortName;
  late int companyID;
  late int locationID;
  late String company;
  late String location;
  late String building;
  late String floor;
  late String wing;
  late bool isClosed;
  late bool isonHold;
  late int statusCount;
  late String imageLink;
  late String fileType;
  late String responseTime;
  late String stopTime;
  late String shiftStart;
  late String shiftEnd;
  late bool isShiftReq;
  late String ticketType;
  late int ticketTypeId;
  late int isIntegration52Weekistock;
  late int isShown;
  late String compliantType;
  late bool isStopTimer;
  late String? custRefNo;
  late String? ticketCost;
  late String compliantState;
  late List<Histories>? histories;

  int reqBy = 1;
  String reqType = "";
  String callType = "";
  String compType = "";
  String reqEmail = "";
  String reqPhone = "";

  late bool hadEscalation;
  late String escalationRemark;
  late String escalationDateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ComplaintId'] = complaintId;
    map['TicketNo'] = ticketNo;
    map['Category'] = category;
    map['Subject'] = subject;
    map['Status'] = status;
    map['Statusid'] = statusid;
    map['Priority'] = priority;
    map['RequestorName'] = requestorName;
    map['AssignedTo'] = assignedTo;
    map['RequestDate'] = requestDate;
    map['RequestTime'] = requestTime;
    map['TicketResponseTime'] = ticketResponseTime;
    map['ColorCode'] = colorCode;
    map['StatusShortName'] = statusShortName;
    map['CompanyID'] = companyID;
    map['locationID'] = locationID;
    map['Company'] = company;
    map['location'] = location;
    map['building'] = building;
    map['floor'] = floor;
    map['wing'] = wing;
    map['IsClosed'] = isClosed;
    map['isonHold'] = isonHold;
    map['StatusCount'] = statusCount;
    map['ImageLink'] = imageLink;
    map['FileType'] = fileType;
    map['ResponseTime'] = responseTime;
    map['StopTime'] = stopTime;
    map['ShiftStart'] = shiftStart;
    map['ShiftEnd'] = shiftEnd;
    map['IsShiftReq'] = isShiftReq;
    map['TicketType'] = ticketType;
    map['TicketTypeId'] = ticketTypeId;
    map['isIntegration52Weekistock'] = isIntegration52Weekistock;
    map['IsShown'] = isShown;
    map['CompliantType'] = compliantType;
    map['IsStopTimer'] = isStopTimer;
    map['CustRefNo'] = custRefNo;
    map['TicketCost'] = ticketCost;
    map['CompliantState'] = compliantState;
    map['lsthistory'] = histories?.map((v) => v.toJson()).toList();

    map['RequestedBy'] = reqBy; //self or other
    map['RequestTypeName'] = reqType; //proactive, reactive
    map['CallTypeName'] = callType; // mode of communication
    map['ComplaintTypeName'] = compType; // req,compl
    map['MailID'] = reqEmail;
    map['MobileNo'] = reqPhone;
    map['HadEscalation'] = hadEscalation;
    map['escalateDateTime'] = escalationDateTime;
    map['escalateRemark'] = escalationRemark;

    return map;
  }
}

/// statusid : 6123
/// status : "Total"
/// colorcode : "Lite Yellow - #F3DFA2"
/// tickets : 2
/// ShortName : "T"
/// isonHold : false
/// isTotal : true
/// isClosed : false
/// isControlsMandatory : false

class Statusdetails {
  Statusdetails(
    this.statusid,
    this.status,
    this.colorcode,
    this.tickets,
    this.shortName,
    this.isonHold,
    this.isTotal,
    this.isClosed,
    this.isControlsMandatory,
  );

  Statusdetails.fromJson(dynamic json) {
    statusid = json['statusid'];
    status = json['status'];
    colorcode = json['colorcode'];
    tickets = json['tickets'];
    shortName = json['ShortName'];
    isonHold = json['isonHold'];
    isTotal = json['isTotal'];
    isClosed = json['isClosed'];
    isControlsMandatory = json['isControlsMandatory'];
  }

  late int statusid;
  late String status;
  late String colorcode;
  late int tickets;
  late String shortName;
  late bool isonHold;
  late bool isTotal;
  late bool isClosed;
  late bool isControlsMandatory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusid'] = statusid;
    map['status'] = status;
    map['colorcode'] = colorcode;
    map['tickets'] = tickets;
    map['ShortName'] = shortName;
    map['isonHold'] = isonHold;
    map['isTotal'] = isTotal;
    map['isClosed'] = isClosed;
    map['isControlsMandatory'] = isControlsMandatory;
    return map;
  }
}
