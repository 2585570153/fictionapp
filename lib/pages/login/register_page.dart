import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../routes/global.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

      bool showPassword = false;
      
  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true, // 将标题居中
          title: Text('注册'),
        ),
        body: SafeArea(
          minimum: EdgeInsets.all(30),
          child: ListView(
            children: <Widget>[
              SizedBox( height: 10.0),
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
              SizedBox( height: 20.0),
              TextField(
                obscureText: !showPassword,
                decoration: InputDecoration(
                  labelText: '确认密码', 
                  hintText: '请确认密码',
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
              SizedBox( height: 20.0),
              TextField(
                decoration: InputDecoration(labelText: '邮箱', hintText: '请输入邮箱'),
              ),
              SizedBox( height: 30.0),
              ElevatedButton(
                onPressed: () {
                  // 按钮点击逻辑
                },
                child: Text('注册'),
              ),
              SizedBox( height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // 水平居中
                children: <Widget>[
                  Text('已有账号,'),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('去登录~'),
                  ),  
                ],
              )
            ],
          ),
        ));
  }
}
