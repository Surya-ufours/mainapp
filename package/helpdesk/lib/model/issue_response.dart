class IssueResponse {
  late List<Issue> lstIssue;
  late bool status;
  late String message;

  IssueResponse(this.lstIssue, this.status, this.message);

  IssueResponse.fromJson(dynamic json) {
    if (json["lstIssue"] != null) {
      lstIssue = [];
      json["lstIssue"].forEach((v) {
        lstIssue.add(Issue.fromJson(v));
      });
    }
    status = json["Status"];
    message = json["Message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (lstIssue != null) {
      map["lstIssue"] = lstIssue.map((v) => v.toJson()).toList();
    }
    map["Status"] = status;
    map["Message"] = message;
    return map;
  }
}

class Issue {
  late int categoryID;
  late int departmentID;
  late String categoryName;
  late String categoryDescrition;
  late int priorityID;
  late String priorityName;
  late String priorityDescription;
  late String resolutionTime;
  late String responseTime;
  late String categoryLogoFileName;

  Issue(
      this.categoryID,
      this.departmentID,
      this.categoryName,
      this.categoryDescrition,
      this.priorityID,
      this.priorityName,
      this.priorityDescription,
      this.resolutionTime,
      this.responseTime,
      this.categoryLogoFileName);

  Issue.fromJson(dynamic json) {
    categoryID = json["CategoryID"];
    departmentID = json["DepartmentID"];
    categoryName = json["CategoryName"];
    categoryDescrition = json["CategoryDescrition"];
    priorityID = json["PriorityID"];
    priorityName = json["PriorityName"];
    priorityDescription = json["PriorityDescription"];
    resolutionTime = json["ResolutionTime"];
    responseTime = json["ResponseTime"];
    categoryLogoFileName = json["CategoryLogoFileName"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["CategoryID"] = categoryID;
    map["DepartmentID"] = departmentID;
    map["CategoryName"] = categoryName;
    map["CategoryDescrition"] = categoryDescrition;
    map["PriorityID"] = priorityID;
    map["PriorityName"] = priorityName;
    map["PriorityDescription"] = priorityDescription;
    map["ResolutionTime"] = resolutionTime;
    map["ResponseTime"] = responseTime;
    map["CategoryLogoFileName"] = categoryLogoFileName;
    return map;
  }
}
