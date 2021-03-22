import 'package:flutter/material.dart';
import 'package:music/component/swiper_component.dart';
import 'package:music/pages/home/CenterCategory.dart';
import 'package:music/pages/home/Channel.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 180,
            child: SwiperComponent(),
          ),
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CenterCategory(
                Icons.ac_unit,
                bgColor: Color(0xffb69ef4),
                title: '免费专区',
              ),
              CenterCategory(
                Icons.ac_unit,
                bgColor: Color(0xff6ac5fa),
                title: '完本精品',
              ),
              CenterCategory(
                Icons.ac_unit,
                bgColor: Color(0xfff5d34d),
                title: '女频精选',
              ),
              CenterCategory(
                Icons.ac_unit,
                bgColor: Color(0xff7be6d4),
                title: '男频热门',
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Channel(),
          )
        ],
      ),
    );
  }
}
