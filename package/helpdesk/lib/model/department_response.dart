class DepartmentResponse {
  late List<Department> lstDepartment;
  late bool status;
  late String message;

  DepartmentResponse(this.lstDepartment, this.status, this.message);

  DepartmentResponse.fromJson(dynamic json) {
    if (json["lstDepartment"] != null) {
      lstDepartment = [];
      json["lstDepartment"].forEach((v) {
        lstDepartment.add(Department.fromJson(v));
      });
    }
    status = json["Status"];
    message = json["Message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (lstDepartment != null) {
      map["lstDepartment"] = lstDepartment.map((v) => v.toJson()).toList();
    }
    map["Status"] = status;
    map["Message"] = message;
    return map;
  }
}

class Department {
  late int departmentID;
  late String departmentName;
  late String departmentDescription;
  late String departmentLogoFileName;

  Department(this.departmentID, this.departmentName, this.departmentDescription,
      this.departmentLogoFileName);

  Department.fromJson(dynamic json) {
    departmentID = json["DepartmentID"];
    departmentName = json["DepartmentName"];
    departmentDescription = json["DepartmentDescription"];
    departmentLogoFileName = json["DepartmentLogoFileName"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["DepartmentID"] = departmentID;
    map["DepartmentName"] = departmentName;
    map["DepartmentDescription"] = departmentDescription;
    map["DepartmentLogoFileName"] = departmentLogoFileName;
    return map;
  }
}
