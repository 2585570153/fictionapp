import 'dart:ui';

import 'package:fictionapp/pages/read/read_bottom_bar.dart';
import 'package:fictionapp/pages/read/read_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../util/c.dart';
import '../../util/common_image.dart';

// ignore: must_be_immutable
class ReadPage extends StatefulWidget {
  
  String? id;

  ReadPage({Key? key, this.id}) : super(key: key); 
  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {

 // 在构造函数中接收 id 参数
  final ReadController controller = Get.put(ReadController());
 @override
  void initState() {
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 210, // 导航栏展开时的高度
                floating: false, // 导航栏不浮动
                pinned: true, // 导航栏固定在顶部
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true, // 让标题居中显示
                  title: Text('下拉显示导航栏'),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // 毛玻璃效果背景
                      CommonImage(
                        'https://www.qishu.org/files/article/image/113/113108/113108s.jpg', // 你的背景图片地址
                        fit: BoxFit.cover,
                      ),
                      // 毛玻璃滤镜
                      BackdropFilter(
                        filter:
                            ImageFilter.blur(sigmaX: 10, sigmaY: 10), // 毛玻璃效果参数
                        child: Container(
                            color: Colors.black.withOpacity(0.5)), // 背景颜色及透明度
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // 电量信息文本
                          Text(
                            '内容', // 替换为你的电量信息
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          // 其他内容
                          // ...
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(title: Text('Item $index'));
                  },
                  childCount: 30,
                ),
              ),
            ],
          ),

        bottomNavigationBar: ReadBottomBar());
  }
}

//  body: GetBuilder<ReadController>(builder: (controller) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Count from AnotherScreen: ${controller.count}'),
//                 ElevatedButton(
//                   onPressed: controller.increase,
//                   child: Text('Increment from AnotherScreen'),
//                 ),
//               ],
//             ),
//           );
//         }),