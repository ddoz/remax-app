import 'package:flutter/material.dart';
import 'package:remax_app/screens/about/components/content_about.dart';
import 'package:remax_app/screens/about/components/header_about.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          HeaderAbout(size: size),
          ContentAbout(),
//        TitleWithMoreBtn(title: "Our Approved Partner", press: () {}),
//        Partner(),
//        SizedBox(height: 20.0),
//        TitleWithMoreBtn(title: "Near From You", press: () {}),
          //Expanded(child: Listing()),
////          RecomendsPlants(),
////          TitleWithMoreBtn(title: "Featured Plants", press: () {}),
//        FeaturedPlants(),
//        SizedBox(height: 20.0),
//        TitleWithLink(title: "Listing Properties", press: () {}),
//        FeaturedPlants(),
          //SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
