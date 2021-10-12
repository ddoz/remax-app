import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:remax_app/screens/favourite/detail_favorit.dart';


class TodoItem extends StatelessWidget {
  String _itemTitle;
  String _itemThumbnail;
  String _itemPrice;
  String _itemCategory;
  String _dateCreated;
  int _id;
  String _mediaLenght;
  String _bedroom;
  String _bathRoom;
  String _houseSize;
  String _landSize;

  TodoItem(
      this._id,
      this._itemTitle,
      this._itemThumbnail,
      this._itemPrice,
      this._itemCategory,
      this._dateCreated,
      this._mediaLenght,
      this._bedroom,
      this._bathRoom,
      this._houseSize,
      this._landSize);

  TodoItem.map(dynamic obj) {
    this._itemTitle = obj["title"];
    this._itemThumbnail = obj["thumbnail"];
    this._itemPrice = obj["price"];
    this._itemCategory = obj["category"];
    this._dateCreated = obj["dateCreated"];
    this._id = obj["id"];
    this._mediaLenght = obj["medialength"];
    this._bedroom = obj["bedroom"];
    this._bathRoom = obj["bathroom"];
    this._houseSize = obj["houseSize"];
    this._landSize = obj["landsize"];
  }

  String get itemTitle => _itemTitle;

  String get itemThumbnail => _itemThumbnail;

  String get itemPrice => _itemPrice;

  String get itemCategory => _itemCategory;

  String get dateCreated => _dateCreated;

  int get id => _id;

  String get mediaLength => _mediaLenght;

  String get bedRoom => _bedroom;

  String get bathRoom => _bathRoom;

  String get houseSize => _houseSize;

  String get landSize => _landSize;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = _itemTitle;
    map["thumbnail"] = _itemThumbnail;
    map["price"] = _itemPrice;
    map["category"] = _itemCategory;
    map["dateCreated"] = _dateCreated;
    map["medialength"] = _mediaLenght;
    map["bedroom"] = _bedroom;
    map["bathroom"] = _bathRoom;
    map["houseSize"] = _houseSize;
    map["landsize"] = _landSize;

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
    this._mediaLenght = map["medialength"];
    this._bedroom = map["bedroom"];
    this._bathRoom = map["bathroom"];
    this._houseSize = map["houseSize"];
    this._landSize = map["landsize"];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(10.0),
      child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new DetailFavPage(
                  idListing : _id.toString()
                ))),
        child: new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  width: 120.0,
                  height: 190.0,
                  //padding: EdgeInsets.all(100),
                  decoration: BoxDecoration(
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(10.0)),
                    image: DecorationImage(
                        image: NetworkImage('https://genius.remax.co.id/papi/' +
                            _itemThumbnail),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: new BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),),
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
                        _mediaLenght,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            _itemTitle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: new TextStyle(
                              fontSize: 13.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      _itemCategory == "1"
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
                                  toInt(_itemPrice)),
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
                                  toInt(_itemPrice)),
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
                                         _houseSize != null
                                            ? new Text(
                                          _houseSize +
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
                                        _bedroom != null
                                            ? new Text(
                                          _bedroom,
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Container(
                                margin: EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 5.0),
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
                                        _landSize != null
                                            ? new Text(
                                          _landSize + '(m2)',
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
                                    left: 10.0, right: 10.0, top: 5.0),
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
                                        bathRoom != null
                                            ? new Text(
                                          bathRoom,
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
                      Row(
                        children: <Widget>[
                          new Container(
                            margin: EdgeInsets.only(
                                left: 10.0, top: 10.0, bottom: 4.0),
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
