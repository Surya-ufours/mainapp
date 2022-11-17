class Overall {
  Overall(
      this.met, 
      this.notMet,);

  Overall.fromJson(dynamic json) {
    met = json['Met'];
    notMet = json['NotMet'];
  }
  late String met;
  late String notMet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Met'] = met;
    map['NotMet'] = notMet;
    return map;
  }

}