
import 'dart:convert';

import 'package:airedge/API/ApiUrl.dart';
import 'package:airedge/Model/RequestModel/FlightRequestModel.dart';
import 'package:airedge/Model/ResponseModel/BookingResponse.dart';
import 'package:airedge/Model/ResponseModel/CityResponse.dart';
import 'package:airedge/Model/ResponseModel/FlightListResponse.dart';
import 'package:airedge/appcomman/AppUtil.dart';
import 'package:http/http.dart'as http;
import 'package:airedge/Model/RequestModel/BookingRequest.dart';

class ArrayController {

  Future<CityResponse?> getAllCity() async {

    
    AppUtil.appLogs("--------------WebService---------------");

    AppUtil.appLogs("--------------Parameter---------------");


    final response = await http.get(Uri.parse("$baseURL/city.php"));
    if (response.statusCode == 200 || response.statusCode == 400) {
      AppUtil.appLogs("--------------Response---------------");
      AppUtil.appLogs(response.body.isNotEmpty ? json.decode(response.body) : "");
      int statusCode = response.statusCode;
      AppUtil.appLogs("--------------Status Code---------------");
      AppUtil.appLogs(statusCode);
      if (statusCode == 200) {
        final CityResponse imgList = CityResponse.fromJson(json.decode(response.body));


        return imgList;
      } else {
        return null;
      }
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<BookingResponse?> getAllBooking(BookingRequest requestModel) async {
    AppUtil.appLogs("--------------WebService---------------");

    AppUtil.appLogs("--------------Parameter---------------");


    final response = await http.post(Uri.parse("$baseURL/booking.php"),body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      AppUtil.appLogs("--------------Response---------------");
      AppUtil.appLogs(response.body.isNotEmpty ? json.decode(response.body) : "");
      int statusCode = response.statusCode;
      AppUtil.appLogs("--------------Status Code---------------");
      AppUtil.appLogs(statusCode);
      if (statusCode == 200) {
        final BookingResponse imgList =BookingResponse.fromJson(json.decode(response.body));


        return imgList;
      } else {
        return null;
      }
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<FlightListResponse?> getAllFlight(FlightRequestModel requestModel) async {
    AppUtil.appLogs("--------------WebService---------------");

    AppUtil.appLogs("--------------Parameter---------------");

    AppUtil.appLogs(requestModel.toJson());


    final response = await http.post(Uri.parse("$baseURL/flightList.php"),body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      AppUtil.appLogs("--------------Response---------------");
      AppUtil.appLogs(response.body.isNotEmpty ? json.decode(response.body) : "");
      int statusCode = response.statusCode;
      AppUtil.appLogs("--------------Status Code---------------");
      AppUtil.appLogs(statusCode);
      if (statusCode == 200) {
        final FlightListResponse imgList =FlightListResponse.fromJson(json.decode(response.body));


        return imgList;
      } else {
        return null;
      }
    } else {
      throw Exception('Failed to load data!');
    }
  }

}