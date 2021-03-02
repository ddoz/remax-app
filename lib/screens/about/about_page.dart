import 'dart:io';

import 'package:flutter/material.dart';
import 'package:remax_app/screens/about/components/body.dart';
import 'package:remax_app/sidebar/navigation_bloc.dart';
import 'package:remax_app/util/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutPage extends StatefulWidget with NavigationStates {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: kAppBarColorTheme, //change your color here
          ),
          title: Text(
            "About",
            style: TextStyle(color: kAppBarColorTheme),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Body());
  }
}
