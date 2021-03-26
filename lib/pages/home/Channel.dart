import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
        ],
      ),
    );
  }
}
