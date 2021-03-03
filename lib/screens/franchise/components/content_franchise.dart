import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/screens/agents/components/content_slide.dart';
import 'package:remax_app/util/constants.dart';

class ContentFranchise extends StatefulWidget {
  @override
  _ContentFranchiseState createState() => _ContentFranchiseState();
}

class _ContentFranchiseState extends State<ContentFranchise> {
  Future<List<dynamic>> getDataMemberFoto() async {
    final response =
        await http.get("https://genius.remax.co.id/papi/webagentinformation");
    List<dynamic> data = json.decode(response.body)['data'];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          new EdgeInsets.only(top: MediaQuery.of(context).size.height * .78),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kRedGradient, kOrangeGradient]),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(
                  top: 25.0),
              child: new Align(
                child: new Text(
                  'Training',
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            new Align(
              child: Container(
                margin: EdgeInsets.only(top: 5.0, bottom: 20.0),
                width: 35,
                height: 2,
                color: Colors.white,
              ),
            ),
          ],
        )
      ),
    );
  }
}
