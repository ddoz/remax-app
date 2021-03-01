import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:remax_app/screens/detail/detail_page.dart';
import 'package:remax_app/util/constants.dart';

class CarouselDemo extends StatefulWidget {
  CarouselDemo() : super();

  final String title = "Carousel Demo";

  @override
  CarouselDemoState createState() => CarouselDemoState();
}

class CarouselDemoState extends State<CarouselDemo> {
  //
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Future<List> getData() async {
    final response = await http.get("https://genius.remax.co.id/papi/listing");

    List list = json.decode(response.body)['data'];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      carouselSlider = CarouselSlider(
                        initialPage: 0,
                        enlargeCenterPage: true,
                        autoPlay: false,
                        reverse: false,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayAnimationDuration: Duration(milliseconds: 300),
                        pauseAutoPlayOnTouch: Duration(seconds: 10),
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index) {
                          setState(() {
                            _current = index;
                          });
                        },
                        items: snapshot.data.map((data) {
                          return ItemList(
                            data: data,
                            index: data.hashCode,
                            list: snapshot.data,
                          );
                        }).toList(),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: goToPrevious,
                              child: Material(
                                elevation: 2.0,
                                shape: CircleBorder(),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.navigate_before,
                                    color: kPrimaryColor,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: goToNext,
                              child: Material(
                                elevation: 2.0,
                                shape: CircleBorder(),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.navigate_next,
                                    color: kPrimaryColor,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}

class ItemList extends StatelessWidget {
  dynamic data;
  int index;
  List list;

  ItemList({this.data, this.index, this.list});

  int toInt(String str) {
    var myInt = int.parse(str);
    assert(myInt is int);
    return myInt;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
//      shrinkWrap: true,
//      itemCount: list == null ? 0 : list.length,
//      itemBuilder: (context, i) {
      child: new Container(
        padding: const EdgeInsets.all(10.0),
        child: new GestureDetector(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new DetailPage(
                    list: list,
                    index: index,
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
                  decoration: BoxDecoration(
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(10.0)),
                    image: DecorationImage(
                        image: NetworkImage('https://genius.remax.co.id/papi/' +
                            data['listThumbnail']),
                        fit: BoxFit.fill),
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: new Text(
                                data['listTitle'],
                                overflow: TextOverflow.ellipsis,
                                style: new TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          data['links']['listListingCategoryId'] == "1"
                              ? Row(children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: new Text(
                                        NumberFormat.compactCurrency(
                                                locale: 'id',
                                                symbol: 'Rp ',
                                                decimalDigits: 0)
                                            .format(toInt(
                                                data['listListingPrice'])),
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
                                    margin: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: new Text(
                                        NumberFormat.compactCurrency(
                                                locale: 'id',
                                                symbol: 'Rp ',
                                                decimalDigits: 0)
                                            .format(toInt(
                                                data['listListingPrice'])),
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
                                margin:
                                    EdgeInsets.only(left: 15.0, right: 15.0),
                                child: new Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: <Widget>[
                                        new Image.asset('assets/images/bed.png',
                                            width: 15, height: 15),
                                        data['listBedroom'] != null
                                            ? new Text(
                                                data['listBedroom'],
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
                                    left: 15.0, right: 15.0, top: 5.0),
                                child: new Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: <Widget>[
                                        new Image.asset(
                                            'assets/images/bathtub.png',
                                            width: 15,
                                            height: 15),
                                        data['listBathroom'] != null
                                            ? new Text(
                                                data['listBathroom'],
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
                                    left: 15.0, right: 15.0, top: 5.0),
                                child: new Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: <Widget>[
                                        new Image.asset(
                                            'assets/images/home.png',
                                            width: 15,
                                            height: 15),
                                        data['listBuildingSize'] != null
                                            ? new Text(
                                                data['listBuildingSize'],
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
                                    left: 15.0, right: 15.0, top: 5.0),
                                child: new Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: <Widget>[
                                        new Image.asset(
                                            'assets/images/area.png',
                                            width: 15,
                                            height: 15),
                                        data['listLandSize'] != null
                                            ? new Text(
                                                data['listLandSize'],
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //},
    );
  }
}
