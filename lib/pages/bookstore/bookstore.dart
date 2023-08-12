import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
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
        title: Text('书城'),
       centerTitle: true,
      ),
        body: Center(
        child: Column(
          children: [
            Container(
              height: 160,
              child: Swiper(
                itemCount: _imagesUrls.length,
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    _imagesUrls[index],
                    fit: BoxFit.fill,
                  );
                },
                pagination: SwiperPagination(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
