import 'dart:ui';

import 'package:fictionapp/pages/read/read_bottom_bar.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../dao/chapter_dao.dart';
import '../../dao/fiction_dao.dart';
import '../../entity/chapter.dart';
import '../../entity/fiction.dart';
import '../../routes/global.dart';
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
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  // 在构造函数中接收 id 参数

  final ScrollController _controller = ScrollController(); //显示滚轮
  FictionItem items = FictionItem(); // 存储小说数据的对象
  List<ChapterItem> chapterList = [];
  @override
  void initState() {
    super.initState();
    _loadMoreDataState();
    _loadChapterList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: C.STATUSBAR, // 设置背景颜色为白色
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
                                title: Text('${item.title}'),
                                onTap: () {
                                  Global.router.navigateTo(
                                    context,
                                    "/novel/${item.chapterId}/${item.fictionId}",
                                    transition: TransitionType.inFromRight,
                                  );
                                },
                              ),
                            ],
                          );
                        }

                        return ListTile(
                          title: Text('${item.title}'),
                          onTap: () {
                            Global.router.navigateTo(
                              context,
                              "/novel/${item.chapterId}/${item.fictionId}",
                              transition: TransitionType.inFromRight,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
        body: items.fictionId == null //判断异步加载是否完成
            ? Center(
                child: CircularProgressIndicator(), // 如果 items 为空，显示加载指示器
              )
            : CustomScrollView(
                slivers: <Widget>[
                  //导航
                  SliverAppBar(
                    expandedHeight: 210, // 导航栏展开时的高度
                    floating: true, // 设置为false，初始状态下标题不会显示
                    pinned: true, // 设置为true，下滑时显示标题
                    title: Text('书籍详细'),
                    centerTitle: true, // 让标题居中显示
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back), // 返回箭头图标
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          // 毛玻璃效果背景
                          CommonImage(
                            items.prcture, // 你的背景图片地址
                            fit: BoxFit.cover,
                          ),
                          // 毛玻璃滤镜
                          BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: 10, sigmaY: 10), // 毛玻璃效果参数
                            child: Container(
                                color:
                                    Colors.black.withOpacity(0.5)), // 背景颜色及透明度
                          ),
                          Column(
                            mainAxisAlignment:
                                MainAxisAlignment.start, // 在主轴上开始
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
                                          items.prcture,
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
                                        items.name!,
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 240, 230, 230),
                                          fontSize: 17,
                                          fontWeight:
                                              FontWeight.bold, // 这里设置为粗体
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        items.author!,
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
                                        "分类：${items.bigclass}·${items.classify}",
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
                  //收藏
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.only(top: 15.0), // 仅设置上边距
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(width: 8.0), // 添加间距
                          Text(
                            "${items.click}",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '人读过',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(width: 10.0), // 添加间距
                          Container(
                            width: 1.0,
                            height: 20.0,
                            color: Colors.grey, // 淡灰色线
                          ),
                          SizedBox(width: 10.0), // 添加间距
                          Text(
                            "${items.collect}",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '人收藏',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(width: 8.0), // 添加间距
                        ],
                      ),
                    ),
                  ),
                  //介绍
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 15.0, left: 15.0, right: 15.0), // 仅设置上边距
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 0.2,
                            color: const Color.fromARGB(
                                255, 228, 225, 225), // 淡灰色线
                          ),
                          SizedBox(height: 8.0),
                          _isExpanded
                              ? Text(
                                  items.brief!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.5,
                                  ),
                                )
                              : Text(
                                  items.brief!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.5,
                                  ),
                                  maxLines: 3, // 设置最大行数为3
                                  overflow: TextOverflow.ellipsis, // 超出部分使用省略号
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end, // 将按钮置于右侧
                            children: [
                              TextButton(
                                onPressed: _toggleExpansion,
                                child: Text(_isExpanded ? '收回' : '展开',
                                    style: TextStyle(fontSize: 16)), // 设置按钮文本样式
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //目录
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 0.2,
                          color:
                              const Color.fromARGB(255, 228, 225, 225), // 淡灰色线
                        ),
                        Builder(builder: (context) {
                          return InkWell(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 15.0,
                                  left: 20.0,
                                  right: 20.0), // 设置上边距和水平边距
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        '目录',
                                        style: TextStyle(
                                          color: Colors.black, // 设置标题颜色为黑色
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold, // 设置加粗字体
                                          decoration: TextDecoration.combine([
                                            TextDecoration.underline
                                          ]), // 添加下划线样式
                                          decorationColor: Colors.blue
                                              .withOpacity(0.5), // 设置下划线颜色和透明度
                                          decorationThickness: 4, // 设置下划线粗细
                                        ),
                                      ),
                                      Text('点击查看详细章节',
                                          style: TextStyle(
                                            color: const Color.fromARGB(255,
                                                170, 170, 170), // 设置标题颜色为黑色
                                            fontSize: 12,
                                          )),
                                      Icon(
                                        Icons.chevron_right,
                                        size: 20.0,
                                        color: const Color.fromARGB(
                                            255, 192, 190, 190),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  //书评
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 0.2,
                          color:
                              const Color.fromARGB(255, 228, 225, 225), // 淡灰色线
                        ),
                        InkWell(
                          onTap: () {
                            // 处理点击事件，可以在此处添加导航逻辑或其他操作
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 15.0,
                                left: 20.0,
                                right: 20.0), // 设置上边距和水平边距
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      '书评',
                                      style: TextStyle(
                                        color: Colors.black, // 设置标题颜色为黑色
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold, // 设置加粗字体
                                        decoration: TextDecoration.combine([
                                          TextDecoration.underline
                                        ]), // 添加下划线样式
                                        decorationColor: Colors.blue
                                            .withOpacity(0.5), // 设置下划线颜色和透明度
                                        decorationThickness: 4, // 设置下划线粗细
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      size: 20.0,
                                      color: const Color.fromARGB(
                                          255, 192, 190, 190),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 320,
                          height: 0.2,
                          color: Color.fromARGB(255, 176, 172, 172), // 淡灰色线
                        ),
                      ],
                    ),
                  ),
                  //更多喜欢
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
        bottomNavigationBar: chapterList.length == 0 //判断异步加载是否完成
            ? Center(
                child: CircularProgressIndicator(), // 如果 items 为空，显示加载指示器
              )
            : ReadBottomBar(chapterList[0]));
  }

  //发送请求
  Future<void> _loadMoreDataState() async {
    FictionItem fictionItem = await getFictionId(context, id: widget.id);
    setState(() {
      items = fictionItem;
    });
  }

  //章节内容
  Future<void> _loadChapterList() async {
    List<ChapterItem> fictionChapterList =
        await getFictionChapter(context, id: widget.id);
    setState(() {
      chapterList = fictionChapterList;
    });
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
