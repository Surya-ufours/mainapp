import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:helpdesk/helpers/utils.dart';
import 'package:helpdesk/model/all_tickets_response.dart';
import 'package:helpdesk/model/assignee_response.dart';
import 'package:helpdesk/model/department_response.dart';
import 'package:helpdesk/model/feedback_tickets_response.dart';
import 'package:helpdesk/model/histories.dart';
import 'package:helpdesk/model/issue_response.dart';
import 'package:helpdesk/model/login_response.dart';
import 'package:helpdesk/model/qr_code_detail_response.dart';
import 'package:helpdesk/model/status_list_response.dart';
import 'package:helpdesk/model/ticket_type_response.dart';
import 'package:i2iutils/helpers/common_functions.dart';

import 'urls.dart';

class HelpdeskApiCall {
  static final HelpdeskApiCall _instance = HelpdeskApiCall._internal();
  final Dio _dio = Dio();

  factory HelpdeskApiCall() {
    return _instance;
  }

  HelpdeskApiCall._internal() {
    _dio.options.baseUrl = HELPDESK_MAIN_URL;
  }

  Future<LoginResponse?> checkLogin(String userName, String password) async {
    var params = {
      'username': userName,
      'password': password,
    };
    final response = await _dio.get(loginApi, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${jsonEncode(params)}\n${response.statusCode}\n${response.data}');
    if ((response.statusCode ?? -1) <= 205) {
      return LoginResponse.fromJson(response.data);
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> getSettings(String userId) async {
    var params = {'userid': userId};
    final response = await _dio.get(settingApi, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${jsonEncode(params)}\n${response.statusCode}\n${response.data}');
    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<AllTicketsResponse?> getTickets(String url, var params) async {
    log('${_dio.options.baseUrl}{$url} ${jsonEncode(params)}');
    try {
      final response = await _dio.get(url, queryParameters: params);

      log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${jsonEncode(params)}\n${response.statusCode}\n${response.data}');
      if ((response.statusCode ?? -1) <= 205) {
        return AllTicketsResponse.fromJson(response.data);
      } else {
        showToastMsg(response.statusMessage ?? 'Error');
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<HistoryResponse?> getTicketHistory(String complaintId) async {
    var params = {'complaintId': complaintId};
    final response = await _dio.get(ticketHistoryApi, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${jsonEncode(params)}\n${response.statusCode}\n${response.data}');
    if ((response.statusCode ?? -1) <= 205) {
      return HistoryResponse.fromJson(response.data);
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<AssigneeResponse?> getAssignees(String complaintId) async {
    var params = {'complaintId': complaintId};
    final response = await _dio.get(assigneeApi, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${jsonEncode(params)}\n${response.statusCode}\n${response.data}');
    if ((response.statusCode ?? -1) <= 205) {
      return AssigneeResponse.fromJson(response.data);
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<StatusListResponse?> getStatusList(
      int statusId, int companyId, int roleId) async {
    var params = {
      'statusId': '$statusId',
      'companyid': '$companyId',
      'roleid': '$roleId'
    };
    final response = await _dio.get(statusListApi, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${jsonEncode(params)}\n${response.statusCode}\n${response.data}');
    if ((response.statusCode ?? -1) <= 205) {
      return StatusListResponse.fromJson(response.data);
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<TicketTypeResponse?> getTicketTypes(String companyId) async {
    var params = {
      "CompanyID": companyId,
    };

    log('${_dio.options.baseUrl}\n$ticketTypeUrl\n${jsonEncode(params)}');
    final response = await _dio.get(ticketTypeUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${jsonEncode(params)}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return TicketTypeResponse.fromJson(response.data);
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<DepartmentResponse?> getDepartments(int companyId, int userId) async {
    var params = {
      "userId": '$userId',
      "CompanyID": '$companyId',
    };

    log(jsonEncode(params));
    final response = await _dio.get(departmentUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${jsonEncode(params)}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return DepartmentResponse.fromJson(response.data);
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<IssueResponse?> getIssues(
      int companyId, int userId, int deptId) async {
    var params = {
      "userId": '$userId',
      "companyid": '$companyId',
      "departmentId": '$deptId',
    };

    log(jsonEncode(params));
    final response = await _dio.get(issueUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${jsonEncode(params)}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return IssueResponse.fromJson(response.data);
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> getRequestTypeList(int compid, int roleId) async {
    var params = {
      "companyid": '$compid',
      "roleid": '$roleId',
    };

    log(jsonEncode(params));
    final response = await _dio.get(requestTypeUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${jsonEncode(params)}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<QrCodeDetailResponse?> getQrCodeDetails(
    int compid,
    String qrresult,
    int userId,
    int roleId,
  ) async {
    var params = {
      "CompanyID": '$compid',
      "Barcode": qrresult,
      "userid": userId,
      "roleid": roleId,
    };

    log(jsonEncode(params));
    final response = await _dio.get(barcodeUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${jsonEncode(params)}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return QrCodeDetailResponse.fromJson(response.data);
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> createTicket(var params, String? filePath) async {
    log(jsonEncode(params));

    final response = await _dio.post(createTicketUrl, data: jsonEncode(params));

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> getTimingList(
    int complaintId,
  ) async {
    var params = {
      "ComplaintID": '$complaintId',
    };

    log(jsonEncode(params));
    final response = await _dio.get(timingUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${jsonEncode(params)}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> doLogout(
    int userid,
  ) async {
    var params = {
      "userid": '$userid',
    };

    log(jsonEncode(params));
    final response = await _dio.post(logoutUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> updateTicket(
    var params,
  ) async {
    log(jsonEncode(params));
    final response = await _dio.post(updateTicketUrl, data: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> updateToken(
    var params,
  ) async {
    log(jsonEncode(params));
    final response = await _dio.post(updateTokenUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> updateAssignee(
    var params,
  ) async {
    log(jsonEncode(params));
    final response = await _dio.post(updateAssigneeUrl, data: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  //client Helpdesk apis

  //forgot password
  Future<dynamic> updateForgotPassword(
    String mail,
  ) async {
    Map<String, String> params = {
      'username': mail,
    };

    final response =
        await _dio.post(forgotPasswordUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> updateResetPassword(
    String userName,
    String oPassword,
    String nPassword,
  ) async {
    Map<String, String> params = {
      'UserName': userName,
      'OldPassword': oPassword,
      'NewPassword': nPassword,
    };

    final response = await _dio.post(resetPasswordUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<FeedbackTicketsResponse?> getFeedbackTickets(
    String companyId,
    String userId,
  ) async {
    Map<String, String> params = {
      'CompanyId': companyId,
      'UserId': userId,
    };

    log(jsonEncode(params));
    final response = await _dio.get(getFeedbackUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return FeedbackTicketsResponse.fromJson(response.data);
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> insertFeedback(var params) async {
    log(jsonEncode(params));
    final response = await _dio.post(insertFeedbackUrl, data: params);
    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data; //Status, Message
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> postInsertUserSignup(
    String domain,
    String fName,
    String lName,
    String email,
    String mobile,
    String password,
    String locationId,
    String buildingId,
    String floorId,
  ) async {
    Map<String, String> params = {
      "UserID": "0",
      "companyid": "11",
      "domain": domain,
      "FirstName": fName,
      "LastName": lName,
      "emailid": email,
      "MobileNo": mobile,
      "Password": password,
      "buildingids": buildingId,
      "LocationID": locationId,
      "FloorID": floorId,
    };

    log(jsonEncode(params));
    final response = await _dio.post(signupUrl, data: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data; //Status, Message
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> getDomainCompanies(
    String domain,
  ) async {
    Map<String, String> params = {
      'DomainName': domain,
    };

    log(jsonEncode(params));
    final response = await _dio.get(domainCompanyUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> getLocationList(
    String companyId,
    String domain,
  ) async {
    Map<String, String> params = {
      'CompanyID': companyId,
      'DomainName': domain,
    };

    log(jsonEncode(params));
    final response = await _dio.get(locationListUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> getBuildingList(
    String locationId,
  ) async {
    Map<String, String> params = {
      'LocationID': locationId,
    };

    log(jsonEncode(params));
    final response = await _dio.get(buildingListUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> getFloorList(
    String floorId,
  ) async {
    Map<String, String> params = {
      'BuildingId': floorId,
    };

    log(jsonEncode(params));
    final response = await _dio.get(floorListUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> signupTenant(
    var params,
  ) async {
    log(jsonEncode(params));
    final response = await _dio.post(signupUrl, data: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> getComplaintType(
    var compId,
  ) async {
    var params = {'CompanyID': compId};

    log(jsonEncode(params));
    final response = await _dio.get(complaintTypeUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> getModeOfCommunication(
    var groupId,
  ) async {
    var params = {'GroupID': groupId};

    log(jsonEncode(params));
    final response =
        await _dio.get(communicationTypeUrl, queryParameters: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }

  Future<dynamic> getAppVersion() async {
    var response = await _dio.getUri(Uri.parse(appVersionUrl));
    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      return null;
    }
  }

  Future<dynamic> sendEscalation(
    var params,
  ) async {
    log(jsonEncode(params));
    final response = await _dio.post(escalationUrl, data: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${response.statusCode}\n${response.data}');

    if ((response.statusCode ?? -1) <= 205) {
      return response.data;
    } else {
      showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }
}
