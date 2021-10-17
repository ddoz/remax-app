import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:remax_app/model/todo_item.dart';
import 'package:remax_app/screens/home/components/near_listing.dart';
import 'package:remax_app/util/constants.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/util/database_client.dart';
import 'package:remax_app/util/date_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../detail_page.dart';

class ListingByOffice extends StatefulWidget {
  String listMmbsId;

  ListingByOffice({this.listMmbsId});

  @override
  _ListingByOfficeState createState() => _ListingByOfficeState();
}

class _ListingByOfficeState extends State<ListingByOffice> {
  CarouselSlider carouselSlider;
  final CarouselController _controller = CarouselController();
  int _current = 0;

  Future<List> getData() async {
    final response = await http.get(
        "https://genius.remax.co.id/papi/listing?filter[listMmbsId]=" +
            widget.listMmbsId);

    List list = json.decode(response.body)['data'];
    return list;
  }

  goToPrevious() {
    _controller.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    _controller.nextPage(
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
              ? new Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    carouselSlider = CarouselSlider(
                      options: CarouselOptions(
                        initialPage: 0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        reverse: false,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayAnimationDuration: Duration(milliseconds: 300),
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
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

//class ItemList extends StatelessWidget {
//  dynamic data;
//  int index;
//  List list;
//
//  ItemList({this.data, this.index, this.list});
//
//  int toInt(String str) {
//    var myInt = int.parse(str);
//    assert(myInt is int);
//    return myInt;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Container(
////      shrinkWrap: true,
////      itemCount: list == null ? 0 : list.length,
////      itemBuilder: (context, i) {
//      child: new Container(
//        padding: const EdgeInsets.all(10.0),
//        child: new GestureDetector(
//          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//              builder: (BuildContext context) => new DetailPage(
//                    list: list,
//                    index: index,
//                  ))),
//          child: new Card(
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(10.0),
//            ),
//            child: Row(
//              children: <Widget>[
//                Container(
//                  width: 120,
//                  height: 200,
//                  decoration: BoxDecoration(
//                    borderRadius:
//                    new BorderRadius.all(const Radius.circular(10.0)),
//                    image: DecorationImage(
//                        image: NetworkImage('https://genius.remax.co.id/papi/' +
//                            data['listThumbnail']),
//                        fit: BoxFit.cover),
//                  ),
//                ),
//                Flexible(
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Container(
//                            margin: EdgeInsets.only(left: 10.0, right: 10.0),
//                            child: Align(
//                              alignment: Alignment.centerLeft,
//                              child: new Text(
//                                data['listTitle'],
//                                overflow: TextOverflow.ellipsis,
//                                maxLines: 3,
//                                style: new TextStyle(
//                                  fontSize: 13.0,
//                                  color: Colors.black,
//                                  fontWeight: FontWeight.bold,
//                                ),
//                              ),
//                            ),
//                          ),
//                          data['links']['listListingCategoryId'] == "1"
//                              ? Row(children: <Widget>[
//                            Container(
//                              margin:
//                              EdgeInsets.only(left: 10.0, right: 10.0),
//                              child: Align(
//                                alignment: Alignment.centerLeft,
//                                child: new Text(
//                                  NumberFormat.compactCurrency(
//                                      locale: 'id',
//                                      symbol: 'Rp ',
//                                      decimalDigits: 0)
//                                      .format(
//                                      toInt(data['listListingPrice'])),
//                                  style: new TextStyle(
//                                    fontSize: 21.0,
//                                    color: const Color(0xffDC1B2E),
//                                    fontWeight: FontWeight.bold,
//                                  ),
//                                ),
//                              ),
//                            ),
//                            new Text(
//                              "DIJUAL",
//                              style: new TextStyle(
//                                  fontSize: 12.0,
//                                  color: const Color(0xffDC1B2E)),
//                            )
//                          ])
//                              : Row(children: <Widget>[
//                            Container(
//                              margin:
//                              EdgeInsets.only(left: 10.0, right: 10.0),
//                              child: Align(
//                                alignment: Alignment.centerLeft,
//                                child: new Text(
//                                  NumberFormat.compactCurrency(
//                                      locale: 'id',
//                                      symbol: 'Rp ',
//                                      decimalDigits: 0)
//                                      .format(
//                                      toInt(data['listListingPrice'])),
//                                  style: new TextStyle(
//                                    fontSize: 21.0,
//                                    color: const Color(0xff1A3668),
//                                    fontWeight: FontWeight.bold,
//                                  ),
//                                ),
//                              ),
//                            ),
//                            new Text(
//                              "DISEWAKAN",
//                              style: new TextStyle(
//                                  fontSize: 12.0,
//                                  color: const Color(0xff1A3668)),
//                            )
//                          ]),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.start,
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Column(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  new Container(
//                                    margin: EdgeInsets.only(
//                                        left: 15.0, right: 15.0, top: 5.0),
//                                    child: new Align(
//                                        alignment: Alignment.centerLeft,
//                                        child: Row(
//                                          children: <Widget>[
//                                            SvgPicture.asset(
//                                              "assets/icons/home.svg",
//                                              height: 15.0,
//                                            ),
//                                            SizedBox(
//                                              width: 5.0,
//                                            ),
//                                            data['listBuildingSize'] != null
//                                                ? new Text(
//                                              data['listBuildingSize'] +
//                                                  '(m2)',
//                                              style: new TextStyle(
//                                                fontSize: 10.0,
//                                                fontWeight: FontWeight.bold,
//                                              ),
//                                            )
//                                                : new Text('-',
//                                                style: new TextStyle(
//                                                  fontSize: 10.0,
//                                                  fontWeight: FontWeight.bold,
//                                                ))
//                                          ],
//                                        )),
//                                  ),
//                                  SizedBox(
//                                    height: 5.0,
//                                  ),
//                                  new Container(
//                                    margin:
//                                    EdgeInsets.only(left: 15.0, right: 15.0),
//                                    child: new Align(
//                                        alignment: Alignment.centerLeft,
//                                        child: Row(
//                                          children: <Widget>[
//                                            SvgPicture.asset(
//                                              "assets/icons/sofa.svg",
//                                              height: 15.0,
//                                            ),
//                                            SizedBox(
//                                              width: 5.0,
//                                            ),
//                                            data['listBedroom'] != null
//                                                ? new Text(
//                                              data['listBedroom'],
//                                              style: new TextStyle(
//                                                fontSize: 10.0,
//                                                fontWeight: FontWeight.bold,
//                                              ),
//                                            )
//                                                : new Text('-',
//                                                style: new TextStyle(
//                                                  fontSize: 10.0,
//                                                  fontWeight: FontWeight.bold,
//                                                ))
//                                          ],
//                                        )),
//                                  ),
//                                ],
//                              ),
//                              Column(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  new Container(
//                                    margin: EdgeInsets.only(
//                                        left: 15.0, right: 15.0, top: 5.0),
//                                    child: new Align(
//                                        alignment: Alignment.centerLeft,
//                                        child: Row(
//                                          children: <Widget>[
//                                            SvgPicture.asset(
//                                              "assets/icons/size.svg",
//                                              height: 15.0,
//                                            ),
//                                            SizedBox(
//                                              width: 5.0,
//                                            ),
//                                            data['listLandSize'] != null
//                                                ? new Text(
//                                              data['listLandSize'] + '(m2)',
//                                              style: new TextStyle(
//                                                fontSize: 10.0,
//                                                fontWeight: FontWeight.bold,
//                                              ),
//                                            )
//                                                : new Text('-',
//                                                style: new TextStyle(
//                                                  fontSize: 10.0,
//                                                  fontWeight: FontWeight.bold,
//                                                ))
//                                          ],
//                                        )),
//                                  ),
//                                  new Container(
//                                    margin: EdgeInsets.only(
//                                        left: 15.0, right: 15.0, top: 5.0),
//                                    child: new Align(
//                                        alignment: Alignment.centerLeft,
//                                        child: Row(
//                                          children: <Widget>[
//                                            SvgPicture.asset(
//                                              "assets/icons/bathub.svg",
//                                              height: 15.0,
//                                            ),
//                                            SizedBox(
//                                              width: 5.0,
//                                            ),
//                                            data['listBathroom'] != null
//                                                ? new Text(
//                                              data['listBathroom'],
//                                              style: new TextStyle(
//                                                fontSize: 10.0,
//                                                fontWeight: FontWeight.bold,
//                                              ),
//                                            )
//                                                : new Text('-',
//                                                style: new TextStyle(
//                                                  fontSize: 10.0,
//                                                  fontWeight: FontWeight.bold,
//                                                ))
//                                          ],
//                                        )),
//                                  ),
//                                ],
//                              ),
//                            ],
//                          ),
//                          Row(
//                            children: <Widget>[
//                              GestureDetector(
//                                onTap: (){
//                                  share(widget.data['id'], widget.data['listTitle']);
//                                },
//                                child: new Container(
//                                  margin: EdgeInsets.only(
//                                      left: 10.0),
//                                  child: new Align(
//                                      alignment: Alignment.centerLeft,
//                                      child: Row(
//                                        children: <Widget>[
//                                          SvgPicture.asset(
//                                            "assets/icons/share.svg",
//                                          ),
//                                        ],
//                                      )),
//                                ),
//                              ),
//                              Spacer(),
//                              FutureBuilder(
//                                  future: checkfav(toInt(widget.data['id'])),
//                                  builder: (context, snapshot) {
//                                    if (snapshot.hasError) print(snapshot.error);
//                                    if (snapshot.data) {
//                                      return GestureDetector(
//                                        onTap: (){
//                                          _deletefav(toInt(widget.data['id']));
//                                          // do something
//                                          setState(() {});
//                                        },
//                                        child: Card(
//                                          margin: EdgeInsets.only(right: 10.0),
//                                          elevation: 2.0,
//                                          color: kRedColor,
//                                          child: Container(
//                                            margin: EdgeInsets.all(6.0),
//                                            child: Icon(
//                                              Icons.favorite,
//                                              color: Colors.white,
//                                              size: 15.0,
//                                            ),
//                                          ),
//                                          shape: CircleBorder(),
//                                        ),
//                                      );
//                                    } else {
//                                      return GestureDetector(
//                                        onTap: (){
//                                          _handleSubmitted(
//                                            toInt(widget.data['id']),
//                                            widget.data['listTitle'],
//                                            widget.data['listThumbnail'],
//                                            widget.data['listListingPrice'],
//                                            widget.data['links']
//                                            ['listListingCategoryId'],
//                                            listMedia.length.toString(),
//                                            widget.data['listBedroom'],
//                                            widget.data['listBathroom'],
//                                            widget.data['listBuildingSize'],
//                                            widget.data['listLandSize'],
//                                          );
//                                          // do something
//                                          setState(() {});
//                                        },
//                                        child: Card(
//                                          margin: EdgeInsets.only(right: 10.0),
//                                          elevation: 2.0,
//                                          //fillColor: Colors.white,
//                                          child: Container(
//                                            margin: EdgeInsets.all(6.0),
//                                            child: Icon(
//                                              Icons.favorite_border,
//                                              size: 15.0,
//                                            ),
//                                          ),
//                                          shape: CircleBorder(),
//                                        ),
//                                      );
//                                    }
//                                  }),
//
//                            ],
//                          ),
//                        ],
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ),
//      ),
//      //},
//    );
//  }
//}

class ItemList extends StatefulWidget {
  dynamic data;
  int index;
  List list;

  ItemList({this.data, this.index, this.list});

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
        chooserTitle: 'Choose application');
  }

  Future<String> getDataKota(String idKota) async {
    final response =
        await http.get("https://genius.remax.co.id/papi/City/$idKota");
    String prov = json.decode(response.body)['data']['mctyDescription'];
    return prov;
  }

  Future<String> getDataProv(String idProv) async {
    final response =
        await http.get("https://genius.remax.co.id/papi/Province/$idProv");
    String prov = json.decode(response.body)['data']['mprvDescription'];
    return prov;
  }

  Future<String> getDataNegara(String idNegara) async {
    final response =
        await http.get("https://genius.remax.co.id/papi/Country/$idNegara");
    String prov = json.decode(response.body)['data']['mctrDescription'];
    return prov;
  }

  String label_loading = "";
  getPrefBahasa() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    label_loading = "Loading";
    if (preferences.getString("bahasa") != null) {
      if (preferences.getString("bahasa") == "Indonesian") {
        label_loading = "Memuat";
      } else {
        label_loading = "Loading";
      }
      setState(() {
        label_loading = label_loading;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrefBahasa();
  }

  @override
  Widget build(BuildContext context) {
    listMedia = widget.data['links']['listFile'];
    return new Container(
//      shrinkWrap: true,
//      itemCount: list == null ? 0 : list.length,
//      itemBuilder: (context, i) {
      child: new Container(
        padding: const EdgeInsets.all(10.0),
        child: new GestureDetector(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new DetailPage(
                    list: widget.list,
                    index: widget.index,
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
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(10.0)),
                      image: DecorationImage(
                          image: widget.data['listThumbnail'] != null
                              ? NetworkImage(
                                  'https://genius.remax.co.id/papi/' +
                                      widget.data['listThumbnail'] +
                                      '?size=256,256')
                              : NetworkImage('-'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: new BorderRadius.only(
                          bottomRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0)),
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
                                widget.data['listTitle'],
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
                          widget.data['links']['listListingCategoryId'] == "1"
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
                                            .format(toInt(widget
                                                .data['listListingPrice'])),
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
                                            .format(toInt(widget
                                                .data['listListingPrice'])),
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
                                            widget.data['listBuildingSize'] !=
                                                    null
                                                ? new Text(
                                                    widget.data[
                                                            'listBuildingSize'] +
                                                        '(m2)',
                                                    style: new TextStyle(
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                : new Text('-',
                                                    style: new TextStyle(
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ))
                                          ],
                                        )),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  new Container(
                                    margin: EdgeInsets.only(
                                        left: 15.0, right: 15.0),
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
                                            widget.data['listBedroom'] != null
                                                ? new Text(
                                                    widget.data['listBedroom'],
                                                    style: new TextStyle(
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                : new Text('-',
                                                    style: new TextStyle(
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                            widget.data['listLandSize'] != null
                                                ? new Text(
                                                    widget.data[
                                                            'listLandSize'] +
                                                        '(m2)',
                                                    style: new TextStyle(
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                : new Text('-',
                                                    style: new TextStyle(
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                            widget.data['listBathroom'] != null
                                                ? new Text(
                                                    widget.data['listBathroom'],
                                                    style: new TextStyle(
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                : new Text('-',
                                                    style: new TextStyle(
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ))
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          new Container(
                            margin: EdgeInsets.only(top: 10.0, left: 15.0),
                            child: new Row(
                              children: <Widget>[
                                new Container(
                                    child: SvgPicture.asset(
                                  "assets/icons/domisili.svg",
                                  color: kRedColor,
                                )),
                                new SizedBox(
                                  width: 4.0,
                                ),
                                new FutureBuilder<String>(
                                  future: getDataKota(
                                      widget.data['links']['listCityId']),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError)
                                      print(snapshot.error);
                                    return snapshot.hasData
                                        ? new Text(snapshot.data,
                                            style: new TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold))
                                        : new Text("$label_loading....",
                                            style: new TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    const Color(0xff767472)));
                                  },
                                ),
                                new FutureBuilder<String>(
                                  future: getDataProv(
                                      widget.data['links']['listProvinceId']),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError)
                                      print(snapshot.error);
                                    return snapshot.hasData
                                        ? new Text(', ' + snapshot.data,
                                            style: new TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold))
                                        : new Text("$label_loading....",
                                            style: new TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    const Color(0xff767472)));
                                  },
                                ),
                                // new FutureBuilder<String>(
                                //   future: getDataNegara(
                                //       widget.data['links']['listCountryId']),
                                //   builder: (context, snapshot) {
                                //     if (snapshot.hasError) print(snapshot.error);
                                //     return snapshot.hasData
                                //         ? new Text(', ' + snapshot.data,
                                //             style: new TextStyle(
                                //                 fontSize: 12.0,
                                //                 fontWeight: FontWeight.bold))
                                //         : new Text("Loading....",
                                //             style: new TextStyle(
                                //                 fontSize: 12.0,
                                //                 fontWeight: FontWeight.bold,
                                //                 color: const Color(0xff767472)));
                                //   },
                                // ),
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  share(widget.data['id'],
                                      widget.data['listTitle']);
                                },
                                child: new Container(
                                  margin: EdgeInsets.only(left: 10.0),
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
                              FutureBuilder(
                                  future: checkfav(toInt(widget.data['id'])),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError)
                                      print(snapshot.error);
                                    if (snapshot.data) {
                                      return GestureDetector(
                                        onTap: () {
                                          _deletefav(toInt(widget.data['id']));
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
                                    } else {
                                      return GestureDetector(
                                        onTap: () {
                                          _handleSubmitted(
                                            toInt(widget.data['id']),
                                            widget.data['listTitle'],
                                            widget.data['listThumbnail'],
                                            widget.data['listListingPrice'],
                                            widget.data['links']
                                                ['listListingCategoryId'],
                                            listMedia.length.toString(),
                                            widget.data['listBedroom'],
                                            widget.data['listBathroom'],
                                            widget.data['listBuildingSize'],
                                            widget.data['listLandSize'],
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
