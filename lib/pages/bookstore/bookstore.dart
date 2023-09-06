import 'package:fictionapp/util/common_image.dart';
import 'package:fictionapp/widgets/grid_fiction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../util/c.dart';
import '../../widgets/list_fiction.dart';
import 'bookstore_recommend.dart';

class BookStore extends StatefulWidget {
  const BookStore({super.key});

  @override
  State<BookStore> createState() => _BookStoreState();
}

class _BookStoreState extends State<BookStore> {
  List _imagesUrls = [
    'http://cloud.aiheadn.cn/fiction/1.jpg',
    'http://cloud.aiheadn.cn/fiction/2.jpg',
    'http://cloud.aiheadn.cn/fiction/3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('书城',
         style: TextStyle(
            color: Colors.black, // 设置标题颜色为黑色
            fontSize: 18,
            fontWeight: FontWeight.bold, // 设置加粗字体
            decoration:
                TextDecoration.combine([TextDecoration.underline]), // 添加下划线样式
            decorationColor: Colors.blue.withOpacity(0.5), // 设置下划线颜色和透明度
            decorationThickness: 4, // 设置下划线粗细
          ),),
       centerTitle: true, // 将标题居中
        backgroundColor: C.STATUSBAR, // 设置背景颜色为白色
        elevation: 0, // 取消阴影
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0), // 设置下划线高度
          child: Container(
            color: Color.fromARGB(255, 223, 223, 223), // 自定义下划线颜色
            height: 1.0,
          ),
        ),

      ),
      body: SafeArea(
        minimum: EdgeInsets.all(C.BOOKSTOREPADDING),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 160,
              child: Swiper(
                itemCount: _imagesUrls.length,
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  //AspectRatio 设置轮播图根据指定的宽高比例自动调整其子部件的尺寸
                  //ClipRRect 设置圆角
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: CommonImage(
                            _imagesUrls[index],
                            fit: BoxFit.fill,
                          )));
                },
                pagination: SwiperPagination(),
              ),
            ),
            Container(child: HomeRecommend()),
            SizedBox(height: 10.0),
            Container(
                child: GridFiction(
              name: '男生推荐',
              id: '6',
              bigclass: 'nansheng',
            )),
            SizedBox(height: 10.0),
            Container(
                child: GridFiction(
              name: '女生推荐',
              id: '6',
              bigclass: 'nvsheng',
            )),
            SizedBox(height: 10.0),
            Container(
                child: GridFiction(
              name: '出版推荐',
              id: '6',
              bigclass: 'chuban',
            )),
            SizedBox(height: 10.0),
             Container(
              padding: EdgeInsets.all(10), // 设置内边距
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 247, 245, 245),
                borderRadius: BorderRadius.circular(10), // 设置圆角半径
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // 设置主轴从上到下排列
                children: [
                   SizedBox(height: 5.0),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                          child: Text(
                            '猜你喜欢',
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
                  ListFiction(
                    classify: '',
                    bigclass: 'nansheng',
                    slipevent: true,
                    padding: 20,
                  ),
                ],
              )),
          ],
        ),
      ),
    );
  }
}
