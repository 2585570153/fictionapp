import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../../routes/global.dart';
import '../../util/app_shared_preferences.dart';
import '../../util/c.dart';
import 'classify_list.dart';

class Classify extends StatefulWidget {
  const Classify({Key? key}) : super(key: key);

  @override
  State<Classify> createState() => _ClassifyState();
}

class _ClassifyState extends State<Classify> {
  @override
  void initState() {
    super.initState();
  }

  List<String> tabTitles = AppSharedPreferences.getStringList('classify_list',
      defaultValue: [
        'nansheng',
        '全部',
        '玄幻',
        '都市',
        '军事',
        '游戏',
        '仙侠',
        '历史',
        '武侠',
        '科幻',
        '悬疑'
      ]);

  List<String> nanshengtabTitles = [
    'nansheng',
    '全部',
    '玄幻',
    '都市',
    '军事',
    '游戏',
    '仙侠',
    '历史',
    '武侠',
    '科幻',
    '悬疑'
  ];
  List<String> nvshengtabTitles = [
    'nvsheng',
    '全部',
    '悬疑侦探',
    '现代言情',
    '古代言情',
    '游戏竞技',
    '科幻空间',
    '仙侠奇缘',
  ];
  List<String> chubantabTitles = [
    'chuban',
    '全部',
    '青春',
    '法律',
    '传记',
    '小说',
    '文学',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabTitles.length - 1, // 设置标签数量
        child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    // 处理搜索按钮点击事件
                  },
                ),
              ],
              title: Text(
                "分类",
                style: TextStyle(
                  color: Colors.black, // 设置标题颜色为黑色
                  fontSize: 18,
                  fontWeight: FontWeight.bold, // 设置加粗字体
                  decoration: TextDecoration.combine(
                      [TextDecoration.underline]), // 添加下划线样式
                  decorationColor: Colors.blue.withOpacity(0.5), // 设置下划线颜色和透明度
                  decorationThickness: 4, // 设置下划线粗细
                ),
              ),
              leading: PopupMenuButton<String>(
                icon: Icon(
                  Icons.menu,
                  color: Colors.grey,
                ),
                onSelected: (value) {
                  if (value == 'nvsheng') {
                    setState(() {
                      AppSharedPreferences.setStringList(
                          'classify_list', nvshengtabTitles);
                      Global.router.navigateTo(
                        context,
                        "/chassify",
                         clearStack: true,
                        transition: TransitionType.fadeIn,
                      ); // 按钮点击逻辑
                    });
                  }
                  if (value == 'nansheng') {
                    setState(() {
                      AppSharedPreferences.setStringList(
                          'classify_list', nanshengtabTitles);
                      Global.router.navigateTo(
                        context,
                        "/chassify",
                        clearStack: true,
                        transition: TransitionType.fadeIn,
                      ); // 按钮点击逻辑
                    });
                  }
                  if (value == 'chuban') {
                    setState(() {
                      AppSharedPreferences.setStringList(
                          'classify_list', chubantabTitles);
                      Global.router.navigateTo(
                        context,
                        "/chassify",
                        clearStack: true,
                        transition: TransitionType.fadeIn,
                      ); // 按钮点击逻辑
                    });
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'nansheng',
                    child: Text('男生'),
                  ),
                  PopupMenuItem<String>(
                    value: 'nvsheng',
                    child: Text('女生'),
                  ),
                  PopupMenuItem<String>(
                    value: 'chuban',
                    child: Text('出版'),
                  ),
                ],
                offset: Offset(0, 50), // 调整向下偏移量
              ),
              centerTitle: true, // 将标题居中
              backgroundColor: C.STATUSBAR, // 设置背景颜色为白色
              elevation: 0, // 取消阴影

              bottom: TabBar(
                isScrollable: true, // 允许选项卡横向滚动
                indicator: UnderlineTabIndicator(
                  borderSide:
                      BorderSide(width: 4.0, color: Colors.blue), // 下划线的宽度和颜色
                  insets: EdgeInsets.symmetric(horizontal: 15.0), // 下划线的水平间距
                ),
                tabs: List.generate(tabTitles.length - 1, (index) {
                  return Tab(
                    child: Text(
                      tabTitles[index + 1],
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  );
                }),
              ),
            ),
            body: TabBarView(
              //构建长度方法 所以-1 保证列表的第一个出参
              children: List.generate(tabTitles.length - 1, (index) {
                if (index == 0) {
                  return ClassifyList(bigclass: tabTitles[0]);
                }
                return ClassifyList(
                    bigclass: tabTitles[0], classify: tabTitles[index + 1]);
              }),
            )));
  }
}
