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
      body: Center(
          child: MyButton(), // 在这里添加按钮组件
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