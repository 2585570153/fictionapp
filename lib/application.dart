
import 'package:fictionapp/pages/home/home_page.dart';

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
      theme: ThemeData(
        primaryColor: Colors.blue, // 设置主题色
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.blue, // 设置选中项的图标和字体颜色
          unselectedItemColor: Color.fromARGB(255, 65, 65, 66), // 设置未选中项的图标和字体颜色
        ),
      ),
    );
  }
}

