import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoItem extends StatelessWidget {
  String _itemTitle;
  String _itemThumbnail;
  String _itemPrice;
  String _itemCategory;
  String _dateCreated;
  int _id;

  TodoItem(this._id, this._itemTitle, this._itemThumbnail, this._itemPrice, this._itemCategory, this._dateCreated);

  TodoItem.map(dynamic obj) {
    this._itemTitle = obj["title"];
    this._itemThumbnail = obj["thumbnail"];
    this._itemPrice = obj["price"];
    this._itemCategory = obj["category"];
    this._dateCreated = obj["dateCreated"];
    this._id = obj["id"];
  }

  String get itemTitle => _itemTitle;
  String get itemThumbnail => _itemThumbnail;
  String get itemPrice => _itemPrice;
  String get itemCategory => _itemCategory;
  String get dateCreated => _dateCreated;
  int get id => _id;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = _itemTitle;
    map["thumbnail"] = _itemThumbnail;
    map["price"] = _itemPrice;
    map["category"] = _itemCategory;
    map["dateCreated"] = _dateCreated;

    if (_id != null) {
      map["id"] = _id;
    }

    return map;
  }

  int toInt(String str) {
    var myInt = int.parse(str);
    assert(myInt is int);
    return myInt;
  }

  TodoItem.fromMap(Map<String, dynamic> map) {
    this._itemTitle = map["title"];
    this._itemThumbnail = map["thumbnail"];
    this._itemPrice = map["price"];
    this._itemCategory = map["category"];
    this._dateCreated = map["dateCreated"];
    this._id = map["id"];
  }

  @override
  Widget build(BuildContext context) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
//            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//                builder: (BuildContext context) => new DetailPage(
//                  list: list,
//                  index: i,
//                ))),
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
                      borderRadius: new BorderRadius.all( const Radius.circular(10.0)
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://genius.remax.co.id/papi/' +
                                  _itemThumbnail),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        _itemTitle,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          fontSize: 16.0,
                          color: const Color(0xff767472),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
//                  Row(
//                    children: <Widget>[
//                      new Container(
//                        margin:
//                        EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
//                        child: new Align(
//                            alignment: Alignment.centerLeft,
//                            child: Column(
//                              children: <Widget>[
//                                new Image.asset('assets/images/bed.png',
//                                    width: 15, height: 15),
//                                list[i]['listBedroom'] != null
//                                    ? new Text(list[i]['listBedroom'],
//                                  style: new TextStyle(
//                                    fontSize: 10.0,
//                                    fontWeight: FontWeight.bold,
//                                  ),)
//                                    : new Text('-',
//                                    style: new TextStyle(
//                                      fontSize: 10.0,
//                                      fontWeight: FontWeight.bold,
//                                    ))
//                              ],
//                            )),
//                      ),
//                      new Container(
//                        margin:
//                        EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
//                        child: new Align(
//                            alignment: Alignment.centerLeft,
//                            child: Column(
//                              children: <Widget>[
//                                new Image.asset('assets/images/bathtub.png',
//                                    width: 15, height: 15),
//                                list[i]['listBathroom'] != null
//                                    ? new Text(list[i]['listBathroom'],
//                                  style: new TextStyle(
//                                    fontSize: 10.0,
//                                    fontWeight: FontWeight.bold,
//                                  ),)
//                                    : new Text('-',
//                                    style: new TextStyle(
//                                      fontSize: 10.0,
//                                      fontWeight: FontWeight.bold,
//                                    ))
//                              ],
//                            )),
//                      ),
//                      new Container(
//                        margin:
//                        EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
//                        child: new Align(
//                            alignment: Alignment.centerLeft,
//                            child: Column(
//                              children: <Widget>[
//                                new Image.asset('assets/images/home.png',
//                                    width: 15, height: 15),
//                                list[i]['listBuildingSize'] != null
//                                    ? new Text(list[i]['listBuildingSize'],
//                                  style: new TextStyle(
//                                    fontSize: 10.0,
//                                    fontWeight: FontWeight.bold,
//                                  ),)
//                                    : new Text('-',
//                                    style: new TextStyle(
//                                      fontSize: 10.0,
//                                      fontWeight: FontWeight.bold,
//                                    ))
//                              ],
//                            )),
//                      ),
//                      new Container(
//                        margin:
//                        EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
//                        child: new Align(
//                            alignment: Alignment.centerLeft,
//                            child: Column(
//                              children: <Widget>[
//                                new Image.asset('assets/images/area.png',
//                                    width: 15, height: 15),
//                                list[i]['listLandSize'] != null
//                                    ? new Text(list[i]['listLandSize'],
//                                  style: new TextStyle(
//                                    fontSize: 10.0,
//                                    fontWeight: FontWeight.bold,
//                                  ),)
//                                    : new Text('-',
//                                    style: new TextStyle(
//                                      fontSize: 10.0,
//                                      fontWeight: FontWeight.bold,
//                                    ))
//                              ],
//                            )),
//                      ),
//                    ],
//                  ),
                  _itemCategory == "1"
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
                              .format(toInt(_itemPrice)),
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
                              .format(toInt(_itemPrice)),
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
//    return Container(
//      margin: const EdgeInsets.all(8.0),
//      child: Row(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          //solve the overflow problem
//          Expanded(
//
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  _itemTitle,
//                  style: TextStyle(
//                      color: Colors.black,
//                      fontWeight: FontWeight.bold,
//                      fontSize: 18.0),
//                  maxLines: 1,
//                  overflow: TextOverflow.ellipsis,
//                ),
//                Container(
//                  margin: const EdgeInsets.only(top: 10.0),
//                  child: Text(
//                    "Created on: $_dateCreated",
//                    style: TextStyle(
//                        color: Colors.black,
//                        fontSize: 12.0,
//                        fontStyle: FontStyle.italic),
//                  ),
//                ),
//              ],
//            ),
//          )
//        ],
//      ),
//    );
  }
}
