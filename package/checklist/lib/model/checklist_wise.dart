class ChecklistWise {
  ChecklistWise(
      this.departmentId, 
      this.checkListId, 
      this.checkList, 
      this.met, 
      this.notMet, 
      this.categoryId,);

  ChecklistWise.fromJson(dynamic json) {
    departmentId = json['DepartmentId'];
    checkListId = json['CheckListId'];
    checkList = json['CheckList'];
    met = json['Met'];
    notMet = json['NotMet'];
    categoryId = json['CategoryId'];
  }
  late int departmentId;
  late int checkListId;
  late String checkList;
  late String met;
  late String notMet;
  late int categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['DepartmentId'] = departmentId;
    map['CheckListId'] = checkListId;
    map['CheckList'] = checkList;
    map['Met'] = met;
    map['NotMet'] = notMet;
    map['CategoryId'] = categoryId;
    return map;
  }

}