import 'package:fictionapp/dao/fiction_dao.dart';
import 'package:fictionapp/entity/fiction.dart';
import 'package:fictionapp/widgets/commom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GridFiction extends StatefulWidget {
  final String? name;
  final String? id;
  final String? bigclass;

  const GridFiction({super.key, this.name, this.id, this.bigclass});

  @override
  State<GridFiction> createState() => _GridFictionState();
}

class _GridFictionState extends State<GridFiction> {
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
    return Container(
        child: Column(
      children: <Widget>[
        SizedBox(height: 15.0),
        Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.name!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
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
                    ),
                  ),
                ),
              ]),
        ),
        SizedBox(height: 15.0),
        _isLoading
            ? Center(
                child: CircularProgressIndicator(), // 加载中指示器
              )
            : ShrinkWrappingViewport(
                offset: ViewportOffset.zero(),
                slivers: <Widget>[
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        FictionItem item = recommendations![index];
                        return Container(
                            child: Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(10), // 设置图片圆角半径
                              child: Container(
                                height: ((MediaQuery.of(context).size.width -
                                            30 -
                                            20) /
                                        3) *
                                    1.4,
                                width: (MediaQuery.of(context).size.width -
                                        30 -
                                        20) /
                                    3,
                                child: CommonImage(
                                  item.prcture,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              item.name!,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 1, 1, 1)),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1, // 限制只显示一行
                            )
                          ],
                        ));
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
