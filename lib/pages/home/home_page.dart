import 'package:fictionapp/pages/classify/classify.dart';
import 'package:fictionapp/widgets/page_content.dart';
import 'package:flutter/material.dart';

import '../bookstore/bookstore.dart';

List<Widget> tabVuewList = [
  BookStore(),
  PageContent(name: '书架'),
  Classify(),
  PageContent(name: '我的'),
];
List<BottomNavigationBarItem> barItemList = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: '书城',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.book),
    label: '书架',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.category),
    label: '分类',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: '我的',
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 跳转页面
      body: tabVuewList[_selectedIndex],
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        items: barItemList,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: true, // 显示未选中项的文字
      ),
    );
  }
}
