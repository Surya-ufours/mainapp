class DepartmentWise {
  DepartmentWise(
      this.departmentId, 
      this.departmentName, 
      this.met, 
      this.notMet,);

  DepartmentWise.fromJson(dynamic json) {
    departmentId = json['DepartmentId'];
    departmentName = json['DepartmentName'];
    met = json['Met'];
    notMet = json['NotMet'];
  }
  late int departmentId;
  late String departmentName;
  late String met;
  late String notMet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['DepartmentId'] = departmentId;
    map['DepartmentName'] = departmentName;
    map['Met'] = met;
    map['NotMet'] = notMet;
    return map;
  }

}