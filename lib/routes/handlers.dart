import 'package:fictionapp/pages/read/read_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
// 页面
import 'package:fictionapp/pages/home/home_page.dart';
import 'package:fictionapp/pages/login/login_page.dart';
import '../pages/login/register_page.dart';
import '../pages/novel/novel_reader_page.dart';

// 登录页
var loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const LoginPage();
});

// 首页
var HomeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const HomePage();
});

var RegisterHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const RegisterPage();
  });
var ChassifyHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const HomePage(defaultIndex: 2,);
  });
var ReadHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
     String fictionId = params['id']?.first ?? ''; // 'id' 对应于路径中的 :id
    return  ReadPage(id: fictionId,);
  });  
  var NovelHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
     String chapterId = params['chapterId']?.first ?? ''; // 'id' 对应于路径中的 :id
     String fictionId = params['fictionId']?.first ?? '';
    return  NovelReaderPage(chapterId: chapterId,fictionId:fictionId);
  });  