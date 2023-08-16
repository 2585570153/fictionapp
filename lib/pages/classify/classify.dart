import 'package:flutter/material.dart';

import '../../util/c.dart';
import '../../widgets/list_fiction.dart';

class Classify extends StatefulWidget {
  const Classify({super.key});

  @override
  State<Classify> createState() => _ClassifyState();
}

class _ClassifyState extends State<Classify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("分类"),
        ),
        body: SafeArea(
          minimum: EdgeInsets.all(C.BOOKSTOREPADDING),
          child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 247, 245, 245),
                borderRadius: BorderRadius.circular(10), // 设置圆角半径
              ),
              child: ListFiction(
                classify: '',
                bigclass: 'nansheng',
              )),
        ));
  }
}
