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
            new Container(
              margin: EdgeInsets.only(
                  top: 25.0),
              child: new Align(
                child: new Text(
                  'Start Up Training',
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                  ),
                ),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(
                  top: 10.0, left: 15.0, right: 15.0),
              child: new Align(
                child: new Text(
                  'RE/MAX provides the best training program that is offered in the industry.',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,),
                ),
              ),
            ),
            Container(
                margin:  EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 40.0),
                child: new OutlineButton(
                  shape: StadiumBorder(),
                  textColor: Colors.white,
                  child: Text('Read More'),
                  borderSide: BorderSide(
                      color: Colors.white, style: BorderStyle.solid,
                      width: 1),
                  onPressed: () {},
                )
            ),
            new Container(
              margin: EdgeInsets.only(
                  top: 25.0),
              child: new Align(
                child: new Text(
                  'On Going Training',
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(
                  top: 10.0, left: 15.0, right: 15.0),
              child: new Align(
                child: new Text(
                  'The advantage that you will gain by owning a RE/MAX office is not limited to classroom trainings but unlimited access to training 24 hours a day, 365 days a year.',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,),
                ),
              ),
            ),
            Container(
                margin:  EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 40.0),
                child: new OutlineButton(
                  shape: StadiumBorder(),
                  textColor: Colors.white,
                  child: Text('Read More'),
                  borderSide: BorderSide(
                      color: Colors.white, style: BorderStyle.solid,
                      width: 1),
                  onPressed: () {},
                )
            ),
            new Container(
              margin: EdgeInsets.only(
                  top: 25.0),
              child: new Align(
                child: new Text(
                  'Momentum',
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(
                  top: 10.0, left: 15.0, right: 15.0),
              child: new Align(
                child: new Text(
                  'A specialized training program created for business owners to understand the agency business on a deeper level.',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,),
                ),
              ),
            ),
            Container(
                margin:  EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 40.0),
                child: new OutlineButton(
                  shape: StadiumBorder(),
                  textColor: Colors.white,
                  child: Text('Read More'),
                  borderSide: BorderSide(
                      color: Colors.white, style: BorderStyle.solid,
                      width: 1),
                  onPressed: () {},
                )
            ),
            new Container(
              margin: EdgeInsets.only(
                  top: 25.0),
              child: new Align(
                child: new Text(
                  'Bootcamp',
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(
                  top: 10.0, left: 15.0, right: 15.0),
              child: new Align(
                child: new Text(
                  'A specialized training for agents consisting of 12 modules is proven to increase productivity',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,),
                ),
              ),
            ),
            Container(
                margin:  EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 40.0),
                child: new OutlineButton(
                  shape: StadiumBorder(),
                  textColor: Colors.white,
                  child: Text('Read More'),
                  borderSide: BorderSide(
                      color: Colors.white, style: BorderStyle.solid,
                      width: 1),
                  onPressed: () {},
                )
            )
          ],
        )
      ),
    );
  }
}
