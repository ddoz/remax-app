import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/util/constants.dart';

class ContentContactUs extends StatefulWidget {
  @override
  _ContentContactUsState createState() => _ContentContactUsState();
}

class _ContentContactUsState extends State<ContentContactUs> {
  Future<List<dynamic>> getDataMemberFoto() async {
    final response = await http.get("https://genius.remax.co.id/papi/webabout");
    List<dynamic> data = json.decode(response.body)['data'];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      padding:
      new EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 4,
          child: Column(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.only(
                    top: 20.0, left: 15.0, bottom: 10.0),
                child: new Align(
                  alignment: Alignment.centerLeft,
                  child: new Text(
                    'Quick Support',
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              new Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 15.0),
                  width: 40,
                  height: 2,
                  color: const Color(0xffDC1B2E),
                ),
              ),
              new Container(
                margin: EdgeInsets.only(
                    top: 20.0, left: 15.0, right: 15.0, bottom: 10.0),
                child: new Align(
                  alignment: Alignment.centerLeft,
                  child: new Text(
                    'For quick information, you can get all contact information',
                    style: new TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 20.0, left: 15.0, right: 15.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.location_on, color: kPrimaryColor,),
                    SizedBox(width: 5.0,),
                    Text(
                      'Jl. Jendral Sudirman Kav. 52 - 53 (SCBD) \nJakarta - 12190\nIndonesia',
                      style: new TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

    );
  }
}
