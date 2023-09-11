import 'dart:async';
import 'dart:convert';
import 'package:fictionapp/entity/fiction.dart';
import 'package:fictionapp/util/dio_http.dart';
import 'package:flutter/cupertino.dart';

// 发随机推荐的请求
Future<List<FictionItem>> getRecommendRandom(
    String id, String bigclass, BuildContext context) async {
  final url = '/recommend/random';
  var params = {
    'id': id,
    'bigclass': bigclass,
  };
  var result = await DioHttp.of(context).get(url, params);
  var resMap = json.decode(result.toString());

  List<FictionItem> fictionItemList = (resMap['data'] as List)
      .map((item) => FictionItem.fromJson(item))
      .toList();

  return fictionItemList;
}
// 发查询全部书籍请求
Future<List<FictionItem>> getFictionList(
  BuildContext context, {
  int? page,
  int? size,
  String? classify,
  String? bigclass,
}) async {
  final url = '/fiction/list';
  var params = {
    'page': page,
    'size': size,
    'classify': classify,
    'bigclass': bigclass,
  };
  var result = await DioHttp.of(context).get(url, params);
  var resMap = json.decode(result.toString());

  List<FictionItem> fictionItemList = (resMap['data'] as List)
      .map((item) => FictionItem.fromJson(item))
      .toList();

  return fictionItemList;
}

//根据id查询书籍
Future<FictionItem> getFictionId(
  BuildContext context, {
  String? id,
}) async {
  final url = '/fiction/fictionid';
  var params = {
    'id': id,
  };
  var result = await DioHttp.of(context).get(url, params);
  var resMap = json.decode(result.toString());
  FictionItem fictionItem = FictionItem.fromJson(resMap['data']);
  return fictionItem;
}