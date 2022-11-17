import 'checklist_wise.dart';
import 'department_wise.dart';
import 'over_all.dart';
import 'category_wise.dart';
import 'template_wise.dart';

class Result {
  Result(
      this.overall, 
      this.departmentwise, 
      this.checklistwise, 
      this.categorywise, 
      this.templatewise,);

  Result.fromJson(dynamic json) {
    overall = json['overall'] != null ? Overall.fromJson(json['overall']) : null;
    if (json['departmentwise'] != null) {
      departmentwise = [];
      json['departmentwise'].forEach((v) {
        departmentwise?.add(DepartmentWise.fromJson(v));
      });
    }
    if (json['checklistwise'] != null) {
      checklistwise = [];
      json['checklistwise'].forEach((v) {
        checklistwise?.add(ChecklistWise.fromJson(v));
      });
    }
    if (json['Categorywise'] != null) {
      categorywise = [];
      json['Categorywise'].forEach((v) {
        categorywise?.add(CategoryWise.fromJson(v));
      });
    }
    if (json['Templatewise'] != null) {
      templatewise = [];
      json['Templatewise'].forEach((v) {
        templatewise?.add(TemplateWise.fromJson(v));
      });
    }
  }
  Overall? overall;
  List<DepartmentWise>? departmentwise;
  List<ChecklistWise>? checklistwise;
  List<CategoryWise>? categorywise;
  List<TemplateWise>? templatewise;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (overall != null) {
      map['overall'] = overall?.toJson();
    }
    if (departmentwise != null) {
      map['departmentwise'] = departmentwise?.map((v) => v.toJson()).toList();
    }
    if (checklistwise != null) {
      map['checklistwise'] = checklistwise?.map((v) => v.toJson()).toList();
    }
    if (categorywise != null) {
      map['Categorywise'] = categorywise?.map((v) => v.toJson()).toList();
    }
    if (templatewise != null) {
      map['Templatewise'] = templatewise?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}