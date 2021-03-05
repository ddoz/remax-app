import 'package:flutter/material.dart';
import 'package:remax_app/screens/sign_in/components/header_signin.dart';

import 'content_sign_in.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          HeaderSignIn(size: size),
          // TitleWithMoreBtn(title: "Our Approved Partner", press: () {}),
          ContentSignIn(),
          // SizedBox(height: 20.0),
          // TitleWithMoreBtn(title: "Near From You", press: () {}),
          // NearMeListing(),
          // SizedBox(height: 20.0),
          // TitleWithLink(title: "Listing Properties", press: () {}),
          // ListingProperties(),
        ],
      ),
    );
  }
}
