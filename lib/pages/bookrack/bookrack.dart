import 'package:flutter/material.dart';


import '../../util/c.dart';

class Bookrack extends StatefulWidget {
  const Bookrack({super.key});

  @override
  State<Bookrack> createState() => _BookrackState();
}

class _BookrackState extends State<Bookrack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: C.ICOCOLOR,
            ),
            onPressed: () {
              // 处理搜索按钮点击事件
            },
          ),
        ],
        title: Text(
          "书架",
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

        leading: PopupMenuButton<String>(
          icon: Icon(
            Icons.menu,
            color: C.ICOCOLOR,
          ),
          onSelected: (value) {
            // 处理选择器选择事件
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'male',
              child: Text('1'),
            ),
            PopupMenuItem<String>(
              value: 'female',
              child: Text('2'),
            ),
            PopupMenuItem<String>(
              value: 'publishing',
              child: Text('3'),
            ),
          ],
          offset: Offset(0, 50), // 调整向下偏移量
        ),
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
      ),
      body: const Text('这是书架'),
    );
  }
}
        // SafeArea(
        //   minimum: EdgeInsets.all(C.BOOKSTOREPADDING),
        //   child: Container(
        //       decoration: BoxDecoration(
        //         color: Color.fromARGB(255, 247, 245, 245),
        //         borderRadius: BorderRadius.circular(10), // 设置圆角半径
        //       ),
        //       child: ListFiction(
        //         classify: '',
        //         bigclass: 'nansheng',
        //       )),
        // )