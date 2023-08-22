import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../routes/global.dart';

class PageContent extends StatelessWidget {
  final String name;
  const PageContent({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("$name"))),
      body: Column(
        children: [
          Center(
              child: MyButton(), // 在这里添加按钮组件
            ),
          ElevatedButton(
      onPressed: () {
          Global.router.navigateTo(context, "/read/2");
        },
      child: Text("阅读页"),
    ),  
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
          Global.router.navigateTo(context, "/login", transition: TransitionType.fadeIn);
        },
      child: Text("注册"),
    );
  }
}