import 'result.dart';

class DashboardResponse {
  DashboardResponse(
      this.status, 
      this.statusId, 
      this.message, 
      this.result,);

  DashboardResponse.fromJson(dynamic json) {
    status = json['status'];
    statusId = json['statusId'];
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  late bool status;
  late int statusId;
  late String message;
  Result? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusId'] = statusId;
    map['message'] = message;
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }

}