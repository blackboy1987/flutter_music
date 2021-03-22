import 'package:flutter/material.dart';

class Channel extends StatelessWidget {
  const Channel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 80,
            child: Row(
              children: <Widget>[
                Text(
                  '精彩好书',
                  style: TextStyle(
                    color: Color(0xff222222),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xff929292),
                ),
              ],
            ),
          ),
          ListView(
            children: <ListTile>[
              ListTile(
                leading:
                    Image.network("https://www.yousxs.com/img/default.png"),
                title: Text("官场风云"),
                subtitle: Text(
                    "蜀道难，难于上青天，官场之难，尤为其上，陈兴没权没势，端着公务员的铁饭碗，本想着这辈子也不会有啥大出息，就这样庸庸碌碌的过了，不曾想一次际遇，让他青云直上，官路亨通。艳阳天，放眼望去，火辣辣的空气中，一道身影在沿海道上慢慢的走着。没错，那就是在市里一家大企业做行政工作，因为得罪了领导，被发配最无聊的行政部做文秘工作，整天跟办公室文件作伴的金融系高材生——陈兴。有声小说官场风云,由叼西人作者精心撰写,播音由孙仙生完成，是一部非常不错的有声小说;有声小说《官场风云》转自于网络资源如有侵权请联系站长!"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
