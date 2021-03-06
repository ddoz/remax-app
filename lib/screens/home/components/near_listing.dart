import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:remax_app/screens/detail/detail_page.dart';
import 'package:remax_app/util/constants.dart';
import 'package:shimmer/shimmer.dart';

class NearMeListing extends StatefulWidget {
  @override
  _NearMeListingState createState() => _NearMeListingState();
}

class _NearMeListingState extends State<NearMeListing> {
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
                      initialPage: 0,
                      enlargeCenterPage: false,
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
                  child: new LoadingShimmerEffect(),
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
      height: 180,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(10.0))),
                height: 180,
                width: 120,
              ),
            ),
            Column(
              children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.only(top: 30.0, left: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                        new BorderRadius.all(const Radius.circular(4.0))),
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0, left: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                        new BorderRadius.all(const Radius.circular(4.0))),
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0, left: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                        new BorderRadius.all(const Radius.circular(4.0))),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
              ],
            )
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

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(10.0),
      child: new GestureDetector(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new DetailPage(
                  list: list,
                  index: index,
                ))),
        child: new Card(
          margin: EdgeInsets.all(10),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 120,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(10.0)),
                  image: DecorationImage(
                      image: NetworkImage('https://genius.remax.co.id/papi/' +
                          data['listThumbnail']),
                      fit: BoxFit.cover),
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
                              maxLines: 3,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  margin: EdgeInsets.only(
                                      left: 15.0, right: 15.0, top: 5.0),
                                  child: new Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: <Widget>[
                                          SvgPicture.asset(
                                            "assets/icons/home.svg",
                                            height: 15.0,
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          data['listBuildingSize'] != null
                                              ? new Text(
                                                  data['listBuildingSize'] +
                                                      '(m2)',
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
                                SizedBox(
                                  height: 5.0,
                                ),
                                new Container(
                                  margin:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  margin: EdgeInsets.only(
                                      left: 15.0, right: 15.0, top: 5.0),
                                  child: new Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: <Widget>[
                                          SvgPicture.asset(
                                            "assets/icons/size.svg",
                                            height: 15.0,
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          data['listLandSize'] != null
                                              ? new Text(
                                                  data['listLandSize'] + '(m2)',
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
                                      child: Row(
                                        children: <Widget>[
                                          SvgPicture.asset(
                                            "assets/icons/bathub.svg",
                                            height: 15.0,
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
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
                              ],
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
    );
  }
}
