import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:remax_app/model/todo_item.dart';
import 'package:remax_app/screens/detail/components/listing_by_office.dart';
import 'package:remax_app/util/constants.dart';
import 'package:remax_app/util/database_client.dart';
import 'package:remax_app/util/date_formatter.dart';

class DetailPage extends StatefulWidget {
  List list;
  int index;

  DetailPage({this.index, this.list});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var db = DatabaseHelper();

  List<dynamic> imgSlider() {
    List<dynamic> data = widget.list[widget.index]['links']['listFile'];
    return data;
  }

  Future<String> getDataKota() async {
    final response = await http.get(
        "https://genius.remax.co.id/papi/City/${widget.list[widget.index]['links']['listCityId']}");
    String prov = json.decode(response.body)['data']['mctyDescription'];
    return prov;
  }

  Future<String> getDataProv() async {
    final response = await http.get(
        "https://genius.remax.co.id/papi/Province/${widget.list[widget.index]['links']['listProvinceId']}");
    String prov = json.decode(response.body)['data']['mprvDescription'];
    return prov;
  }

  Future<String> getDataNegara() async {
    final response = await http.get(
        "https://genius.remax.co.id/papi/Country/${widget.list[widget.index]['links']['listCountryId']}");
    String prov = json.decode(response.body)['data']['mctrDescription'];
    return prov;
  }

  Future<String> getPropertyType() async {
    final response = await http.get(
        "https://genius.remax.co.id/papi/PropertyType/${widget.list[widget.index]['links']['listPropertyTypeId']}");
    String type = json.decode(response.body)['data']['prtlName']['id_ID'];
    return type;
  }

  Future<List<dynamic>> getDataMemberFoto() async {
    final response = await http.get(
        "https://genius.remax.co.id/papi/Membership/${widget.list[widget.index]['links']['listMmbsId']}");
    List<dynamic> data =
        json.decode(response.body)['data']['links']['mmbsFile'];
    return data;
  }

  Future<Map<String, dynamic>> getDataMember() async {
    final response = await http.get(
        "https://genius.remax.co.id/papi/Membership/${widget.list[widget.index]['links']['listMmbsId']}");
    Map<String, dynamic> data = json.decode(response.body)['data'];
    return data;
  }

  int toInt(String str) {
    var myInt = int.parse(str);
    assert(myInt is int);
    return myInt;
  }

