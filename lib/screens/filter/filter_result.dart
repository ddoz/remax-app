import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/screens/detail/detail_page.dart';
import 'package:remax_app/util/constants.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';


import 'package:remax_app/model/todo_item.dart';
import 'package:remax_app/util/database_client.dart';
import 'package:remax_app/util/date_formatter.dart';

class FilterResult extends StatefulWidget {
  String url;

  FilterResult({this.url});

  @override
  _FilterResultState createState() => _FilterResultState();
}

class _FilterResultState extends State<FilterResult> {
  Future<List> getData() async {
    final response = await http.get(widget.url);
    List list = json.decode(response.body)['data'];

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kAppBarColorTheme, //change your color here
        ),
        title: Text(
          "Listing",
          style: TextStyle(color: kAppBarColorTheme),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
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
    );
  }
}

class ItemList extends StatefulWidget {
  List list;

  ItemList({this.list});

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  int toInt(String str) {
    var myInt = int.parse(str);
    assert(myInt is int);
    return myInt;
  }

  List listMedia = new List();

  var db = DatabaseHelper();

  void _handleSubmitted(
      int id,
      String title,
      String thumbnail,
      String price,
      String category,
      String mediaLength,
      String bedRoom,
      String bathRoom,
      String houseSize,
      String landSize) async {
    TodoItem noDoItem = TodoItem(id, title, thumbnail, price, category,
        dateFormatted(), mediaLength, bedRoom, bathRoom, houseSize, landSize);
    int savedItemId = await db.saveItem(noDoItem);

    TodoItem addedItem = await db.getItem(savedItemId);

    print("Item saved id: $savedItemId");
  }

  Future<bool> checkfav(int id) async {
    bool cek = await db.getItemFav(id);
    return cek;
  }

  _deletefav(int id) async {
    debugPrint("Deleted Todo!");
    await db.deleteItem(id);
  }

  Future<void> share(String idListing, String judul) async {
    await FlutterShare.share(
        title: 'Share',
        text: judul,
        linkUrl: 'https://remax.co.id/property/${idListing}',
        chooserTitle: 'Choose application'
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      shrinkWrap: true,
//      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.list == null ? 0 : widget.list.length,
      itemBuilder: (context, int i) {
        listMedia = widget.list[i]['links']['listFile'];
        return new Container(
          padding: const EdgeInsets.only(
              top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new DetailPage(
                  list: widget.list,
                  index: i,
                ))),
            child: new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      width: 120,
                      height: 153,
//                    padding: EdgeInsets.all(80),
                      decoration: BoxDecoration(
                        borderRadius:
                        new BorderRadius.all(const Radius.circular(10.0)),
                        image: DecorationImage(
                            image: widget.list[i]['listThumbnail'] != null
                                ? NetworkImage(
                                'https://genius.remax.co.id/papi/' +
                                    widget.list[i]['listThumbnail'])
                                : NetworkImage('-'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: new BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                      ),
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/icons/camera.svg",
                            height: 12.0,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            listMedia.length.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
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
                              widget.list[i]['listTitle'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: new TextStyle(
                                fontSize: 13.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        widget.list[i]['links']['listListingCategoryId'] == "1"
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
                                    .format(toInt(
                                    widget.list[i]['listListingPrice'])),
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
                              child: new Text(
                                NumberFormat.compactCurrency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                    .format(toInt(
                                    widget.list[i]['listListingPrice'])),
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
                                      widget.list[i]['listBedroom'] != null
                                          ? new Text(
                                        widget.list[i]['listBedroom'],
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
                                      widget.list[i]['listBathroom'] != null
                                          ? new Text(
                                        widget.list[i]['listBathroom'],
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
                                      widget.list[i]['listBuildingSize'] != null
                                          ? new Text(
                                        widget.list[i]['listBuildingSize'] +
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
                                      widget.list[i]['listLandSize'] != null
                                          ? new Text(
                                        widget.list[i]['listLandSize'] + '(m2)',
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
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: (){
                                share(widget.list[i]['id'], widget.list[i]['listTitle']);
                              },
                              child: new Container(
                                margin: EdgeInsets.only(
                                    left: 10.0),
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
                            ),
                            Spacer(),
                            FutureBuilder<bool>(
                                future: checkfav(toInt(widget.list[i]['id'])),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) print(snapshot.error);
                                  if (snapshot.data == true) {
                                    return GestureDetector(
                                      onTap: (){
                                        _deletefav(toInt(widget.list[i]['id']));
                                        // do something
                                        setState(() {});
                                      },
                                      child: Card(
                                        margin: EdgeInsets.only(right: 10.0),
                                        elevation: 2.0,
                                        color: kRedColor,
                                        child: Container(
                                          margin: EdgeInsets.all(6.0),
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                            size: 15.0,
                                          ),
                                        ),
                                        shape: CircleBorder(),
                                      ),
                                    );
                                  }
                                  else {
                                    return GestureDetector(
                                      onTap: (){
                                        _handleSubmitted(
                                          toInt(widget.list[i]['id']),
                                          widget.list[i]['listTitle'],
                                          widget.list[i]['listThumbnail'],
                                          widget.list[i]['listListingPrice'],
                                          widget.list[i]['links']
                                          ['listListingCategoryId'],
                                          listMedia.length.toString(),
                                          widget.list[i]['listBedroom'],
                                          widget.list[i]['listBathroom'],
                                          widget.list[i]['listBuildingSize'],
                                          widget.list[i]['listLandSize'],
                                        );
                                        // do something
                                        setState(() {});
                                      },
                                      child: Card(
                                        margin: EdgeInsets.only(right: 10.0),
                                        elevation: 2.0,
                                        //fillColor: Colors.white,
                                        child: Container(
                                          margin: EdgeInsets.all(6.0),
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 15.0,
                                          ),
                                        ),
                                        shape: CircleBorder(),
                                      ),
                                    );
                                  }
                                }),

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


