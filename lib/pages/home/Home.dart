
import 'package:flutter/material.dart';
import 'package:music/pages/category/Category.dart';
import 'package:music/pages/home/First.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabController;

  List categories = [
    {"id": 0, "name": "精选"},
    {"id": 1, "name": "评书"},
    {"id": 2, "name": "粤语"},
    {"id": 3, "name": "娱乐"},
    {"id": 4, "name": "养生"},
    {"id": 5, "name": "广播剧"},
    {"id": 6, "name": "有声小说"},
    {"id": 7, "name": "孙一"},
    {"id": 8, "name": "田连元"},
    {"id": 9, "name": "单田芳"},
    {"id": 10, "name": "王传林"},
    {"id": 11, "name": "张少佐"},
    {"id": 12, "name": "关永超"},
    {"id": 13, "name": "郭德纲"},
    {"id": 14, "name": "连丽如"},
    {"id": 15, "name": "袁阔成"},
    {"id": 16, "name": "王玥波"},
    {"id": 17, "name": "田战义"},
    {"id": 18, "name": "耽美剧"},
    {"id": 19, "name": "爱情剧"},
    {"id": 20, "name": "现代剧"},
    {"id": 21, "name": "古风剧"},
    {"id": 22, "name": "玄幻"},
    {"id": 23, "name": "历史"},
    {"id": 24, "name": "恐怖"},
    {"id": 25, "name": "都市"},
    {"id": 26, "name": "悬疑"},
    {"id": 27, "name": "言情"},
    {"id": 28, "name": "武侠1"},
    {"id": 29, "name": "武侠"},
    {"id": 30, "name": "文学"},
    {"id": 31, "name": "百家讲坛"},
    {"id": 32, "name": "推理"},
    {"id": 33, "name": "军事"},
    {"id": 34, "name": "职场"},
    {"id": 35, "name": "穿越"},
    {"id": 36, "name": "反腐"},
    {"id": 37, "name": "人物"},
    {"id": 38, "name": "修真"},
    {"id": 39, "name": "网游"},
    {"id": 40, "name": "经济|管理"}
  ];

  @override
  void initState() {
    tabController = new TabController(
      initialIndex: 0,
      length: categories.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffea477e),
        title: TabBar(
          indicatorColor: Color(0xfffcfa43),
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelStyle: TextStyle(
            fontSize: 15,
          ),
          unselectedLabelColor: Colors.white,
          labelColor: Color(0xfffcfa43),
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          controller: tabController,
          isScrollable: true,
          tabs: List.generate(
            categories.length,
            (index) => Text(categories[index]['name']),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/play');
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: List.generate(
          categories.length,
          (index) => index == 0 ? First() : Category(categories[index]),
        ),
      ),
    );
  }
}
