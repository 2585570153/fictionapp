import 'package:flutter/material.dart';

import '../../util/c.dart';
import '../../widgets/list_fiction.dart';

class ClassifyList extends StatelessWidget {
  String? classify;
  String? bigclass;

  ClassifyList({super.key,this.classify='', this.bigclass=''});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(C.BOOKSTOREPADDING),
      child: Container(
          decoration: BoxDecoration(
            color: C.STATUSBAR,
            borderRadius: BorderRadius.circular(10), // 设置圆角半径
          ),
          child: ListFiction(
            classify: classify,
            bigclass: bigclass,
          )),
    );
  }
}
