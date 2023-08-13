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
                    decoration: BoxDecoration(color: Colors.red),
                    width: (MediaQuery.of(context).size.width - 34) / 2,
                    height: 100.0,
                    child: Row(children: <Widget>[
                      CommonImage(item.imageUrl,width: 50,),
                      Column(children: <Widget>[
                        Text(
                          item.title!,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          item.Content!,
                          style: TextStyle(color: Colors.white),
                          
                        ),
                      ],)
                    ]),
                  )))
              .toList()),
    ]));
  }
}
