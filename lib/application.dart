
import 'package:fictionapp/pages/home/home_page.dart';
import 'package:fictionapp/routes/global.dart';

import 'package:flutter/material.dart';


class Application extends StatelessWidget {

    const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fiction小说网',
      // // 指定动态路由 
      // onGenerateRoute: Global.router.generator,
      // // 默认路由
      // initialRoute: '/home',
      home: HomePage(),
    );
  }
}

