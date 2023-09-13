import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';

import '../entity/chapter.dart';
import '../util/dio_http.dart';
//根据书籍id查询章节
Future<List<ChapterItem>> getFictionChapter(
  BuildContext context, {
  String? id,
}) async {
  final url = '/chapter/chapterid';
  var params = {'id': id};
  var result = await DioHttp.of(context).get(url, params);
  var resMap = json.decode(result.toString());

  List<ChapterItem> chapterItem = (resMap['data'] as List)
      .map((item) => ChapterItem.fromJson(item))
      .toList();

  return chapterItem;
}
//根据章节id查询内容
Future<ChapterItem> getContenttxt(
  BuildContext context, {
  String? id,
}) async {
  final url = '/chapter/content/contenttxt';
  var params = {
    'id': id,
  };
  var result = await DioHttp.of(context).get(url, params);
  var resMap = json.decode(result.toString());
  ChapterItem fictionItem = ChapterItem.fromJson(resMap['data']);
  return fictionItem;
}