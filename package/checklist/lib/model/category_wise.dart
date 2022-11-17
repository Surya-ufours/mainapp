class CategoryWise {
  CategoryWise(
      this.notMet, 
      this.met, 
      this.categoryName, 
      this.categoryId,);

  CategoryWise.fromJson(dynamic json) {
    notMet = json['NotMet'];
    met = json['Met'];
    categoryName = json['CategoryName'];
    categoryId = json['CategoryId'];
  }
  late String notMet;
  late String met;
  late String categoryName;
  late int categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['NotMet'] = notMet;
    map['Met'] = met;
    map['CategoryName'] = categoryName;
    map['CategoryId'] = categoryId;
    return map;
  }

}