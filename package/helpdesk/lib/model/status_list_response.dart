/// statusdetails : [{"statusid":6127,"status":"Request For On Hold","colorcode":null,"tickets":0,"ShortName":null,"isonHold":false,"isTotal":false,"isClosed":false,"isControlsMandatory":false},{"statusid":6128,"status":"On-Hold","colorcode":null,"tickets":0,"ShortName":null,"isonHold":false,"isTotal":false,"isClosed":false,"isControlsMandatory":false},{"statusid":6129,"status":"Closed","colorcode":null,"tickets":0,"ShortName":null,"isonHold":false,"isTotal":false,"isClosed":false,"isControlsMandatory":false}]
/// Status : true
/// Message : "Success"

class StatusListResponse {
  StatusListResponse(
    this.statusdetails,
    this.status,
    this.message,
  );

  StatusListResponse.fromJson(dynamic json) {
    if (json['statusdetails'] != null) {
      statusdetails = [];
      json['statusdetails'].forEach((v) {
        statusdetails.add(StatusList.fromJson(v));
      });
    }
    status = json['Status'];
    message = json['Message'];
  }

  late List<StatusList> statusdetails;
  late bool status;
  late String message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusdetails'] = statusdetails.map((v) => v.toJson()).toList();
    map['Status'] = status;
    map['Message'] = message;
    return map;
  }
}

/// statusid : 6127
/// status : "Request For On Hold"
/// colorcode : null
/// tickets : 0
/// ShortName : null
/// isonHold : false
/// isTotal : false
/// isClosed : false
/// isControlsMandatory : false

class StatusList {
  StatusList(
    this.statusid,
    this.status,
    this.tickets,
    this.isonHold,
    this.isTotal,
    this.isClosed,
    this.isControlsMandatory,
  );

  StatusList.fromJson(dynamic json) {
    statusid = json['statusid'];
    status = json['status'];
    tickets = json['tickets'];
    isonHold = json['isonHold'];
    isTotal = json['isTotal'];
    isClosed = json['isClosed'];
    isControlsMandatory = json['isControlsMandatory'];
    isVisitdatetime = json['isVisitdatetime'];
  }

  late int statusid;
  late String status;
  late int tickets;
  late bool isonHold;
  late bool isTotal;
  late bool isClosed;
  late bool isControlsMandatory;
  late bool isVisitdatetime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusid'] = statusid;
    map['status'] = status;
    map['tickets'] = tickets;
    map['isonHold'] = isonHold;
    map['isTotal'] = isTotal;
    map['isClosed'] = isClosed;
    map['isControlsMandatory'] = isControlsMandatory;
    map['isVisitdatetime'] = isVisitdatetime;
    return map;
  }
}
