import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../dao/chapter_dao.dart';
import '../../entity/chapter.dart';
import '../../routes/global.dart';
import '../../util/c.dart';

// ignore: must_be_immutable
class NovelReaderPage extends StatefulWidget {
  String? chapterId;
  String? fictionId;

  NovelReaderPage({Key? key, this.chapterId, this.fictionId}) : super(key: key);

  @override
  _NovelReaderPageState createState() => _NovelReaderPageState();
}

class _NovelReaderPageState extends State<NovelReaderPage> {

  ScrollController _controller = ScrollController(); //显示滚轮

  ScrollController _scrollController = ScrollController();//小说加载控制器

  ChapterItem items = ChapterItem();
  //显示状态栏
  bool isStackVisible = false;
  //显示设置状态栏
  bool isSettingStack = false;

  //背景边框颜色选择器
  Map<String, dynamic> hasClicked = {};
  //字体大小
  double fontSize = 20;
  //字间距
  double fontHeight = 2.8;
  //字体颜色
  Color fontColor = Color.fromARGB(255, 0, 0, 0);
  //默认背景颜色
  Color customColor = Color.fromARGB(255, 241, 233, 205);
  //默认背景图片颜色
  String customColorImg = "0";

  //控制章节加载的第n章
  List<ChapterItem> itemsChapterList=[];
  bool _isLoadingTop = false;
  bool _isLoadingBottom = false;

