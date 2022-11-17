/// lstassignee : [{"userid":144802,"name":"ME Sup ME Sup (58)"}]
/// lstprovider : [{"userid":144802,"name":"ME Sup ME Sup (58)"}]
/// Status : true
/// Message : "Sucess"

class AssigneeResponse {
  AssigneeResponse(
    this.lstassignee,
    this.lstprovider,
    this.status,
    this.message,
  );

  AssigneeResponse.fromJson(dynamic json) {
    if (json['lstassignee'] != null) {
      lstassignee = [];
      json['lstassignee'].forEach((v) {
        lstassignee.add(Assignees.fromJson(v));
      });
    }
    if (json['lstprovider'] != null) {
      lstprovider = [];
      json['lstprovider'].forEach((v) {
        lstprovider.add(Assignees.fromJson(v));
      });
    }
    status = json['Status'];
    message = json['Message'];
  }

  late List<Assignees> lstassignee;
  late List<Assignees> lstprovider;
  late bool status;
  late String message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (lstassignee != null) {
      map['lstassignee'] = lstassignee.map((v) => v.toJson()).toList();
    }
    if (lstprovider != null) {
      map['lstprovider'] = lstprovider.map((v) => v.toJson()).toList();
    }
    map['Status'] = status;
    map['Message'] = message;
    return map;
  }
}

/// userid : 144802
/// name : "ME Sup ME Sup (58)"

class Assignees {
  Assignees(
    this.userid,
    this.name,
  );

  Assignees.fromJson(dynamic json) {
    userid = json['userid'];
    name = json['name'];
  }

  late int userid;
  late String name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userid'] = userid;
    map['name'] = name;
    return map;
  }
}
