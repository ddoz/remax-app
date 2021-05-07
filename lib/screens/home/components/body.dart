import 'package:flutter/material.dart';
import 'package:remax_app/screens/home/components/featured_plants.dart';
import 'package:remax_app/screens/home/components/header_with_searchbox.dart';
import 'package:remax_app/screens/home/components/listing.dart';
import 'package:remax_app/screens/home/components/listing_properties.dart';
import 'package:remax_app/screens/home/components/partners.dart';
import 'package:remax_app/screens/home/components/title_only.dart';
import 'package:remax_app/screens/home/components/title_with_link.dart';

import '../../../slider_try.dart';
import 'near_listing.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),

          TitleWithMoreBtn(title: "Our Approved Partner", press: () {}),
          Partner(),
          SizedBox(height: 20.0),
          TitleWithMoreBtn(title: "Near From You", press: () {}),
          NearMeListing(),
          SizedBox(height: 20.0),
          TitleWithLink(title: "Listing Properties", press: () {}),
          ListingProperties(),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
