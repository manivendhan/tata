import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/browser_imp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../components/constants.dart';
import 'AppException.dart';

class ApiServices {
  static var dio = Dio();

  static Future<dynamic> getData(String uri) async{
    try{
      var response = await Dio().get(uri);
      return _processResponse(response);
    }on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }


  static dynamic _processResponse(response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        // var responseJson = utf8.decode(response.bodyBytes);
        return response;
      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException('Error occurred with code : ${response.statusCode}', response.request!.url.toString());
    }
  }
}