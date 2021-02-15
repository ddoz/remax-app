import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  List list;
  int index;

  DetailPage({this.index, this.list});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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

  Future<List<dynamic>> getDataMemberFoto() async {
    final response = await http.get(
        "https://genius.remax.co.id/papi/Membership/${widget.list[widget.index]['links']['listMmbsId']}");
    List<dynamic> data =
        json.decode(response.body)['data']['links']['mmbsFile'];
    return data;
  }

  Future<String> getDataMemberNama() async {
    final response = await http.get(
        "https://genius.remax.co.id/papi/Membership/${widget.list[widget.index]['links']['listMmbsId']}");
    String namadepan = json.decode(response.body)['data']['mmbsFirstName'];
    String namabelakang = json.decode(response.body)['data']['mmbsLastName'];
    return namadepan + ' ' + namabelakang;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1A3668),
        title: Text('Detail Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselSlider(
                items: imgSlider().map((fileImage) {
                  return Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: GestureDetector(
                        child: Image.network(
                          'https://genius.remax.co.id/papi/Listing/crud/${widget.list[widget.index]['id']}/links/ListingFile/${fileImage}',
                          width: 10000,
                          fit: BoxFit.cover,
                        ),
                        onTap: () async {
                          await showDialog(
                            builder: (_) => ImageDialog(
                                'https://genius.remax.co.id/papi/Listing/crud/${widget.list[widget.index]['id']}/links/ListingFile/${fileImage}'),
                            context: context,
                          );
                        },
                      ),
                    ),
                  );
                }).toList(),
                height: 150,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0),
            new Container(
              margin: EdgeInsets.all(15.0),
              child: new Align(
                alignment: Alignment.centerLeft,
                child: new Text(
                  "Informasi Detail",
                  style: new TextStyle(
                      fontSize: 25.0, color: const Color(0xff1A3668)),
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
              child: new Row(
                children: <Widget>[
                  new Text(
                    "Listing ID ",
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  new Text(
                    "#${widget.list[widget.index]['listIdListing']}",
                    style: new TextStyle(
                        fontSize: 20.0, color: const Color(0xffDC1B2E)),
                  ),
                ],
              ),
            ),
            new Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
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
            new Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
              child: new Align(
                alignment: Alignment.centerLeft,
                child: new Text(
                  widget.list[widget.index]['listStreetName'],
                  style: new TextStyle(
                      fontSize: 18.0, color: const Color(0xff767472)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: const Color(0xff1A3668)),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
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
                        child: Column(
                          children: <Widget>[
                            new Image.asset(
                              'assets/images/bed.png',
                              width: 40,
                              height: 40,
                              color: const Color(0xff1A3668),
                            ),
                            widget.list[widget.index]['listBedroom'] != null
                                ? new Text(
                                    widget.list[widget.index]['listBedroom'])
                                : new Text('0')
                          ],
                        )),
                  ),
                  new Container(
                    margin: EdgeInsets.all(10.0),
                    child: new Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: <Widget>[
                            new Image.asset('assets/images/bathtub.png',
                                width: 40,
                                height: 40,
                                color: const Color(0xff1A3668)),
                            widget.list[widget.index]['listBathroom'] != null
                                ? new Text(
                                    widget.list[widget.index]['listBathroom'])
                                : new Text('0')
                          ],
                        )),
                  ),
                  new Container(
                    margin: EdgeInsets.all(10.0),
                    child: new Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: <Widget>[
                            new Image.asset('assets/images/home.png',
                                width: 40,
                                height: 40,
                                color: const Color(0xff1A3668)),
                            widget.list[widget.index]['listBuildingSize'] !=
                                    null
                                ? new Text(widget.list[widget.index]
                                    ['listBuildingSize'])
                                : new Text('0')
                          ],
                        )),
                  ),
                  new Container(
                    margin: EdgeInsets.all(10.0),
                    child: new Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: <Widget>[
                            new Image.asset('assets/images/area.png',
                                width: 40,
                                height: 40,
                                color: const Color(0xff1A3668)),
                            widget.list[widget.index]['listLandSize'] != null
                                ? new Text(
                                    widget.list[widget.index]['listLandSize'])
                                : new Text('0')
                          ],
                        )),
                  ),
                ],
              ),
            ),
            new Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              child: new Row(
                children: <Widget>[
                  new Text(
                    "Kota: ",
                    style: new TextStyle(fontSize: 15.0),
                  ),
                  new FutureBuilder<String>(
                    future: getDataKota(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData
                          ? new Text(snapshot.data,
                              style: new TextStyle(fontSize: 15.0))
                          : new Text("Loading....",
                              style: new TextStyle(
                                  fontSize: 15.0,
                                  color: const Color(0xff767472)));
                    },
                  ),
                ],
              ),
            ),
            new Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              child: new Row(
                children: <Widget>[
                  new Text(
                    "Provinsi: ",
                    style: new TextStyle(fontSize: 15.0),
                  ),
                  new FutureBuilder<String>(
                    future: getDataProv(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData
                          ? new Text(snapshot.data,
                              style: new TextStyle(fontSize: 15.0))
                          : new Text("Loading....",
                              style: new TextStyle(
                                  fontSize: 15.0,
                                  color: const Color(0xff767472)));
                    },
                  ),
                ],
              ),
            ),
            new Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              child: new Row(
                children: <Widget>[
                  new Text(
                    "Negara: ",
                    style: new TextStyle(fontSize: 15.0),
                  ),
                  new FutureBuilder<String>(
                    future: getDataNegara(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData
                          ? new Text(snapshot.data,
                              style: new TextStyle(fontSize: 15.0))
                          : new Text("Loading....",
                              style: new TextStyle(
                                  fontSize: 15.0,
                                  color: const Color(0xff767472)));
                    },
                  ),
                ],
              ),
            ),
            new Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
              child: new Align(
                alignment: Alignment.centerLeft,
                child: new Text(
                  "Deskripsi",
                  style: new TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              child: new Align(
                alignment: Alignment.centerLeft,
                child: Html(data: widget.list[widget.index]['listDescription']),
              ),
            ),
            new Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: const Color(0xff1A3668)),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //Center Column contents vertically,
                crossAxisAlignment: CrossAxisAlignment.center,
                //Center Column contents horizontally,
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
                  new FutureBuilder<String>(
                    future: getDataMemberNama(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData
                          ? ListTile(
                              title: new Text(snapshot.data,
                                  textAlign: TextAlign.center),
                            )
                          : ListTile(
                              title: new Text("Loading....",
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontSize: 15.0,
                                      color: const Color(0xff767472))),
                            );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  final String url;

  ImageDialog(this.url);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.infinity,
        height: 300,
        decoration:
            BoxDecoration(image: DecorationImage(image: NetworkImage(url))),
      ),
    );
  }
}
