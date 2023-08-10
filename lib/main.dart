
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'Routes/routes.dart';

import 'package:fictionapp/routes/global.dart';

import 'application.dart';


void main() {
      // 初始化路由
  FluroRouter router = new FluroRouter();
  
  Routes.configureRoutes(router);
  // 将初始化的路由放大全局组件中
  Global.router = router;

  runApp(const Application());

}

