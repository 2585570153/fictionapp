import 'package:flutter/material.dart';

import '../../dao/chapter_dao.dart';
import '../../entity/chapter.dart';

class NovelReaderPage extends StatefulWidget {
  String? id;

  NovelReaderPage({Key? key, this.id}) : super(key: key);

  @override
  _NovelReaderPageState createState() => _NovelReaderPageState();
}

class _NovelReaderPageState extends State<NovelReaderPage> {
  ChapterItem items = ChapterItem(); // 存储小说文本的内容
  bool isStackVisible = false;
  @override
  void initState() {
    super.initState();
    _getContenttxt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items.content == null //判断异步加载是否完成
          ? Center(
              child: CircularProgressIndicator(), // 如果 items 为空，显示加载指示器
            )
          : GestureDetector(
              onTap: () {
                setState(() {
                  isStackVisible = !isStackVisible;
                });
              },
              child: Stack(children: [
                Container(
                  color: Color.fromARGB(255, 241, 233, 205),
                  padding: EdgeInsets.only(top: 20.0, left: 16.0, right: 13.0),
                  child: SingleChildScrollView(
                    // 使用SingleChildScrollView允许文本超出屏幕高度时可以滚动
                    child: Text(
                      textAlign: TextAlign.justify,
                      "${items.content}",
                      style: TextStyle(
                        fontSize: 20.0,
                        height: 2.8, // 行间距
                      ),
                    ),
                  ),
                ),
                //顶部状态栏
                if (isStackVisible)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: null,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 110, // 保持高度为150像素
                        color: const Color.fromARGB(240, 33, 31, 31),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.arrow_back,
                                      color:
                                          Color.fromARGB(255, 207, 207, 207)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Text(
                                  "反馈",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 207, 207, 207),
                                      fontSize: 14),
                                ),
                                Text(
                                  "分享",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 207, 207, 207),
                                      fontSize: 14),
                                ),
                                Text(
                                  "刷新",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 207, 207, 207),
                                      fontSize: 14),
                                ),
                                IconButton(
                                  icon: Icon(Icons.menu,
                                      color:
                                          Color.fromARGB(255, 207, 207, 207)),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "内容由书友整理，校队并上传，如有疑问请反馈我们",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 207, 207, 207),
                                      fontSize: 13),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                //底部状态栏
                if (isStackVisible)
                  Positioned(
                      top: null,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 110, // 保持高度为150像素
                          color: const Color.fromARGB(240, 33, 31, 31),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '上一章',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 207, 207, 207),
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 200,
                                    child: LinearProgressIndicator(
                                      value: 0.7, // 设置进度值，取值范围为0.0到1.0
                                      minHeight: 5, // 设置进度条的高度，这里是10像素
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          const Color.fromARGB(255, 207, 207,
                                              207)), // 设置进度条的颜色为蓝色
                                      backgroundColor: Color.fromARGB(
                                          255, 137, 134, 134), // 设置进度条的背景颜色
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '下一章',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 207, 207, 207),
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Icon(Icons.menu,
                                          color: Color.fromARGB(
                                              255, 207, 207, 207)),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '目录',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 207, 207, 207)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.brightness_3,
                                          color: Color.fromARGB(
                                              255, 207, 207, 207)),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '夜间',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 207, 207, 207)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.lightbulb_outline,
                                          color: Color.fromARGB(
                                              255, 207, 207, 207)),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '亮度',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 207, 207, 207)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.cached,
                                          color: Color.fromARGB(
                                              255, 207, 207, 207)),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '缓存',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 207, 207, 207)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.settings,
                                          color: Color.fromARGB(
                                              255, 207, 207, 207)),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '设置',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 207, 207, 207)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
              ]),
            ),
    );
  }

  //发送章节内存
  Future<void> _getContenttxt() async {
    ChapterItem contenttxt = await getContenttxt(context, id: widget.id);
    setState(() {
      items = contenttxt;
    });
  }
}
