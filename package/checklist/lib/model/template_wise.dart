class TemplateWise {
  TemplateWise(
      this.categoryName, 
      this.categoryId, 
      this.notMet, 
      this.met, 
      this.templateName, 
      this.templateId,);

  TemplateWise.fromJson(dynamic json) {
    categoryName = json['CategoryName'];
    categoryId = json['CategoryId'];
    notMet = json['NotMet'];
    met = json['Met'];
    templateName = json['TemplateName'];
    templateId = json['TemplateId'];
  }
  late String categoryName;
  late int categoryId;
  late String notMet;
  late String met;
  late String templateName;
  late int templateId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CategoryName'] = categoryName;
    map['CategoryId'] = categoryId;
    map['NotMet'] = notMet;
    map['Met'] = met;
    map['TemplateName'] = templateName;
    map['TemplateId'] = templateId;
    return map;
  }

}