import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../routes/global.dart';
import '../../util/c.dart';
import '../../util/commom_image.dart';

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
      backgroundColor: C.STATUSBAR, // 设置背景颜色为白色
        appBar: AppBar(
          centerTitle: true, // 将标题居中
        backgroundColor: C.STATUSBAR, // 设置背景颜色为白色
        elevation: 0, // 取消阴影
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0), // 设置下划线高度
          child: Container(
            color: Color.fromARGB(255, 223, 223, 223), // 自定义下划线颜色
            height: 1.0,
          ),
        ),
          title: Text('登录',
          style: TextStyle(
            color: Colors.black, // 设置标题颜色为黑色
            fontSize: 18,
            fontWeight: FontWeight.bold, // 设置加粗字体
            decoration:
                TextDecoration.combine([TextDecoration.underline]), // 添加下划线样式
            decorationColor: Colors.blue.withOpacity(0.5), // 设置下划线颜色和透明度
            decorationThickness: 4, // 设置下划线粗细
          ),),
        ),
        body: SafeArea(
          minimum: EdgeInsets.all(30),
          child: ListView(
            children: <Widget>[
              SizedBox( height: 20.0),
              Container(
            width: 200,
            child: CommonImage('assets/images/logo.png'), // 替换为您的图片路径
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
                      Global.router.navigateTo(context, "/register", transition: TransitionType.inFromRight);  // 按钮点击逻辑
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
