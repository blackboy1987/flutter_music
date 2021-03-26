import 'dart:async';

import 'package:flutter/material.dart';

class MyLoading extends StatefulWidget {
  // 间隔时间 毫秒单位
  final int duration;
  // 大小
  final double size;

  MyLoading({Key key, this.duration, this.size}) : super(key: key);

  @override
  _MyLoadingState createState() => _MyLoadingState(duration, size);
}

class _MyLoadingState extends State<MyLoading> {
  // 间隔时间 毫秒单位
  int duration = 80;
  // 大小
  double size = 60;
  _MyLoadingState(duration, size);

  List images = [
    "assets/images/refresh_loading01.png",
    "assets/images/refresh_loading02.png",
    "assets/images/refresh_loading03.png",
    "assets/images/refresh_loading04.png",
    "assets/images/refresh_loading05.png",
    "assets/images/refresh_loading06.png",
    "assets/images/refresh_loading07.png",
    "assets/images/refresh_loading08.png",
    "assets/images/refresh_loading09.png",
    "assets/images/refresh_loading10.png",
    "assets/images/refresh_loading11.png",
    "assets/images/refresh_loading12.png",
  ];
  int _index = 0;
  Timer timer;

  @override
  void initState() {
    start();
    super.initState();
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
    }
    super.dispose();
  }

  void start() {
    int count = 0;
    Timer.periodic(Duration(milliseconds: this.duration), (Timer timer) {
      timer = timer;
      count++;
      setState(() {
        _index = count % images.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(images[_index], width: this.size, height: this.size),
    );
  }
}
