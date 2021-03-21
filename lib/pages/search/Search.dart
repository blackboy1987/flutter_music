import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: Color(0xffededed),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                Icons.search,
                color: Color(0xffbebebe),
              ),
              hintText: '搜索',
            ),
            textInputAction: TextInputAction.search,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              '取消',
              style: TextStyle(
                color: Color(0xff515151),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
