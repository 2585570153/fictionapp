import 'package:fictionapp/widgets/commom_image.dart';
import 'package:flutter/material.dart';

import '../entity/recommend_data.dart';

class HomeRecommend extends StatelessWidget {
  final List<RecommendItem> dataList;
  const HomeRecommend({super.key, this.dataList = recommendData});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.only(
        top: 10.0,
      )),
      Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: dataList
              .map((item) => GestureDetector(
                  onTap: () {
                    print('点击了');
                  },
                  child: Container(
                    
                    padding: EdgeInsets.all(5.0), // 设置内边距为5像素
                    decoration:
                        BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Color.fromARGB(255, 251, 137, 15)
                          ),
                    width: (MediaQuery.of(context).size.width - 40) / 2,
                    height: 100.0,
                    child: Row(children: <Widget>[
                      CommonImage(
                        item.imageUrl,
                        width: 50,
                      ),
                      Padding(padding: EdgeInsets.only(left: 10.0)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item.title!,
                            style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold,),
                          ),
                          //文字上线边距
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Container(
                            //宽度计算：内边距 图片宽度 图片和文字的间距
                            width: ((MediaQuery.of(context).size.width - 40) / 2)-10-50-10,
                            child: Text(
                              item.Content!,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                              softWrap: true,
                            ),
                          )
                        ],
                      )
                    ]),
                  )))
              .toList()),
    ]));
  }
}
