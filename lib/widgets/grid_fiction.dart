import 'package:fictionapp/dao/fiction_dao.dart';
import 'package:fictionapp/entity/fiction.dart';
import 'package:fictionapp/util/common_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../routes/global.dart';
import '../util/c.dart';

class GridFiction extends StatefulWidget {
  final String? name;
  final String? id;
  final String? bigclass;

  const GridFiction({super.key, this.name, this.id, this.bigclass});

  @override
  State<GridFiction> createState() => _GridFictionState();
}

class _GridFictionState extends State<GridFiction>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<FictionItem>? recommendations;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getRecommendRandom();
  }

  Future<void> _getRecommendRandom() async {
    List<FictionItem>? fetchedRecommendations =
        await getRecommendRandom(widget.id!, widget.bigclass!, context);
    setState(() {
      if (!(fetchedRecommendations == null || fetchedRecommendations == "")) {
        recommendations = fetchedRecommendations;
        _isLoading = false; // 请求完成后设置
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        padding: EdgeInsets.all(10), // 设置内边距
        decoration: BoxDecoration(
          color: C.STATUSBAR,
          borderRadius: BorderRadius.circular(10), // 设置圆角半径
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 设置主轴从上到下排列
          children: <Widget>[
            SizedBox(height: 5.0),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                          child: Text(
                            widget.name!,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 4), // 添加一些间距
                        Container(
                          height: 3, // 下划线的高度
                          width: 60,
                          color: Colors.blue, // 下划线的颜色
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        // 在这里添加点击事件处理逻辑
                        print("更多被点击了！");
                        // 你可以在这里执行导航操作、调用函数等
                      }, // 点击事件处理函数
                      child: Text(
                        "更多",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 167, 165, 160)),
                      ),
                    ),
                  ]),
            ),
            SizedBox(height: 15.0),
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ShrinkWrappingViewport(
                    offset: ViewportOffset.zero(),
                    slivers: <Widget>[
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            FictionItem item = recommendations![index];
                            return GestureDetector(
                              onTap: () {
                                Global.router.navigateTo(
                                  context,
                                  "/read/${item.fictionId}",
                                  transition: TransitionType.inFromRight,
                                );
                                // 在这里添加您的跳转逻辑，比如导航到另一个页面
                              },
                              child: Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(10), // 设置图片圆角半径
                                    child: Container(
                                      height:
                                          ((MediaQuery.of(context).size.width -
                                                      60 -
                                                      C.BOOKSTOREPADDING2) /
                                                  3) *
                                              1.4,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  20 -
                                                  C.BOOKSTOREPADDING2) /
                                              3,
                                      child: CommonImage(
                                        item.prcture,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    item.name!,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            const Color.fromARGB(255, 1, 1, 1)),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1, // 限制只显示一行
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    '${item.click!}人读过',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color:
                                            Color.fromARGB(255, 245, 172, 15)),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1, // 限制只显示一行
                                  )
                                ],
                              )),
                            );
                          },
                          childCount: 6, // 3 列 * 2 行 = 6 个项目
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 列数
                          mainAxisSpacing: 10.0, // 垂直间距
                          crossAxisSpacing: 10.0, // 水平间距
                          childAspectRatio: 0.55, // 宽高比
                        ),
                      ),
                    ],
                  )
          ],
        ));
  }
}