  List<ChapterItem> chapterList = [];  // 存储小说文本的内容
  @override
  void initState() {
    super.initState();
    _getContenttxt();
    _loadChapterList();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // 滚动到底部，加载更多数据
        if (!_isLoadingBottom) {
          _loadMoreData(false);
        }
      } else if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        // 滚动到顶部，加载更多数据
        if (!_isLoadingTop) {
          _loadMoreData(true);
        }
      }
    });
  }
  // 模拟加载更多数据的方法
  void _loadMoreData(bool isTop) {
    // 根据 isTop 的值来决定是向上加载还是向下加载
    setState(() {
      if (isTop) {
        _isLoadingTop = true;
        _loadMoreDataContenttxt((int.parse(widget.chapterId!) - 1).toString());
        _isLoadingTop = false;
      } else {
        _isLoadingBottom = true;
        _loadMoreDataContenttxt((int.parse(widget.chapterId!) + 1).toString());
        _isLoadingBottom = false;
      }
    });
    // // 模拟异步加载数据的过程
    // Future.delayed(Duration(seconds: 2), () {
    //   setState(() {
    //     if (isTop) {
    //       // 向上加载，在列表顶部插入新数据
    //       _loadMoreDataContenttxt((int.parse(widget.chapterId!) - 1).toString());
    //       _isLoadingTop = false;
    //     } else {
    //       // 向下加载，在列表底部追加新数据
    //       _loadMoreDataContenttxt((int.parse(widget.chapterId!) + 1).toString());
    //       _isLoadingBottom = false;
    //     }
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: chapterList.length == 0 //判断异步加载是否完成
          ? Center(
              child: CircularProgressIndicator(), // 如果 items 为空，显示加载指示器
            )
          : Drawer(
              child: Container(
                color: Colors.white, // 设置背景颜色为米白色

                child: Scrollbar(
                  controller: _controller,
                  thickness: 8.0, // 设置Scrollbar的宽度
                  radius: Radius.circular(4.0), // 设置Scrollbar的圆角半径
                  child: ListView.builder(
                    itemCount: chapterList.length,
                    itemBuilder: (BuildContext context, int index) {
                      ChapterItem item = chapterList[index];
                      if (index == 0) {
                        // 第一个item作为标题
                        return Column(
                          children: [
                            Container(
                              height: 100.0,
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
                              title: Text(
                                '${item.title}',
                                style: item.chapterId.toString() ==
                                        widget.chapterId
                                    ? TextStyle(color: Colors.blue)
                                    : TextStyle(color: Colors.black),
                              ),
                              onTap: () {
                                Global.router.navigateTo(
                                  context,
                                  "/novel/${item.chapterId}/${item.fictionId}",
                                  replace: true, // 设置replace为true来替换前一个页面
                                  transition: TransitionType.fadeIn,
                                );
                              },
                            ),
                          ],
                        );
                      }

                      return ListTile(
                        title: Text(
                          '${item.title}',
                          style: item.chapterId.toString() == widget.chapterId
                              ? TextStyle(color: Colors.blue)
                              : TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          Global.router.navigateTo(
                            context,
                            "/novel/${item.chapterId}/${item.fictionId}",
                            replace: true, // 设置replace为true来替换前一个页面
                            transition: TransitionType.fadeIn,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
      body: items.content == null //判断异步加载是否完成
          ? Center(
              child: CircularProgressIndicator(), // 如果 items 为空，显示加载指示器
            )
          : GestureDetector(
              onTap: () {
                setState(() {
                  if (isSettingStack) {
                    isSettingStack = !isSettingStack;
                  }
                  isStackVisible = !isStackVisible;
                });
              },
              child: Stack(children: [
                Container(
                  decoration:  BoxDecoration(
                    image:  DecorationImage(
                      image: AssetImage('assets/images/background/$customColorImg.png'),
                      fit: BoxFit.fill,
                    ),
                    color: customColor
                  ),
                  padding: EdgeInsets.only(top: 20.0, left: 13.0, right: 13.0),
                  child: ListView.builder(
                  controller: _scrollController,
                  itemCount: chapterItemId+ 2,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      // 顶部加载状态
                      return _isLoadingTop
                          ? Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                          : SizedBox.shrink();
                    } else if (index == chapterItemId + 1) {
                      // 底部加载状态
                      return _isLoadingBottom
                          ? Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                          : SizedBox.shrink();
                    } else {
                      return Column(
                        children: [
                          Text(
                            textAlign: TextAlign.left,
                            "${items.content}",
                            style: TextStyle(
                                fontSize: fontSize,
                                height: fontHeight, // 行间距
                                color: fontColor
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    }
                      }
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
                                      color: C.STATUSBARFONTCOLOR),
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
                                      color: C.STATUSBARFONTCOLOR,
                                      fontSize: 14),
                                ),
                                Text(
                                  "分享",
                                  style: TextStyle(
                                      color: C.STATUSBARFONTCOLOR,
                                      fontSize: 14),
                                ),
                                Text(
                                  "刷新",
                                  style: TextStyle(
                                      color: C.STATUSBARFONTCOLOR,
                                      fontSize: 14),
                                ),
                                IconButton(
                                  icon: Icon(Icons.menu,
                                      color: C.STATUSBARFONTCOLOR),
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
                                      color: C.STATUSBARFONTCOLOR,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '上一章',
                                    style: TextStyle(
                                        color: C.STATUSBARFONTCOLOR,
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
                                        color: C.STATUSBARFONTCOLOR,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Builder(builder: (context) {
                                    return InkWell(
                                      onTap: () {
                                        Scaffold.of(context).openDrawer();
                                      },
                                      child: Column(
                                        children: [
                                          Icon(Icons.menu,
                                              color: C.STATUSBARFONTCOLOR),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            '目录',
                                            style: TextStyle(
                                                color: C.STATUSBARFONTCOLOR),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.brightness_3,
                                          color: C.STATUSBARFONTCOLOR),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '夜间',
                                        style: TextStyle(
                                            color: C.STATUSBARFONTCOLOR),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.lightbulb_outline,
                                          color: C.STATUSBARFONTCOLOR),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '亮度',
                                        style: TextStyle(
                                            color: C.STATUSBARFONTCOLOR),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.cached,
                                          color: C.STATUSBARFONTCOLOR),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '缓存',
                                        style: TextStyle(
                                            color: C.STATUSBARFONTCOLOR),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isSettingStack = !isSettingStack;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Icon(Icons.settings,
                                            color: C.STATUSBARFONTCOLOR),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '设置',
                                          style: TextStyle(
                                              color: C.STATUSBARFONTCOLOR),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                //设置状态栏
                if (isSettingStack)
                  Positioned(
                      top: null,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 205, // 保持高度为150像素
                          color: const Color.fromARGB(240, 33, 31, 31),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '字体',
                                    style: TextStyle(
                                      color: C.STATUSBARFONTCOLOR,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if (fontSize > 10.0)
                                        // 减少字号大小的逻辑
                                        setState(() {
                                          fontSize -= 1;
                                        });
                                    },
                                    icon: Icon(Icons.remove,
                                        color: C.STATUSBARFONTCOLOR),
                                  ),
                                  Slider(
                                    value: fontSize,
                                    onChanged: (newValue) {
                                      // 更新字号大小的逻辑
                                      setState(() {
                                        fontSize = newValue;
                                      });
                                    },
                                    min: 10, // 最小字号
                                    max: 30, // 最大字号
                                    activeColor:
                                        C.STATUSBARFONTCOLOR, // 设置激活状态的颜色
                                    inactiveColor: Colors.grey, // 设置非激活状态的颜色
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // 增加字号大小的逻辑
                                      if (fontSize < 30.0)
                                        setState(() {
                                          fontSize += 1;
                                        });
                                    },
                                    icon: Icon(Icons.add,
                                        color: C.STATUSBARFONTCOLOR),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '间距',
                                    style: TextStyle(
                                        color: C.STATUSBARFONTCOLOR,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if (fontHeight > 1)
                                        // 减少字号大小的逻辑
                                        setState(() {
                                          fontHeight -= 0.1;
                                        });
                                    },
                                    icon: Icon(Icons.remove,
                                        color: C.STATUSBARFONTCOLOR),
                                  ),
                                  Slider(
                                    value: fontHeight,
                                    onChanged: (newValue) {
                                      // 更新字号大小的逻辑
                                      setState(() {
                                        fontHeight = newValue;
                                      });
                                    },
                                    min: 1.0, // 最小字号
                                    max: 4.0, // 最大字号
                                    activeColor:
                                        C.STATUSBARFONTCOLOR, // 设置激活状态的颜色
                                    inactiveColor: Colors.grey, // 设置非激活状态的颜色
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // 增加字号大小的逻辑
                                      if (fontHeight < 4.0)
                                        setState(() {
                                          fontHeight += 0.1;
                                        });
                                    },
                                    icon: Icon(Icons.add,
                                        color: C.STATUSBARFONTCOLOR),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '背景',
                                    style: TextStyle(
                                        color: C.STATUSBARFONTCOLOR,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        customColor = Colors.green;
                                        fontColor= Colors.black;
                                        customColorImg = "0";
                                        hasClicked["color"] = "1";
                                        //添加一个标志，表示已点击
                                      });
                                    },
                                    child: Container(
                                      width: 20, // 圆形的宽度
                                      height: 20, // 圆形的高度
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle, // 指定为圆形
                                        color: Colors.green, // 设置颜色，这里是绿色
                                        border: hasClicked.isNotEmpty &&
                                                hasClicked["color"] == "1"
                                            ? Border.all(
                                                color: Color.fromARGB(255, 255, 255, 255),
                                                width: 2.0)
                                            : null, // 显示边框如果已点击
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        customColor = Color.fromARGB(255, 241, 233, 205);
                                        fontColor= Colors.black;
                                        customColorImg = "0";
                                        hasClicked["color"] = "2";
                                        //添加一个标志，表示已点击
                                      });
                                    },
                                    child: Container(
                                      width: 20, // 圆形的宽度
                                      height: 20, // 圆形的高度
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle, // 指定为圆形
                                        color: Color.fromARGB(255, 241, 233, 205), // 设置颜色，这里是绿色
                                        border: hasClicked.isNotEmpty &&
                                            hasClicked["color"] == "2"
                                            ? Border.all(
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            width: 2.0)
                                            : null, // 显示边框如果已点击
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        customColor = const Color.fromARGB(255, 0, 0, 0);
                                        fontColor=const Color.fromARGB(255, 229, 226, 226);
                                        customColorImg = "0";
                                        hasClicked["color"] = "3";
                                        //添加一个标志，表示已点击
                                      });
                                    },
                                    child: Container(
                                      width: 20, // 圆形的宽度
                                      height: 20, // 圆形的高度
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle, // 指定为圆形
                                        color: const Color.fromARGB(255, 0, 0, 0), // 设置颜色
                                        border: hasClicked.isNotEmpty &&
                                            hasClicked["color"] == "3"
                                            ? Border.all(
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            width: 2.0)
                                            : null, // 显示边框如果已点击
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '独家',
                                    style: TextStyle(
                                        color: C.STATUSBARFONTCOLOR,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        fontColor=const Color.fromARGB(255, 0, 0, 0);
                                        customColorImg = "2";
                                        hasClicked["color"] = "4";
                                        //添加一个标志，表示已点击
                                      });
                                    },
                                    child: Container(
                                      width: 20, // 圆形的宽度
                                      height: 20, // 圆形的高度
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage('assets/images/background/2.png'), // 替换为您的图片路径
                                          fit: BoxFit.cover, // 适应方式，可以根据需要调整
                                        ),
                                        shape: BoxShape.circle, // 指定为圆形
                                        color: const Color.fromARGB(255, 0, 0, 0), // 设置颜色
                                        border: hasClicked.isNotEmpty &&
                                            hasClicked["color"] == "4"
                                            ? Border.all(
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            width: 2.0)
                                            : null, // 显示边框如果已点击
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        fontColor=const Color.fromARGB(255, 255, 255, 255);
                                        customColorImg = "1";
                                        hasClicked["color"] = "5";
                                        //添加一个标志，表示已点击
                                      });
                                    },
                                    child: Container(
                                      width: 20, // 圆形的宽度
                                      height: 20, // 圆形的高度
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage('assets/images/background/1.png'), // 替换为您的图片路径
                                          fit: BoxFit.fitWidth, // 适应方式，可以根据需要调整
                                        ),
                                        shape: BoxShape.circle, // 指定为圆形
                                        color: const Color.fromARGB(255, 0, 0, 0), // 设置颜色
                                        border: hasClicked.isNotEmpty &&
                                            hasClicked["color"] == "5"
                                            ? Border.all(
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            width: 2.0)
                                            : null, // 显示边框如果已点击
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '翻页方式',
                                    style: TextStyle(
                                        color: C.STATUSBARFONTCOLOR,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '默认上下翻页，后期更新',
                                    style: TextStyle(
                                        color: C.STATUSBARFONTCOLOR,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      )),
              ]),
            ),
    );
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  //发送章节内存
  Future<void> _getContenttxt() async {
    ChapterItem contenttxt = await getContenttxt(context, id: widget.chapterId);
    setState(() {
      items = contenttxt;
    });
  }

  //章节内容
  Future<void> _loadChapterList() async {
    List<ChapterItem> fictionChapterList =
        await getFictionChapter(context, id: widget.fictionId);
    setState(() {
      chapterList = fictionChapterList;
    });
  }

  //加载上下一章
  Future<void> _loadMoreDataContenttxt(String id) async {
    ChapterItem contenttxt = await getContenttxt(context, id: id);
    setState(() {
      items = contenttxt;
      widget.chapterId=id;
    });
  }
}
