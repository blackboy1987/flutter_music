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
    '精选',
    '盗墓探险',
    '百家讲坛',
    '官场刑侦',
    '网络玄幻',
    '历史军事',
    '人物传记',
    '儿童读物',
    '恐怖悬疑',
    '评书',
    '都市言情',
    '职场商战',
    '传统武侠',
    '相声戏曲',
    '有声文学',
  ];

  @override
  void initState() {
    tabController = new TabController(
      initialIndex: 4,
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
            (index) => Text(categories[index]),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: List.generate(
          categories.length,
          (index) => index == 0 ? First() : Category(),
        ),
      ),
    );
  }
}
