import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:remax_app/screens/detail/detail_page.dart';
import 'package:remax_app/util/constants.dart';
import 'package:shimmer/shimmer.dart';

class ListingProperties extends StatefulWidget {
  @override
  _ListingPropertiesState createState() => _ListingPropertiesState();
}

class _ListingPropertiesState extends State<ListingProperties> {
  CarouselSlider carouselSlider;
  int _current = 0;

  Future<List> getData() async {
    final response = await http.get("https://genius.remax.co.id/papi/listing");

    List list = json.decode(response.body)['data'];
    return list;
  }

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ?
          new Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    carouselSlider = CarouselSlider(
                      height: 370,
                      initialPage: 0,
                      enlargeCenterPage: false,
                      autoPlay: true,
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
                          index: _current,
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
                  child: new LoadingShimmerEffect()
                );
        },
      ),
    );
  }
}

class LoadingShimmerEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius:
                    new BorderRadius.all(const Radius.circular(10.0))),
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Container(
                margin: EdgeInsets.only(top: 5.0, left: 10.0),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius:
                    new BorderRadius.all(const Radius.circular(4.0))),
                height: 20,
                width: MediaQuery.of(context).size.width * 0.75,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Container(
                margin: EdgeInsets.only(top: 5.0, left: 10.0),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius:
                    new BorderRadius.all(const Radius.circular(4.0))),
                height: 20,
                width: MediaQuery.of(context).size.width * 0.6,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Container(
                margin: EdgeInsets.only(top: 5.0, left: 10.0),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius:
                    new BorderRadius.all(const Radius.circular(4.0))),
                height: 20,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
          ],
        ),
      ),
    );
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

  List listMedia = new List();

  @override
  Widget build(BuildContext context) {
    listMedia = data['links']['listFile'];
    return new Container(
      padding: const EdgeInsets.all(10.0),
      child: new GestureDetector(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new DetailPage(
                  list: list,
                  index: index,
                ))),
        child: new Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius:
                      new BorderRadius.all(const Radius.circular(10.0)),
                      image: DecorationImage(
                          image: data['listThumbnail'] != null
                              ? NetworkImage('https://genius.remax.co.id/papi/' +
                              data['listThumbnail'])
                              : NetworkImage('-'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius:
                      new BorderRadius.only(bottomRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
                    ),
                    padding:  EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/icons/camera.svg",
                          height: 12.0,
                        ),
                        SizedBox(width: 3,),
                        Text(listMedia.length.toString(), style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10.0, right: 10.0, top:5.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            data['listTitle'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                              fontSize: 13.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          new Container(
                            margin: EdgeInsets.only(left: 15.0, right: 15.0),
                            child: new Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      "assets/icons/sofa.svg",
                                      height: 15.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    data['listBedroom'] != null
                                        ? new Text(
                                            data['listBedroom'],
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
                            margin: EdgeInsets.only(left: 15.0, right: 15.0),
                            child: new Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      "assets/icons/bathub.svg",
                                      height: 20.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    data['listBathroom'] != null
                                        ? new Text(
                                            data['listBathroom'],
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
                            margin: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 5.0),
                            child: new Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      "assets/icons/home.svg",
                                      height: 20.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    data['listBuildingSize'] != null
                                        ? new Text(
                                            data['listBuildingSize'],
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
                            margin: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 5.0),
                            child: new Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      "assets/icons/size.svg",
                                      height: 20.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    data['listLandSize'] != null
                                        ? new Text(
                                            data['listLandSize'],
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
                      data['links']['listListingCategoryId'] == "1"
                          ? Row(children: <Widget>[
                              Container(
                                margin:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: new Text(
                                    NumberFormat.compactCurrency(
                                            locale: 'id',
                                            symbol: 'Rp ',
                                            decimalDigits: 0)
                                        .format(
                                            toInt(data['listListingPrice'])),
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
                                margin:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: new Text(
                                    NumberFormat.compactCurrency(
                                            locale: 'id',
                                            symbol: 'Rp ',
                                            decimalDigits: 0)
                                        .format(
                                            toInt(data['listListingPrice'])),
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
                                left: 10.0, top: 10.0, bottom: 10.0),
                            child: new Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      "assets/icons/share.svg",
                                    ),
                                  ],
                                )),
                          ),
                          Spacer(),
//                            new Container(
//                              margin: EdgeInsets.only(
//                                  left: 10.0, top: 5.0, bottom: 5.0),
//                              child: new Align(
//                                  alignment: Alignment.centerLeft,
//                                  child: Row(
//                                    children: <Widget>[
//                                      SvgPicture.asset(
//                                        "assets/icons/love_white.svg",
//                                      ),
//                                    ],
//                                  )),
//                            ),
                          Card(
                            margin: EdgeInsets.only(right: 10.0),
//                              onPressed: () {
//                                // Navigator.of(context).pop();
//                              },
//                              padding: EdgeInsets.zero,
                            elevation: 2.0,
                            //fillColor: Colors.white,
                            child: Container(
                              margin: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.favorite_border,
                                size: 15.0,
                              ),
                            ),
                            shape: CircleBorder(),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      //},
    );
  }
}
