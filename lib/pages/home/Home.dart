
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
    {"id": 6, "name": "有声小说"},
    {"id": 5, "name": "广播剧"},
    {"id": 4, "name": "养生"},
    {"id": 3, "name": "娱乐"},
    {"id": 2, "name": "粤语"},
    {"id": 1, "name": "评书"},
    {"id": 31, "name": "百家讲坛"},
    {"id": 50, "name": "都市言情"},
    {"id": 49, "name": "通俗文学"},
    {"id": 48, "name": "玄幻奇幻"},
    {"id": 47, "name": "灵异惊悚"},
    {"id": 46, "name": "游戏竞技"},
    {"id": 45, "name": "幽默笑话"},
    {"id": 44, "name": "官场商战"},
    {"id": 43, "name": "历史军事"},
    {"id": 42, "name": "刑侦推理"},
    {"id": 40, "name": "经济|管理"},
    {"id": 41, "name": "其他类型"}
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
        elevation: 0.0,
        bottomOpacity: 0.0,
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
