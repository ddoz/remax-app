import 'dart:io';
import 'package:flutter/material.dart';
import 'package:remax_app/sidebar/navigation_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutPage extends StatefulWidget  with NavigationStates {
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
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://remax.co.id/about',
        ),
      )
    );
  }
}

