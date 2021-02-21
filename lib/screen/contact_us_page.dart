import 'dart:io';

import 'package:flutter/material.dart';
import 'package:remax_app/sidebar/navigation_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContactUsPage extends StatefulWidget  with NavigationStates {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {

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
          backgroundColor: const Color(0xff1A3668),
          title: Text('Contact Us Page'),
        ),
        body: WebView(
          initialUrl: 'https://remax.co.id/contact',
        )
    );
  }
}

