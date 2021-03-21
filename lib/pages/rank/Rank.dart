import 'package:flutter/material.dart';

class Rank extends StatefulWidget {
  Rank({Key key}) : super(key: key);

  @override
  _RankState createState() => _RankState();
}

class _RankState extends State<Rank> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text('_RankState'),
    );
  }
}
