import 'dart:ui';

import 'package:fictionapp/pages/read/read_bottom_bar.dart';
import 'package:fictionapp/pages/read/read_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../util/c.dart';
import '../../util/common_image.dart';
import '../../widgets/grid_fiction.dart';

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
        backgroundColor: C.STATUSBAR, // 设置背景颜色为白色
        drawer: Drawer(
          child: Container(
            color: Colors.white, // 设置背景颜色为米白色
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
               Container(
                  height: 100.0, // 设置抽屉头部的高度为150.0
                  child: Center(
                    child: Text(
                      '目录',
                      style: TextStyle(
                        color: Color.fromARGB(255, 12, 12, 12),
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text('章节1'),
                  onTap: () {
                    // 点击章节1时的操作
                  },
                ),
                ListTile(
                  title: Text('章节2'),
                  onTap: () {
                    // 点击章节2时的操作
                  },
                ),
                // 添加更多章节列表项
              ],
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 210, // 导航栏展开时的高度
              floating: true, // 设置为false，初始状态下标题不会显示
              pinned: true, // 设置为true，下滑时显示标题
              title: Text('书籍详细'),
              centerTitle: true, // 让标题居中显示
              leading: IconButton(
                icon: Icon(Icons.arrow_back), // 返回箭头图标
                onPressed: () {
                  
                },
              ),
              flexibleSpace: FlexibleSpaceBar(
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
                      mainAxisAlignment: MainAxisAlignment.start, // 在主轴上开始
                      children: [
                        SizedBox(
                          height: 110,
                        ),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.start, // 在主轴上居中对齐
                          crossAxisAlignment:
                              CrossAxisAlignment.center, // 在次轴上底部对齐
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 0, 0, 0)
                                        .withOpacity(0.05), // 阴影颜色和透明度
                                    spreadRadius: 1, // 阴影扩散半径
                                    blurRadius: 1, // 阴影模糊半径
                                    offset: Offset(0, 3), // 阴影偏移量
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(5), // 设置图片圆角半径
                                child: Container(
                                  height: 120,
                                  width: 120 / 1.35,
                                  child: CommonImage(
                                    'https://www.qishu.org/files/article/image/113/113108/113108s.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start, // 在次轴上底部对齐
                              children: [
                                Text(
                                  "赤心巡天",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 240, 230, 230),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold, // 这里设置为粗体
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "作者：情何以堪",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 240, 230, 230),
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "分类：男生·西幻",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 240, 230, 230),
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            )

                            // 其他内容
                            // ...
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                 Builder(
          builder: (context) => Center(
            child: ElevatedButton(
              child: Text('呼出左侧侧边栏'),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
                  Text('组件 1'),
                  SizedBox(
                    height: 100,
                  ),
                  Text('组件 2'),
                  SizedBox(
                    height: 150,
                  ),
                  Text('组件 3'),
                  // 添加更多组件...
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  padding: EdgeInsets.all(10.0), // 添加内边距
                  child: GridFiction(
                    name: '大家都在看',
                    id: '6',
                    bigclass: 'nansheng',
                  )),
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