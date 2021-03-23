import 'package:flutter/material.dart';

class Me extends StatefulWidget {
  Me({Key key}) : super(key: key);

  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xfffefefe),
              Color(0xfffee3ec),
            ],
          ),
        ),
        child: GestureDetector(
          child: Text('dialog'),
          onTap: () {

          },
        ),
      ),
    );
  }
}
