import 'package:flutter/material.dart';

class ContentAbout extends StatefulWidget {
  @override
  _ContentAboutState createState() => _ContentAboutState();
}

class _ContentAboutState extends State<ContentAbout> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: new EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .58),
      child: Container(
        height: 500.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Colors.white),
        child: Column(
          children: <Widget>[

          ],

        ),
      ),
    );
  }
}
