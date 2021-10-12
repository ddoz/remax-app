import 'package:flutter/material.dart';

import 'content_maps.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device

    return Stack(
      children: <Widget>[
        MapsContent()
//        GoogleMap(initialCameraPosition: CameraPosition(
//          target: LatLng(45.521563, -122.677433),
//          zoom: 15
//        ))
      ],
    );
  }
}
