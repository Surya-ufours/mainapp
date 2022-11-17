import 'dart:convert';
import 'dart:developer';

import 'package:checklist/helpers/utils.dart';
import 'package:checklist/model/user_response.dart';
import 'package:dio/dio.dart';

import 'urls.dart';

class ApiCall {
  static final ApiCall _instance = ApiCall._internal();
  final Dio _dio = Dio();

  factory ApiCall() {
    return _instance;
  }

  ApiCall._internal() {
    _dio.options.baseUrl = baseUrl;
  }

  Future<UserResponse?> checkLogin(String userName, String password) async {
    var params = {
      "username": encryptString("", userName),
      "password": encryptString("", password)
    };
    final response = await _dio.post(loginApi, data: params);

    log('${response.requestOptions.baseUrl}\n${response.requestOptions.path}\n${jsonEncode(params)}\n${response.statusCode}\n${response.data}');
    if ((response.statusCode ?? -1) <= 205) {
      return UserResponse.fromJson(response.data);
    } else {
      // showToastMsg(response.statusMessage ?? 'Error');
      return null;
    }
  }
}
