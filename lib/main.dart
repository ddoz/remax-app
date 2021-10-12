

import 'package:flutter/material.dart';
import 'package:remax_app/screens/gallery_page.dart';
import 'package:remax_app/screens/home/home_screen.dart';
import 'package:remax_app/screens/home_page.dart';

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
        '/GalleryPage': (BuildContext context) => new GalleryPage(),
        '/HomePage': (BuildContext context) => new MyHomePage(),
      },
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      //home: CreateListing(),
    );
  }
}
