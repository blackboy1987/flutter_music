import 'package:flutter/material.dart';
import 'package:music/pages/components/Item.dart';

class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 1.0,
        color: Color(0xffc1c1c1),
      ),
      itemBuilder: (BuildContext context, int index) {
        return Item();
      },
    );
  }
}
