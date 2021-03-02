import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../..//detail/detail_page.dart';

class Listing extends StatelessWidget {
  Future<List> getData() async {
    final response = await http.get("https://genius.remax.co.id/papi/listing");

    List list = json.decode(response.body)['data'];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<List>(
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
      shrinkWrap: true,
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
              child: Row(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 120,
//                    padding: EdgeInsets.all(80),
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
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              list[i]['listTitle'],
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(
                                fontSize: 13.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
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
                                          .format(toInt(
                                              list[i]['listListingPrice'])),
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
                                      fontSize: 12.0,
                                      color: const Color(0xffDC1B2E)),
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
                                          .format(toInt(
                                              list[i]['listListingPrice'])),
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
                                      fontSize: 12.0,
                                      color: const Color(0xff1A3668)),
                                )
                              ]),
                        Row(
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.only(
                                  left: 10.0, top: 5.0),
                              child: new Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/icons/sofa.svg",
                                        height: 10.0,
                                      ),
                                      SizedBox(width: 5.0,),
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
                              margin: EdgeInsets.only(
                                  left: 5.0, top: 5.0),
                              child: new Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/icons/bathub.svg",
                                        height: 10.0,
                                      ),
                                      SizedBox(width: 5.0,),
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
                              margin: EdgeInsets.only(
                                  left: 5.0, top: 5.0),
                              child: new Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/icons/home.svg",
                                        height: 10.0,
                                      ),
                                      SizedBox(width: 5.0,),
                                      list[i]['listBuildingSize'] != null
                                          ? new Text(
                                              list[i]['listBuildingSize']+'(m2)',
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
                              margin: EdgeInsets.only(
                                  left: 5.0, top: 5.0),
                              child: new Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/icons/size.svg",
                                        height: 10.0,
                                      ),
                                      SizedBox(width: 5.0,),
                                      list[i]['listLandSize'] != null
                                          ? new Text(
                                              list[i]['listLandSize']+'(m2)',
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
