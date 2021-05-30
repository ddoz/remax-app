import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContentAbout extends StatefulWidget {
  @override
  _ContentAboutState createState() => _ContentAboutState();
}

class _ContentAboutState extends State<ContentAbout> {


  String bahasa = "id_ID";

  getPrefBahasa() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      bahasa = preferences.getString("bahasa");
      print(bahasa);
    });
  }


  @override
  void initState() {
    super.initState();
    getPrefBahasa();
  }

  Future<List<dynamic>> getDataMemberFoto() async {
    final response = await http.get("https://genius.remax.co.id/papi/webabout?language=$bahasa");
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
                            snapshot.data[0]['wbalTitle'],
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
                        margin: EdgeInsets.all(15.0),
                        child: Html(data: snapshot.data[0]['wbalContent']),
                      ),
                      new Container(
                        margin: EdgeInsets.only(
                            top: 35.0, left: 15.0, bottom: 10.0),
                        child: new Align(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            snapshot.data[1]['wbalTitle'],
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
                          margin: EdgeInsets.only(top: 20.0),
                          width: 200.0,
                          height: 200.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.scaleDown,
                                  image: NetworkImage(
                                      'https://remax.co.id/images/ceo_monica.png')))),
                      new Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: new Align(
                          alignment: Alignment.center,
                          child: new Text(
                            'Monica Nardi, M.B.A',
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: kRedColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: new Align(
                          alignment: Alignment.center,
                          child: new Text(
                            'CEO of RE/MAX Indonesia',
                            style: new TextStyle(
                                fontSize: 11.0,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(15.0),
                          child: Html(data: snapshot.data[1]['wbalContent'])),
                      new Container(
                        margin: EdgeInsets.only(
                            top: 35.0, left: 15.0, bottom: 10.0),
                        child: new Align(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            'Vision & Mission',
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
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200.0,
                        margin:
                            EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://remax.co.id/images/visimisi-bg1.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 15.0, left: 15.0),
                        child: new Align(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            'Vision',
                            style: new TextStyle(
                                fontSize: 16.0,
                                color: kRedColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(15.0),
                          child: Html(
                              data:
                                  'To be the best in real estate by creating opportunities, providing best services and achieving maximum results')),
                      new Container(
                        margin: EdgeInsets.only(top: 10.0, left: 15.0),
                        child: new Align(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            'Mission',
                            style: new TextStyle(
                                fontSize: 16.0,
                                color: kRedColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(15.0),
                          child: Html(
                              data:
                                  'To create an environment for people to be as successful as they want to be')),
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
