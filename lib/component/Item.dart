import 'package:flutter/material.dart';
import 'package:music/iconfont/icon_font.dart';

class Item extends StatelessWidget {
  const Item({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print("tap");
      },
      child: Container(
        height: 140,
        margin: EdgeInsets.only(
          bottom: 24,
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://www.ting56.com/pic/images/2019-1/20191314415642420.jpg"),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  left: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "宋词名家故事（完结）",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xff252525),
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "孙刚",
                      style: TextStyle(
                        color: Color(0xff5c5c5c),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "有声评书《宋词名家故事（完结）,宋词名家故事（完结》是一部非常不错的小说哦，详情是这样的：宋词名家故事（完结）,宋词名家故事（完结有声评书是由“孙刚”所播讲、创作的一部评书类有声读物，所有章节都由网友提供发布，本站不参加任何原创录制工作宋词名家故事（完结）,宋词名家故事（完结所描述的内容只是作者个人观点，与本站的立场无关，小说听书网只是一个免费有声评书在线收听网。宋词名家故事（完结）,宋词名家故事（完结是一部非常好听的有声评书，为了让本书播音员“孙刚”能提供更多优秀的有声作品，请多多宣传和推荐本书，这是一种支持与鼓励！有声小说的未来，是需要大家共同的努力! 友情提示：听书是种生活的品味，在品味生活的同时，请关注你身边的亲人、朋友，合理安排时间！",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xff5c5c5c),
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.play_arrow,
                          color: Color(0xffB6B6B6),
                        ),
                        Container(
                          width: 4,
                        ),
                        Text(
                          "281.1万次",
                          style: TextStyle(
                            color: Color(0xffB6B6B6),
                          ),
                        ),
                        Container(
                          width: 20,
                        ),
                        Icon(
                          Icons.list,
                          color: Color(0xffB6B6B6),
                        ),
                        Container(
                          width: 4,
                        ),
                        Text(
                          "1147集",
                          style: TextStyle(
                            color: Color(0xffB6B6B6),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
