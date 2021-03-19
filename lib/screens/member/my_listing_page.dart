import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:remax_app/screens/addlisting/addlisting_page.dart';
import 'package:remax_app/util/constants.dart';
import 'package:remax_app/util/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../detail/detail_page.dart';

class MyListingPage extends StatefulWidget {


  MyListingPage();

  @override
  _MyListingPageState createState() => _MyListingPageState();
}

class _MyListingPageState extends State<MyListingPage> {


  String name = "", member = "";
  Map<String, String> headerss = {};

//  TabController tabController;


  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString("name");
      member = preferences.getString("member");
      setState(() {
        headerss['cookie'] = preferences.getString("cookie");
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  Future<List> getData() async {
    final response = await http.get(
        "https://genius.remax.co.id/api/listing/crud?sort=-listId",
        headers: headerss);
    List list = json.decode(response.body)['data'];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: kAppBarColorTheme, //change your color here
          ),
          title: Text(
            "My Listings",
            style: TextStyle(color: kAppBarColorTheme),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        floatingActionButton: new FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new AddListingPage()));
          },
          backgroundColor: kRedColor,
        ),
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
        ),
      ),
    );
  }
}

//class ItemList extends StatelessWidget {
//  List list;
//
//  ItemList({this.list});
//
//  int toInt(String str) {
//    var myInt = int.parse(str);
//    assert(myInt is int);
//    return myInt;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new ListView.builder(
//      itemCount: list == null ? 0 : list.length,
//      itemBuilder: (context, i) {
//        return new Container(
//          padding: const EdgeInsets.all(10.0),
//          child: new GestureDetector(
//            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//                builder: (BuildContext context) => new DetailPage(
//                      list: list,
//                      index: i,
//                    ))),
//            child: new Card(
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(10.0),
//              ),
//              child: Column(
//                children: <Widget>[
//                  Container(
//                    width: double.infinity,
//                    padding: EdgeInsets.all(100),
//                    decoration: BoxDecoration(
//                      borderRadius:
//                          new BorderRadius.all(const Radius.circular(10.0)),
//                      image: DecorationImage(
//                          image:
//                          list[i]['listThumbnail'] != null
//                          ? NetworkImage(
//                      'https://genius.remax.co.id/papi/' +
//                      list[i]['listThumbnail'])
//                          : NetworkImage(
//                        '-'),
//                          fit: BoxFit.cover),
//                    ),
//                  ),
//                  Container(
//                    margin: EdgeInsets.only(
//                        left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
//                    child: Align(
//                      alignment: Alignment.centerLeft,
//                      child: new Text(
//                        list[i]['listTitle'],
//                        overflow: TextOverflow.ellipsis,
//                        style: new TextStyle(
//                          fontSize: 16.0,
//                          color: const Color(0xff767472),
//                          fontWeight: FontWeight.bold,
//                        ),
//                      ),
//                    ),
//                  ),
//                  Row(
//                    children: <Widget>[
//                      new Container(
//                        margin:
//                            EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
//                        child: new Align(
//                            alignment: Alignment.centerLeft,
//                            child: Column(
//                              children: <Widget>[
//                                new Image.asset('assets/images/bed.png',
//                                    width: 15, height: 15),
//                                list[i]['listBedroom'] != null
//                                    ? new Text(
//                                        list[i]['listBedroom'],
//                                        style: new TextStyle(
//                                          fontSize: 10.0,
//                                          fontWeight: FontWeight.bold,
//                                        ),
//                                      )
//                                    : new Text('-',
//                                        style: new TextStyle(
//                                          fontSize: 10.0,
//                                          fontWeight: FontWeight.bold,
//                                        ))
//                              ],
//                            )),
//                      ),
//                      new Container(
//                        margin:
//                            EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
//                        child: new Align(
//                            alignment: Alignment.centerLeft,
//                            child: Column(
//                              children: <Widget>[
//                                new Image.asset('assets/images/bathtub.png',
//                                    width: 15, height: 15),
//                                list[i]['listBathroom'] != null
//                                    ? new Text(
//                                        list[i]['listBathroom'],
//                                        style: new TextStyle(
//                                          fontSize: 10.0,
//                                          fontWeight: FontWeight.bold,
//                                        ),
//                                      )
//                                    : new Text('-',
//                                        style: new TextStyle(
//                                          fontSize: 10.0,
//                                          fontWeight: FontWeight.bold,
//                                        ))
//                              ],
//                            )),
//                      ),
//                      new Container(
//                        margin:
//                            EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
//                        child: new Align(
//                            alignment: Alignment.centerLeft,
//                            child: Column(
//                              children: <Widget>[
//                                new Image.asset('assets/images/home.png',
//                                    width: 15, height: 15),
//                                list[i]['listBuildingSize'] != null
//                                    ? new Text(
//                                        list[i]['listBuildingSize'],
//                                        style: new TextStyle(
//                                          fontSize: 10.0,
//                                          fontWeight: FontWeight.bold,
//                                        ),
//                                      )
//                                    : new Text('-',
//                                        style: new TextStyle(
//                                          fontSize: 10.0,
//                                          fontWeight: FontWeight.bold,
//                                        ))
//                              ],
//                            )),
//                      ),
//                      new Container(
//                        margin:
//                            EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
//                        child: new Align(
//                            alignment: Alignment.centerLeft,
//                            child: Column(
//                              children: <Widget>[
//                                new Image.asset('assets/images/area.png',
//                                    width: 15, height: 15),
//                                list[i]['listLandSize'] != null
//                                    ? new Text(
//                                        list[i]['listLandSize'],
//                                        style: new TextStyle(
//                                          fontSize: 10.0,
//                                          fontWeight: FontWeight.bold,
//                                        ),
//                                      )
//                                    : new Text('-',
//                                        style: new TextStyle(
//                                          fontSize: 10.0,
//                                          fontWeight: FontWeight.bold,
//                                        ))
//                              ],
//                            )),
//                      ),
//                    ],
//                  ),
//                  list[i]['links']['listListingCategoryId'] == "1"
//                      ? Row(children: <Widget>[
//                          Container(
//                            margin: EdgeInsets.all(10.0),
//                            child: Align(
//                              alignment: Alignment.centerLeft,
////                              child: new Text(
////                                NumberFormat.compactCurrency(
////                                        locale: 'id',
////                                        symbol: 'Rp ',
////                                        decimalDigits: 0)
////                                    .format(toInt(list[i]['listListingPrice'])),
////                                style: new TextStyle(
////                                  fontSize: 21.0,
////                                  color: const Color(0xffDC1B2E),
////                                  fontWeight: FontWeight.bold,
////                                ),
////                              ),
//                            ),
//                          ),
//                          new Text(
//                            "DIJUAL",
//                            style: new TextStyle(
//                                fontSize: 12.0, color: const Color(0xffDC1B2E)),
//                          )
//                        ])
//                      : Row(children: <Widget>[
//                          Container(
//                            margin: EdgeInsets.all(10.0),
//                            child: Align(
//                              alignment: Alignment.centerLeft,
////                              child: new Text(
////                                NumberFormat.compactCurrency(
////                                        locale: 'id',
////                                        symbol: 'Rp ',
////                                        decimalDigits: 0)
////                                    .format(toInt(list[i]['listListingPrice'])),
////                                style: new TextStyle(
////                                  fontSize: 21.0,
////                                  color: const Color(0xff1A3668),
////                                  fontWeight: FontWeight.bold,
////                                ),
////                              ),
//                            ),
//                          ),
//                          new Text(
//                            "DISEWAKAN",
//                            style: new TextStyle(
//                                fontSize: 12.0, color: const Color(0xff1A3668)),
//                          )
//                        ]),
//                ],
//              ),
//            ),
//          ),
//        );
//      },
//    );
//  }
//}

