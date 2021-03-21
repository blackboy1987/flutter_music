import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 120,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'http://www.ysxs8.com/pic/uploadimg/2021-1/202113019164883168.jpg'),
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
                      '药店惊魂有声小说',
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
                      '不要在晚上去药店买药，可能不是卖给活人的，特别是避孕药，春宵过后，又会有什么故事呢？',
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
                          '2115集',
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
    );
  }
}
