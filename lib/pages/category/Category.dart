import 'package:flutter/material.dart';
import 'package:music/pages/components/Item.dart';
import 'package:dio/dio.dart';

class Category extends StatefulWidget {

  var data;

  Category(this.data,{Key key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int page = 1;
  List data = [];
  ScrollController _scrollController = ScrollController();



  void getList(int page) {
    try {
      Dio().get("http://172.16.12.223:9000/init/list",queryParameters: {
        "categoryId":widget.data["id"],
        "page":page
      }).then((response){
        setState(() {
          if(page==1){
            data = response.data["data"];
          }else{
            data.addAll(response.data["data"]);
          }

        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    setState(() {
      page=1;
    });
    getList(1);
    _scrollController.addListener(() {
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        page++;
        getList(page);
      }
    });
    super.initState();
  }

  Future<Null> _onRefresh() async {
    setState(() {
      page = 1;
    });
    getList(1);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.separated(
        itemCount: data.length,
        controller: _scrollController,
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 1.0,
          color: Color(0xffc1c1c1),
        ),
        itemBuilder: (BuildContext context, int index) {
          return Item(data[index]);
        },
      ),
    );
  }
}