class ItemList extends StatelessWidget {
  List list;
  ScrollController controller;

  ItemList({this.list, this.controller});

  int toInt(String str) {
    if (str == null){
      return 0;
    } else {
      var myInt = int.parse(str);
      assert(myInt is int);
      return myInt;
    }

  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      shrinkWrap: true,
      controller: controller,
//      physics: NeverScrollableScrollPhysics(),
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, int i) {
        return new Container(
          padding: const EdgeInsets.only(
              top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
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
                          image:
                          list[i]['listThumbnail'] != null
                          ? NetworkImage(
                      'https://genius.remax.co.id/papi/' +
                      list[i]['listThumbnail'])
                          : NetworkImage(
                        '-'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              list[i]['listTitle'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: new TextStyle(
                                fontSize: 13.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        list[i]['links']['listListingCategoryId'] == "1"
                            ? Row(children: <Widget>[
                          Container(
                            margin:
                            EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child:
                              new Text(
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
                            "(DIJUAL)",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: const Color(0xffDC1B2E)),
                          )
                        ])
                            : Row(children: <Widget>[
                          Container(
                            margin:
                            EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child:
                              new Text(
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
                            "(DISEWAKAN)",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: const Color(0xff1A3668)),
                          )
                        ]),
                        Row(
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.only(left: 10.0, top: 5.0),
                              child: new Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/icons/sofa.svg",
                                        height: 10.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      list[i]['listBedroom'] != null
                                          ? new Text(
                                        list[i]['listBedroom'],
                                        style: new TextStyle(
                                          fontSize: 10.0,

                                        ),
                                      )
                                          : new Text('-',
                                          style: new TextStyle(
                                            fontSize: 10.0,

                                          ))
                                    ],
                                  )),
                            ),
                            new Container(
                              margin: EdgeInsets.only(left: 5.0, top: 5.0),
                              child: new Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/icons/bathub.svg",
                                        height: 10.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      list[i]['listBathroom'] != null
                                          ? new Text(
                                        list[i]['listBathroom'],
                                        style: new TextStyle(
                                          fontSize: 10.0,

                                        ),
                                      )
                                          : new Text('-',
                                          style: new TextStyle(
                                            fontSize: 10.0,

                                          ))
                                    ],
                                  )),
                            ),
                            new Container(
                              margin: EdgeInsets.only(left: 5.0, top: 5.0),
                              child: new Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/icons/home.svg",
                                        height: 10.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      list[i]['listBuildingSize'] != null
                                          ? new Text(
                                        list[i]['listBuildingSize'] +
                                            '(m2)',
                                        style: new TextStyle(
                                          fontSize: 10.0,

                                        ),
                                      )
                                          : new Text('-',
                                          style: new TextStyle(
                                            fontSize: 10.0,

                                          ))
                                    ],
                                  )),
                            ),
                            new Container(
                              margin: EdgeInsets.only(left: 5.0, top: 5.0),
                              child: new Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/icons/size.svg",
                                        height: 10.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      list[i]['listLandSize'] != null
                                          ? new Text(
                                        list[i]['listLandSize'] + '(m2)',
                                        style: new TextStyle(
                                          fontSize: 10.0,

                                        ),
                                      )
                                          : new Text('-',
                                          style: new TextStyle(
                                            fontSize: 10.0,

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
