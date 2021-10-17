import 'dart:io';

import 'package:flutter/material.dart';
import 'package:remax_app/screens/contactus/components/body.dart';
import 'package:remax_app/sidebar/navigation_bloc.dart';
import 'package:remax_app/util/constants.dart';

class ContactUsPage extends StatefulWidget with NavigationStates {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kAppBarColorTheme, //change your color here
        ),
        title: Text(
          "Contact Us",
          style: TextStyle(color: kAppBarColorTheme),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          // IconButton(
          //   icon: Image.asset("assets/icons/language_choose.png", color: kAppBarColorTheme,),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: Body(),
    );
  }
}
