import 'package:flutter/material.dart';
import 'package:remax_app/screens/maps/components/content_maps.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device

    return Stack(
      children: <Widget>[
        MapsContent()
      ],
    );
  }
}