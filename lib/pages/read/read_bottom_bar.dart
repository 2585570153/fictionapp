import 'package:flutter/material.dart';

class ReadBottomBar extends StatefulWidget {
  const ReadBottomBar({Key? key}) : super(key: key);

  @override
  State<ReadBottomBar> createState() => _ReadBottomBarState();
}

class _ReadBottomBarState extends State<ReadBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                // 处理导航项点击事件
                // 您可以根据需要执行操作
              },
              child: Text(
                '加入书架',
                style: TextStyle(
                  color: Colors.blue,

                ),
              ),
            ),
          ),
          Container(
            width: 130,
            color: Colors.blue,
            child: Expanded(
              
              child: TextButton(
                onPressed: () {
                  // 处理导航项点击事件
                  // 您可以根据需要执行操作
                },
                child: Text(
                  '免费阅读',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 252, 252, 253),

                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                // 处理导航项点击事件
                // 您可以根据需要执行操作
              },
              child: Text(
                '缓存',
                style: TextStyle(
                  color: Colors.blue,

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
