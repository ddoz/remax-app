import 'package:flutter/material.dart';
import 'content_ajukankpr.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //HeaderAbout(size: size),
          ContentAjukaKpr(),
        ],
      ),
    );
  }
}