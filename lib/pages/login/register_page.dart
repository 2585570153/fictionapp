import 'dart:convert';

import 'package:fictionapp/util/dio_http.dart';
import 'package:fictionapp/util/string_util.dart';
import 'package:flutter/material.dart';

import '../../util/c.dart';
import '../../util/toast_util.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showPassword = false;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var repeatPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var nicknameController = TextEditingController();

  _registerHandler() async {
    var username = usernameController.text;
    var password = passwordController.text;
    var repeatPassword = repeatPasswordController.text;
    var email = emailController.text;
    var nickname = nicknameController.text;
    if (password != repeatPassword) {
      return ToastUtil.showShortToast("两次输入的密码不一致");
    }
    if (StringUtil.stringIsNullOrEmpty(username) ||
        StringUtil.stringIsNullOrEmpty(password)) {
      return ToastUtil.showShortToast("用户名或密码不能为空");
    }
    const url = '/user/register';
    var params = {
      'nickname': nickname,
      'username': username,
      'password': password,
      'email': email,
    };
    var result = await DioHttp.of(context).post(url, params);
    var resString = json.decode(result.toString());
    ToastUtil.showShortToast(resString['msg']);
  }

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
          title: Text('注册',
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
              SizedBox(height: 10.0),
              TextField(
                controller: nicknameController, //获取用户输入的值
                decoration: InputDecoration(labelText: '昵称', hintText: '请输入昵称'),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: usernameController, //获取用户输入的值
                decoration:
                    InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: passwordController,
                obscureText: !showPassword,
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '请输入密码',
                  suffixIcon: IconButton(
                    icon: Icon(
                      // 显示密码按钮
                      // ignore: dead_code
                      showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: repeatPasswordController,
                obscureText: !showPassword,
                decoration: InputDecoration(
                  labelText: '确认密码',
                  hintText: '请确认密码',
                  suffixIcon: IconButton(
                    icon: Icon(
                      // 显示密码按钮
                      // ignore: dead_code
                      showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: '邮箱', hintText: '请输入邮箱'),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  _registerHandler();
                },
                child: Text('注册'),
              ),
              SizedBox(height: 20.0),
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
