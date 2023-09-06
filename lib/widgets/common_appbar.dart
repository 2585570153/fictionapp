import 'package:flutter/material.dart';

import '../util/c.dart';
class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
    CommonAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          title: Text(
            '当前页面',
            style: TextStyle(
              color: Colors.black, // 设置标题颜色为黑色
              fontSize: 18,
              fontWeight: FontWeight.bold, // 设置加粗字体
              decoration:
                  TextDecoration.combine([TextDecoration.underline]), // 添加下划线样式
              decorationColor: Colors.blue.withOpacity(0.5), // 设置下划线颜色和透明度
              decorationThickness: 4, // 设置下划线粗细
            ),
          ),
          // leading: Container(), // 隐藏返回箭头
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: C.ICOCOLOR,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
  
   @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}