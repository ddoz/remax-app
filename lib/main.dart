import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/screens/detail/detail_page.dart';
import 'package:remax_app/screens/gallery_page.dart';
import 'package:remax_app/screens/home/home_screen.dart';
import 'package:remax_app/screens/home_page.dart';
import 'package:remax_app/screens/search/search_screen.dart';
import 'package:remax_app/slider_try.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      routes: <String, WidgetBuilder>{
        '/GalleryPage' : (BuildContext context) => new GalleryPage(),
        '/HomePage' : (BuildContext context) => new MyHomePage(),
      },
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
