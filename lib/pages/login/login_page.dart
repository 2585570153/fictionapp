import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../routes/global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

      bool showPassword = false;
      
  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true, // 将标题居中
          title: Text('登录'),
        ),
        body: SafeArea(
          minimum: EdgeInsets.all(30),
          child: ListView(
            children: <Widget>[
              SizedBox( height: 20.0),
              Container(
            width: 200,
            child: Image.asset('assets/images/logo.png'), // 替换为您的图片路径
          ),  
              SizedBox( height: 20.0),
              TextField(
                decoration: InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
              ),
              
              SizedBox( height: 20.0),
              TextField(
                obscureText: !showPassword,
                decoration: InputDecoration(
                  labelText: '密码', 
                  hintText: '请输入密码',
                  suffixIcon: IconButton(
                    icon: Icon(
                      // 显示密码按钮
                      // ignore: dead_code
                      showPassword? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        showPassword =!showPassword;
                      });
                    },
                  ),
                  ),
              ),
              
              SizedBox( height: 30.0),
              ElevatedButton(
                onPressed: () {
                  // 按钮点击逻辑
                },
                child: Text('登录'),
              ),
              SizedBox( height: 20.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        // 按钮点击逻辑
                      },
                      child: Text('忘记密码'),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                      Global.router.navigateTo(context, "/home", transition: TransitionType.fadeIn);  // 按钮点击逻辑
                      },
                      child: Text('注册'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
