import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'app_exception.dart';
import 'print_utils.dart';

class ApiBaseHelper {
  String header;
  Future<dynamic> get(Uri uri, String header) async {
    var responseJson;
    try {
      logger.d("CONVERT DONE: $uri");
      final response = await http.get(uri, headers: {
        HttpHeaders.authorizationHeader: header,
        HttpHeaders.contentTypeHeader: 'application/json'
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  Future<dynamic> patch(Uri uri, {body}) async {
    var responseJson;
    // String header = await SharedPrefUtil().getToken();
    try {
      logger.d("CONVERT DONE: $uri");
      final response = await http.patch(uri,
          headers: {
            HttpHeaders.authorizationHeader: header,
            HttpHeaders.contentTypeHeader: 'application/json'
          },
          body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  Future<dynamic> post(Uri uri, {@required String header, body}) async {
    var responseJson;
    try {
      logger.d("CONVERT DONE: $uri");
      logger.d(header);
      logger.d(body);
      final response = header == null
          ? await http.post(
              uri,
              headers: {HttpHeaders.contentTypeHeader: 'application/json'},
              body: body,
            )
          : await http.post(
              uri,
              headers: {
                HttpHeaders.authorizationHeader: header,
                HttpHeaders.contentTypeHeader: 'application/json'
              },
              body: body,
            );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    logger.i(response.statusCode);
    switch (response.statusCode) {
      case 200:
        var responseJson = response;
        Log.betterPrintJson(response.body);
        return responseJson;
      case 201:
        var responseJson = response;
        Log.betterPrintJson(response.body);
        return responseJson;
      case 204:
        logger.d("Response No Content");
        return true;
      case 400:
        Log.betterPrintJson(response.body);

        throw BadRequestException();
      case 401:
      case 404:
      case 403:
        Log.betterPrintJson(response.body);

        throw UnauthorisedException();
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
