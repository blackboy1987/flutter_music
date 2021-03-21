import 'package:flutter/material.dart';
import 'package:music/pages/collect/Collect.dart';
import 'package:music/pages/home/Home.dart';
import 'package:music/pages/me/Me.dart';
import 'package:music/pages/rank/Rank.dart';

class Index extends StatefulWidget {
  Index({Key key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

  int _currentIndex = 0;
  List pages = [
    Home(),
    Rank(),
    Collect(),
    Me(),
  ];

  @override
  void initState() {
    setState(() {
      _currentIndex = 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          selectedItemColor: Color(0xffea477e),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '收藏',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '排行',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: '我的',
            ),
          ],
        ),
    );
  }
}
