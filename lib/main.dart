import 'package:fictionapp/util/app_shared_preferences.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'Routes/routes.dart';

import 'package:fictionapp/routes/global.dart';

import 'application.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 确保Flutter绑定已初始化

  // 初始化路由
  FluroRouter router = FluroRouter();
  Routes.configureRoutes(router);
  Global.router = router;

  // 初始化共享偏好设置
  await AppSharedPreferences.getInstance();
  
 WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromARGB(0, 255, 255, 255), // transparent status bar
  ));

  runApp(const Application());

}

