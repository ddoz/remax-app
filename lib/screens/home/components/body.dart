import 'package:flutter/material.dart';
import 'package:remax_app/screens/home/components/featured_plants.dart';
import 'package:remax_app/screens/home/components/header_with_searchbox.dart';
import 'package:remax_app/screens/home/components/listing.dart';
import 'package:remax_app/screens/home/components/partners.dart';
import 'package:remax_app/screens/home/components/title_only.dart';
import 'package:remax_app/screens/home/components/title_with_link.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Our Approved Partner", press: () {}),
          Partner(),
          SizedBox(height: 20.0),
          TitleWithMoreBtn(title: "Near From You", press: () {}),
          FeaturedPlants(),
          SizedBox(height: 20.0),
          TitleWithLink(title: "Listing Properties", press: () {}),
          FeaturedPlants(),
        ],
      ),
    );
  }
}