  void _handleSubmitted(int id, String title, String thumbnail, String price,
      String category) async {
    TodoItem noDoItem =
        TodoItem(id, title, thumbnail, price, category, dateFormatted());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kAppBarColorTheme, //change your color here
        ),
        title: Text(
          "Detail",
          style: TextStyle(color: kAppBarColorTheme),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          FutureBuilder(
              future: checkfav(toInt(widget.list[widget.index]['id'])),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (snapshot.data) {
                  return IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: kAppBarColorTheme,
                    ),
                    onPressed: () {
                      _deletefav(toInt(widget.list[widget.index]['id']));
                      // do something
                      setState(() {});
                    },
                  );
                } else {
                  return IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      _handleSubmitted(
                          toInt(widget.list[widget.index]['id']),
                          widget.list[widget.index]['listTitle'],
                          widget.list[widget.index]['listThumbnail'],
                          widget.list[widget.index]['listListingPrice'],
                          widget.list[widget.index]['links']
                              ['listListingCategoryId']);
                      // do something
                      setState(() {});
                    },
                  );
                }
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              //height: 300,
              height: MediaQuery.of(context).size.height * .65,
              child: Carousel(
                dotBgColor: Colors.transparent,
                dotSize: 4.0,
                dotSpacing: 10.0,
                dotVerticalPadding: 50,
                images: imgSlider().map((fileImage) {
                  return Container(
                    child: ClipRRect(
                      child: GestureDetector(
                        child: Image.network(
                          'https://genius.remax.co.id/papi/Listing/crud/${widget.list[widget.index]['id']}/links/ListingFile/${fileImage}',
                          width: 10000,
                          fit: BoxFit.cover,
                        ),
                        onTap: () async {
                          await showDialog(
                            builder: (_) => ImageDialog(imgSlider(),
                                'https://genius.remax.co.id/papi/Listing/crud/${widget.list[widget.index]['id']}/links/ListingFile/'),
                            context: context,
                          );
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            new Container(
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .58),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.white),
                child: Column(
                  children: [
                    // new Container(
                    //   margin: EdgeInsets.all(15.0),
                    //   child: new Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: new Text(
                    //       "Detail Informasi",
                    //       style: new TextStyle(
                    //           fontSize: 25.0, color: const Color(0xff1A3668)),
                    //     ),
                    //   ),
                    // ),
                    // new Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Container(
                    //     margin: EdgeInsets.only(left: 15.0),
                    //     width: 40,
                    //     height: 2,
                    //     color: const Color(0xffDC1B2E),
                    //   ),
                    // ),
                    new Container(
                      margin: EdgeInsets.only(top: 25.0, left: 15.0),
                      child: new Row(
                        children: <Widget>[
                          new Text(
                            "ID ",
                            style: new TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                          new Text(
                            "#${widget.list[widget.index]['listIdListing']}",
                            style: new TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xffDC1B2E)),
                          ),
                        ],
                      ),
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
                            future: getDataKota(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) print(snapshot.error);
                              return snapshot.hasData
                                  ? new Text(snapshot.data,
                                      style: new TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold))
                                  : new Text("Loading....",
                                      style: new TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xff767472)));
                            },
                          ),
                          new FutureBuilder<String>(
                            future: getDataProv(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) print(snapshot.error);
                              return snapshot.hasData
                                  ? new Text(', ' + snapshot.data,
                                      style: new TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold))
                                  : new Text("Loading....",
                                      style: new TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xff767472)));
                            },
                          ),
                          new FutureBuilder<String>(
                            future: getDataNegara(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) print(snapshot.error);
                              return snapshot.hasData
                                  ? new Text(', ' + snapshot.data,
                                      style: new TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold))
                                  : new Text("Loading....",
                                      style: new TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xff767472)));
                            },
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      margin:
                          EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                      child: new Align(
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          widget.list[widget.index]['listTitle'],
                          style: new TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // new Container(
                    //   margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                    //   child: new Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: new Text(
                    //       widget.list[widget.index]['listStreetName'],
                    //       style: new TextStyle(
                    //           fontSize: 18.0, color: const Color(0xff767472)),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //Center Row contents vertically,
                        children: <Widget>[
                          new Container(
                            margin: EdgeInsets.all(10.0),
                            child: new Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      "assets/icons/sofa.svg",
                                      height: 20.0,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    widget.list[widget.index]['listBedroom'] !=
                                            null
                                        ? new Text(
                                            widget.list[widget.index]
                                                ['listBedroom'],
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : new Text('-',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold))
                                  ],
                                )),
                          ),
                          new Container(
                            margin: EdgeInsets.all(10.0),
                            child: new Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      "assets/icons/bathub.svg",
                                      height: 20.0,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    widget.list[widget.index]['listBathroom'] !=
                                            null
                                        ? new Text(
                                            widget.list[widget.index]
                                                ['listBathroom'],
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : new Text('-',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold))
                                  ],
                                )),
                          ),
                          new Container(
                            margin: EdgeInsets.all(10.0),
                            child: new Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      "assets/icons/home.svg",
                                      height: 20.0,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    widget.list[widget.index]
                                                ['listBuildingSize'] !=
                                            null
                                        ? new Text(
                                            widget.list[widget.index]
                                                    ['listBuildingSize'] +
                                                '(m2)',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : new Text('-',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold))
                                  ],
                                )),
                          ),
                          new Container(
                            margin: EdgeInsets.all(10.0),
                            child: new Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      "assets/icons/size.svg",
                                      height: 20.0,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    widget.list[widget.index]['listLandSize'] !=
                                            null
                                        ? new Text(
                                            widget.list[widget.index]
                                                    ['listLandSize'] +
                                                '(m2)',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : new Text('-',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold))
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    // new Container(
                    //   margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    //   child: new Row(
                    //     children: <Widget>[
                    //       new Text(
                    //         "Kota: ",
                    //         style: new TextStyle(fontSize: 15.0),
                    //       ),
                    //       new FutureBuilder<String>(
                    //         future: getDataKota(),
                    //         builder: (context, snapshot) {
                    //           if (snapshot.hasError) print(snapshot.error);
                    //           return snapshot.hasData
                    //               ? new Text(snapshot.data,
                    //               style: new TextStyle(fontSize: 15.0))
                    //               : new Text("Loading....",
                    //               style: new TextStyle(
                    //                   fontSize: 15.0,
                    //                   color: const Color(0xff767472)));
                    //         },
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // new Container(
                    //   margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    //   child: new Row(
                    //     children: <Widget>[
                    //       new Text(
                    //         "Provinsi: ",
                    //         style: new TextStyle(fontSize: 15.0),
                    //       ),
                    //       new FutureBuilder<String>(
                    //         future: getDataProv(),
                    //         builder: (context, snapshot) {
                    //           if (snapshot.hasError) print(snapshot.error);
                    //           return snapshot.hasData
                    //               ? new Text(snapshot.data,
                    //               style: new TextStyle(fontSize: 15.0))
                    //               : new Text("Loading....",
                    //               style: new TextStyle(
                    //                   fontSize: 15.0,
                    //                   color: const Color(0xff767472)));
                    //         },
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // new Container(
                    //   margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    //   child: new Row(
                    //     children: <Widget>[
                    //       new Text(
                    //         "Negara: ",
                    //         style: new TextStyle(fontSize: 15.0),
                    //       ),
                    //       new FutureBuilder<String>(
                    //         future: getDataNegara(),
                    //         builder: (context, snapshot) {
                    //           if (snapshot.hasError) print(snapshot.error);
                    //           return snapshot.hasData
                    //               ? new Text(snapshot.data,
                    //               style: new TextStyle(fontSize: 15.0))
                    //               : new Text("Loading....",
                    //               style: new TextStyle(
                    //                   fontSize: 15.0,
                    //                   color: const Color(0xff767472)));
                    //         },
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // new Container(
                    //   margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
                    //   child: new Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: new Text(
                    //       "Deskripsi",
                    //       style: new TextStyle(
                    //         fontSize: 23.0,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    new Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: new Align(
                        alignment: Alignment.centerLeft,
                        child: Html(
                            data: widget.list[widget.index]['listDescription']),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15.0),
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              new Text(
                                NumberFormat.compactCurrency(
                                        locale: 'id',
                                        symbol: 'Rp ',
                                        decimalDigits: 0)
                                    .format(toInt(widget.list[widget.index]
                                        ['listListingPrice'])),
                                style: new TextStyle(
                                  color: kRedColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              widget.list[widget.index]['links']
                                          ['listListingCategoryId'] ==
                                      "1"
                                  ? Text(
                                      "(DIJUAL)",
                                      style: TextStyle(color: kRedColor),
                                    )
                                  : Text(
                                      "(DISEWAKAN)",
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      margin:
                          EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                      child: Image.asset('assets/images/banner.jpg'),
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //       image: Image.asset(
                      //           'assets/asd/asd'),
                      //       fit: BoxFit.fill),
                      // ),
                    ),
                    new Container(
                      margin: EdgeInsets.all(8.0),
                      child: Card(
                        color: kPrimaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Apply KPR For This Listing',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.navigate_next,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      margin:
                          EdgeInsets.only(top: 15.0, left: 15.0, bottom: 10.0),
                      child: new Align(
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          "Property Specification",
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    new Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 15.0),
                        width: 40,
                        height: 2,
                        color: const Color(0xffDC1B2E),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.all(15.0),
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(15.0),
                          child: Table(
                            // textDirection: TextDirection.rtl,
                            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                            // border:TableBorder.all(width: 2.0,color: Colors.red),
                            children: [
                              TableRow(children: [
                                Container(
                                    margin: EdgeInsets.all(8),
                                    child: Text("Property Type")),
                                Container(
                                    margin: EdgeInsets.all(8),
                                    child: new FutureBuilder<String>(
                                      future: getPropertyType(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError)
                                          print(snapshot.error);
                                        return snapshot.hasData
                                            ? new Text(snapshot.data,
                                                style: new TextStyle(
                                                    fontSize: 12.0,
                                                    fontWeight:
                                                        FontWeight.bold))
                                            : new Text("Loading....",
                                                style: new TextStyle(
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color(
                                                        0xff767472)));
                                      },
                                    ))
                              ]),
                              TableRow(
                                  decoration:
                                      BoxDecoration(color: kTableRowColor),
                                  children: [
                                    Container(
                                        margin: EdgeInsets.all(8),
                                        child: Text("Ownership Rights")),
                                    Container(
                                        margin: EdgeInsets.all(8),
                                        child: Text("Building Rights")),
                                  ]),
                              TableRow(children: [
                                Container(
                                    margin: EdgeInsets.all(8),
                                    child: Text("Bedroom")),
                                Container(
                                    margin: EdgeInsets.all(8),
                                    child: widget.list[widget.index]
                                                ['listBedroom'] !=
                                            null
                                        ? new Text(
                                            widget.list[widget.index]
                                                ['listBedroom'],
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : new Text('-',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold))),
                              ]),
                              TableRow(
                                  decoration:
                                      BoxDecoration(color: kTableRowColor),
                                  children: [
                                    Container(
                                        margin: EdgeInsets.all(8),
                                        child: Text("Bathroom")),
                                    Container(
                                        margin: EdgeInsets.all(8),
                                        child: widget.list[widget.index]
                                                    ['listBathroom'] !=
                                                null
                                            ? new Text(
                                                widget.list[widget.index]
                                                    ['listBathroom'],
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : new Text('-',
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                  ]),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ListingByProfil(),
                    BtnListingByAgent(),
                    Container(
                      margin: EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Other Listings By Office')
                            ],
                          ),
                        ],
                      ),
                    ),
                    ListingByOffice()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container ListingByProfil() {
    return new Container(
      width: double.infinity,
      margin: EdgeInsets.all(15.0),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //Center Column contents vertically,
          crossAxisAlignment: CrossAxisAlignment.start,
          //Center Column contents horizontally,
          children: <Widget>[
            Container(margin: EdgeInsets.all(15.0), child: Text('Listing By:')),
            Row(
              children: <Widget>[
                new FutureBuilder<List<dynamic>>(
                  future: getDataMemberFoto(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? Container(
                            margin: EdgeInsets.all(10),
                            width: 80.0,
                            height: 80.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://genius.remax.co.id/papi/Membership/crud/${widget.list[widget.index]['links']['listMmbsId']}/links/MembershipFile/${snapshot.data[0]}?size=256,256'))))
                        : Container(
                            margin: EdgeInsets.all(10),
                            width: 80.0,
                            height: 80.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://remax.co.id/images/baloon.png?size=256,256'))));
                  },
                ),
                new FutureBuilder<Map<String, dynamic>>(
                  future: getDataMember(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    if (snapshot.hasData)  {
                      String lastname = snapshot.data['mmbsLastName'];
                      if(lastname == null){
                        lastname = "";
                      }
                      return Container(
                            margin: EdgeInsets.all(10.0),
                            child: Column(children: <Widget>[

                              new Text(
                                  snapshot.data['mmbsFirstName'] +
                                      ' ' +
                                      lastname,
                                  textAlign: TextAlign.center),
                            ]),
                          );
                    } else {
                      return new Text("Loading....",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 15.0,
                                color: const Color(0xff767472)));
                    }
                  },
                ),
              ],
            ),
            new FutureBuilder<Map<String, dynamic>>(
              future: getDataMember(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? Container(
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            //Center Column contents vertically,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //Center Column contents horizontally,
                            children: <Widget>[
                              Row(children: <Widget>[
                                SvgPicture.asset("assets/icons/call.svg"),
                                SizedBox(
                                  width: 10.0,
                                ),
                                new Text(snapshot.data['mmbsCellPhone1']),
                              ]),
                              Row(children: <Widget>[
                                SvgPicture.asset("assets/icons/mail.svg"),
                                SizedBox(
                                  width: 10.0,
                                ),
                                new Text(snapshot.data['mmbsEmail']),
                              ]),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  FlutterOpenWhatsapp.sendSingleMessage(
                                      snapshot.data['mmbsCellPhone1'], "");
                                },
                                child: Card(
                                  color: kBtnWa,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/whatsapp.png',
                                        height: 40.0,
                                        width: 40.0,
                                      ),
                                      Text(
                                        'Whatsapp',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                            ]),
                      )
                    : new Text("Loading....",
                        style: new TextStyle(
                            fontSize: 15.0, color: const Color(0xff767472)));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BtnListingByAgent extends StatelessWidget {
  const BtnListingByAgent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Card(
        color: kRedColor,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Listing By Agent',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.navigate_next,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//class ImageDialog extends StatelessWidget {
//  final String url;
//
//  ImageDialog(this.url);
//
//  @override
//  Widget build(BuildContext context) {
//    return Dialog(
//      child: Container(
//        width: double.infinity,
//        height: 300,
//        decoration:
//            BoxDecoration(image: DecorationImage(image: NetworkImage(url))),
//      ),
//    );
//  }
//}

class ImageDialog extends StatelessWidget {
  final List list;
  final String url;

  ImageDialog(this.list, this.url);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: CarouselSlider(
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              height: MediaQuery.of(context).size.height,
              items: list.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      //decoration: BoxDecoration(color: Colors.white),
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            child: PinchZoom(
                              image: Container(
                                child: ClipRRect(child: Image.network(url + i)),
                              ),
                              zoomedBackgroundColor: Colors.black.withOpacity(0.1),
                              resetDuration: const Duration(milliseconds: 100),
                              maxScale: 2.5,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: kRedColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(14.0),
                  ),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
