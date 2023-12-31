import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'handlers.dart';

class Routes {
  static String home = "/home";
  static String login = "/login";
  static String register = "/register";
  static String chassify = "/chassify";
  static String read = "/read/:id";
  static String novel = "/novel/:chapterId/:fictionId";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    // 首页
    router.define(home, handler: HomeHandler);
    //登录
    router.define(login, handler: loginHandler);
    //注册
    router.define(register, handler: RegisterHandler);
    //分类
    router.define(chassify, handler: ChassifyHandler);
    //书籍详细页
    router.define(read, handler: ReadHandler);

    router.define(novel, handler: NovelHandler);
  }
}
