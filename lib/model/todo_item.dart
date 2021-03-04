import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoItem extends StatelessWidget {
  String _itemTitle;
  String _itemThumbnail;
  String _itemPrice;
  String _itemCategory;
  String _dateCreated;
  int _id;

  TodoItem(this._id, this._itemTitle, this._itemThumbnail, this._itemPrice,
      this._itemCategory, this._dateCreated);

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
          child: Row(
            children: <Widget>[
              Container(
                width: 120.0,
                height: 120.0,
                //padding: EdgeInsets.all(100),
                decoration: BoxDecoration(
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(10.0)),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://genius.remax.co.id/papi/' + _itemThumbnail),
                      fit: BoxFit.cover),
                ),
              ),
              Flexible(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        left: 10.0, right: 5.0, top: 10.0, bottom: 5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        _itemTitle,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          fontSize: 12.0,
                          color: const Color(0xff767472),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
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
                      : Row(
                          children: <Widget>[
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
                          ],
                        ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
