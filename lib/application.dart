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
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor:
            Color.fromARGB(255, 233, 233, 233), // 设置主题背景色为淡灰色
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color.fromARGB(255, 80, 167, 238), // 设置选中项的图标和字体颜色
          unselectedItemColor:
              Color.fromARGB(255, 65, 65, 66), // 设置未选中项的图标和字体颜色
        ),
      ),
    );
  }
}
