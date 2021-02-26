import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/sidebar/navigation_bloc.dart';

import 'detail/detail_page.dart';
import 'main_drawer.dart';

class MyHomePage extends StatefulWidget with NavigationStates {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List> getData() async {
    final response = await http.get("https://genius.remax.co.id/papi/listing");

    List list = json.decode(response.body)['data'];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ItemList extends StatelessWidget {
  List list;

  ItemList({this.list});

  int toInt(String str) {
    var myInt = int.parse(str);
    assert(myInt is int);
    return myInt;
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new DetailPage(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(100),
                    decoration: BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(10.0)),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://genius.remax.co.id/papi/' +
                                  list[i]['listThumbnail']),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        list[i]['listTitle'],
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          fontSize: 16.0,
                          color: const Color(0xff767472),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      new Container(
                        margin:
                            EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                        child: new Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                new Image.asset('assets/images/bed.png',
                                    width: 15, height: 15),
                                list[i]['listBedroom'] != null
                                    ? new Text(
                                        list[i]['listBedroom'],
                                        style: new TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : new Text('-',
                                        style: new TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                        ))
                              ],
                            )),
                      ),
                      new Container(
                        margin:
                            EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                        child: new Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                new Image.asset('assets/images/bathtub.png',
                                    width: 15, height: 15),
                                list[i]['listBathroom'] != null
                                    ? new Text(
                                        list[i]['listBathroom'],
                                        style: new TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : new Text('-',
                                        style: new TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                        ))
                              ],
                            )),
                      ),
                      new Container(
                        margin:
                            EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                        child: new Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                new Image.asset('assets/images/home.png',
                                    width: 15, height: 15),
                                list[i]['listBuildingSize'] != null
                                    ? new Text(
                                        list[i]['listBuildingSize'],
                                        style: new TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : new Text('-',
                                        style: new TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                        ))
                              ],
                            )),
                      ),
                      new Container(
                        margin:
                            EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                        child: new Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                new Image.asset('assets/images/area.png',
                                    width: 15, height: 15),
                                list[i]['listLandSize'] != null
                                    ? new Text(
                                        list[i]['listLandSize'],
                                        style: new TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : new Text('-',
                                        style: new TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                        ))
                              ],
                            )),
                      ),
                    ],
                  ),
                  list[i]['links']['listListingCategoryId'] == "1"
                      ? Row(children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: new Text(
                                NumberFormat.compactCurrency(
                                        locale: 'id',
                                        symbol: 'Rp ',
                                        decimalDigits: 0)
                                    .format(toInt(list[i]['listListingPrice'])),
                                style: new TextStyle(
                                  fontSize: 21.0,
                                  color: const Color(0xffDC1B2E),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          new Text(
                            "DIJUAL",
                            style: new TextStyle(
                                fontSize: 12.0, color: const Color(0xffDC1B2E)),
                          )
                        ])
                      : Row(children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: new Text(
                                NumberFormat.compactCurrency(
                                        locale: 'id',
                                        symbol: 'Rp ',
                                        decimalDigits: 0)
                                    .format(toInt(list[i]['listListingPrice'])),
                                style: new TextStyle(
                                  fontSize: 21.0,
                                  color: const Color(0xff1A3668),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          new Text(
                            "DISEWAKAN",
                            style: new TextStyle(
                                fontSize: 12.0, color: const Color(0xff1A3668)),
                          )
                        ]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ImageDialog extends StatelessWidget {
  final String url;

  ImageDialog(this.url);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)),
      ),
    );
  }
}
