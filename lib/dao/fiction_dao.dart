import 'dart:async';
import 'dart:convert';
import 'package:fictionapp/entity/fiction.dart';
import 'package:fictionapp/util/dio_http.dart';
import 'package:flutter/cupertino.dart';
// 发随机推荐的请求
Future<List<FictionItem>> getRecommendRandom (
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
  // ...
}
