import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';

import '../entity/chapter.dart';
import '../util/dio_http.dart';

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
