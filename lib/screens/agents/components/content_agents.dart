import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/screens/agents/components/content_slide.dart';
import 'package:remax_app/util/constants.dart';

class ContentAgents extends StatefulWidget {
  @override
  _ContentAgentsState createState() => _ContentAgentsState();
}

class _ContentAgentsState extends State<ContentAgents> {
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
          new EdgeInsets.only(top: MediaQuery.of(context).size.height * .58),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0), color: Colors.white),
        child: new FutureBuilder<List<dynamic>>(
          future: getDataMemberFoto(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new Column(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.only(
                            top: 35.0, left: 15.0, bottom: 10.0),
                        child: new Align(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            snapshot.data[0]['wbilTitle'],
                            style: new TextStyle(
                                fontSize: 24.0,
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
                      Container(
                          margin: EdgeInsets.only(top: 35.0),
                          child: ContentSlideAgents()),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                        child: Text(
                            'Are You Ready To Have A Sucessful Real Estate Career? Together with RE/MAX, Your Dreams Can Come True. Join Us Now!',
                            textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Text(
                          '#StrongerTogether #UniteGrowWin!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kAppBarColorTheme,
                              fontSize: 18.0),
                        ),
                      ),
                      Container(
                        margin:  EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0, bottom: 40.0),
                        child: new OutlineButton(
                          shape: StadiumBorder(),
                          textColor: kRedColor,
                          child: Text('Click Here to Join Us'),
                          borderSide: BorderSide(
                              color: kRedColor, style: BorderStyle.solid,
                              width: 1),
                          onPressed: () {},
                        )
                      )
                    ],
                  )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
