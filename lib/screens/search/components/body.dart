import 'package:flutter/material.dart';

import 'listing.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
//        HeaderWithSearchBox(size: size),
//        TitleWithMoreBtn(title: "Our Approved Partner", press: () {}),
//        Partner(),
//        SizedBox(height: 20.0),
//        TitleWithMoreBtn(title: "Near From You", press: () {}),
         Expanded(child: Listing()),
////          RecomendsPlants(),
////          TitleWithMoreBtn(title: "Featured Plants", press: () {}),
//        FeaturedPlants(),
//        SizedBox(height: 20.0),
//        TitleWithLink(title: "Listing Properties", press: () {}),
//        FeaturedPlants(),
        //SizedBox(height: kDefaultPadding),
      ],
    );
  }
}
