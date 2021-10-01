import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_template/configs/constants.dart';
import 'package:flutter_template/utils/log.dart';

import 'app_exception.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

final box = GetStorage();

class ApiService extends GetConnect {
  String _baseUrl = "https://messenger.gapowork.vn/chat/v3.3";

  ApiService(String baseUrl) {
    _baseUrl = baseUrl;
    box.write(Constants.tokenStringKey, Constants.accessToken());
    onInit();
  }

  Future setRequireToken(bool needToken) async {
    return httpClient.addRequestModifier((Request request) {
      if (needToken) {
        String? token = box.read(Constants.tokenStringKey);
        if (token != null) request.headers['Authorization'] = "Bearer $token";
      }
      return request;
    });
  }

  @override
  Future onInit() async {
    httpClient.baseUrl = _baseUrl;
    logDebug("base url $_baseUrl");
    super.onInit();

    return httpClient.addRequestModifier((Request request) {
      String? token = box.read(Constants.tokenStringKey);
      if (token != null) request.headers['Authorization'] = "Bearer $token";

      request.headers['x-gapo-lang'] = Constants.language();
      return request;
    });
  }

  Future<dynamic> getData(
      {String endPoint = "", Map<String, String>? query}) async {
    var responseJson;
    try {
      final response = await get(endPoint, query: query);
      _logRequest(response: response);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postData({String endPoint = "", dynamic body}) async {
    var responseJson;
    try {
      final response = await post(endPoint, body);
      _logRequest(response: response, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> patchData({String endPoint = "", dynamic body}) async {
    var responseJson;
    var headers = {'x-gapo-user-id': Constants.userId()};
    try {
      final response = await patch(endPoint, body, headers: headers);
      _logRequest(response: response, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  void _logRequest({Response<dynamic>? response, dynamic body}) {
    print("----------------------NEW REQUEST----------------------");
    print("URL: ${response?.request?.url}");
    print("HEADERS: ${response?.request?.headers}");
    print("METHOD: ${response?.request?.method}");
    print("REQUEST BODY: $body");
    print("RESPONSE: ${response?.body}");
    print("----------------------END REQUEST----------------------");
  }
}
