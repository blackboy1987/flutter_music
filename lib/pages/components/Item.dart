import 'package:flutter/material.dart';
import 'package:music/pages/play/Play.dart';

class Item extends StatelessWidget {
  var data;

  Item(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      height: 180.0,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) {
              return Play(
                novelId: data["id"],
              );
            }),
          );
        },
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 120,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(data["img"]),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data["title"],
                        style: TextStyle(
                          color: Color(0xff343434),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        height: 20,
                      ),
                      Text(
                        data["content"],
                        style: TextStyle(
                          color: Color(0xffa9a9a9),
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.play_arrow_outlined,
                            color: Color(0xff9f9f9f),
                          ),
                          Text(
                            '639.5万次',
                            style: TextStyle(
                              color: Color(0xffa9a9a9),
                            ),
                          ),
                          Container(
                            width: 10,
                          ),
                          Icon(
                            Icons.list,
                            color: Color(0xff9f9f9f),
                          ),
                          Text(
                            '${data["itemCount"]}',
                            style: TextStyle(
                              color: Color(0xffa9a9a9),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
