import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHttp {
  // ignore: unused_field
  Dio? _client;
  BuildContext? context;
  static DioHttp of(BuildContext context) {
    return DioHttp._internal(context);
  }

  DioHttp._internal(BuildContext context) {
    if (_client == null || context != this.context) {
      this.context = context;
      var options = BaseOptions(
          baseUrl: 'http://82.156.142.61',
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 3),
          extra: {'context': context});
      var client = Dio(options);
      _client = client;
    }
  }
  //Future异步
  Future<Response<Map<String, dynamic>>> get(String url,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client!.get(url, queryParameters: params, options: options);
  }

  Future<Response<Map<String, dynamic>>> post(String url,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client!.post(url, data: params, options: options);
  }

  Future<Response<Map<String, dynamic>>> postFormData(String url,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(
      contentType: 'application/json',
      headers: {'Authorization': token}
      );
    return await _client!.post(url, data: params, options: options);
      }
}
