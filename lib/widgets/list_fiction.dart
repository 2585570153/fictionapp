import 'package:fictionapp/entity/fiction.dart';
import 'package:flutter/material.dart';

import '../dao/fiction_dao.dart';
import '../util/c.dart';
import '../util/commom_image.dart';

// ignore: must_be_immutable
class ListFiction extends StatefulWidget {
  int? size;
  int? page;
  String? bigclass;
  String? classify;
  bool slipevent;
  double? padding;

  ListFiction(
      {super.key,
      this.bigclass,
      this.page = 1,
      this.size = 5,
      this.classify,
      this.slipevent = false,
      this.padding=0.0});

  @override
  State<ListFiction> createState() => _ListFictionState();
}

class _ListFictionState extends State<ListFiction>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<FictionItem> items = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMoreDataState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      shrinkWrap: widget.slipevent ? true : false,
      physics: widget.slipevent ? NeverScrollableScrollPhysics() : null,
      itemCount: items.length + 1,
      itemBuilder: (context, index) {
        if (index < items.length) {
          FictionItem item = items[index];
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                padding: EdgeInsets.all(5), // 设置内边距为5

                child: Row(children: <Widget>[
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
                      borderRadius: BorderRadius.circular(5), // 设置图片圆角半径
                      child: Container(
                        height: 100,
                        width: 100 / 1.45,
                        child: CommonImage(
                          item.prcture,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width -
                        C.BOOKSTOREPADDING2 -
                        (100 / 1.45) -
                        (5 * 2) -
                        10-widget.padding!,
                    //-图片宽度-内边距-图片和文本之间的距离-参数传的距离
                    child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween, // 主轴两边
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // 次轴从左向右排列
                        children: [
                          Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween, // 主轴两边分布
                              children: [
                                Container(
                                  width: 200-widget.padding!, // 设置容器的宽度
                                  child: Text(
                                    item.name!,
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: const Color.fromARGB(255, 1, 1, 1),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Text(
                                  '${item.click}' + '读过   ',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 245, 172, 15)),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1, // 限制只显示一行
                                ),
                              ]),
                          Text(
                            item.brief!,
                            style: TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 119, 117, 117),
                              // fontWeight: FontWeight.bold, // 设置字体加粗
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3, // 限制只显示一
                          ),
                          Text(
                            item.author! + '·' + item.classify!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 84, 83, 83),
                              // fontWeight: FontWeight.bold, // 设置字体加粗
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2, // 限制只显示一
                          ),
                        ]),
                  ),
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50, // 设置线的宽度
                height: 1, // 设置线的高度
                color: Color.fromARGB(255, 190, 190, 190)
                    .withOpacity(0.1), // 设置透明度为 0.5 的线的颜色
              )
            ],
          );
        } else {
          if (!isLoading) {
            isLoading = true;
            _loadMoreData();
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<void> _loadMoreDataState() async {
    List<FictionItem>? fetchedFictionList = await getFictionList(context,
        size: widget.size,
        page: widget.page,
        classify: widget.classify,
        bigclass: widget.bigclass);
    setState(() {
      items.addAll(fetchedFictionList);
    });
  }

  Future<void> _loadMoreData() async {
    widget.page = widget.page! + 1;
    List<FictionItem>? fetchedFictionList = await getFictionList(context,
        size: widget.size,
        page: widget.page,
        classify: widget.classify,
        bigclass: widget.bigclass);
    setState(() {
      items.addAll(fetchedFictionList);
      isLoading = false;
    });
  }
}
