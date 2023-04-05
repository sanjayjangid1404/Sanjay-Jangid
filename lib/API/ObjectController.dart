
import 'dart:convert';

import 'package:airedge/API/ApiUrl.dart';
import 'package:airedge/Model/RequestModel/LoginRequestModel.dart';
import 'package:airedge/Model/ResponseModel/LoginResponse.dart';
import 'package:airedge/appcomman/AppUtil.dart';
import 'package:http/http.dart'as http;

class ObjectController {

  loginCallAPI(LoginRequestModel requestModel) async {

    AppUtil.appLogs("--------------Parameter---------------");
    AppUtil.appLogs(requestModel.toJson());
    final response = await http.post(Uri.parse(baseURL+"login.php"), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      AppUtil.appLogs("--------------Response---------------");
      AppUtil.appLogs(json.decode(response.body));
      int statusCode = response.statusCode;
      AppUtil.appLogs("--------------Status Code---------------");
      AppUtil.appLogs(statusCode);
      final LoginResponse responseModel;
      if (statusCode == 200 || response.statusCode == 400) {
        responseModel = LoginResponse.fromJson(json.decode(response.body));
        return responseModel;
      } else {
        responseModel = LoginResponse.fromJson(json.decode(response.body));
        return responseModel;
        throw Exception('Failed to load data!');
        // return loginResponse;

      }
    } else {
      final LoginResponse responseModel;
      responseModel = LoginResponse.fromJson(json.decode(response.body));
      return responseModel;
      throw Exception('Failed to load data!');
    }
  }
}