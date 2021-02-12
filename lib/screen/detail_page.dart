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
//  static final List<String> imgSlider = [
//    '241027',
//    '241028',
//    '241029',
//    '241030',
//    '241031'
//  ];
  //static final List<String> imgSlider = DetailPage().list[DetailPage().index]['links']['listFile'];

  List<dynamic> imgSlider() {
    List<dynamic> data = widget.list[widget.index]['links']['listFile'];
    return data;
  }

  Future<String> getDataProv() async {
    final response = await http.get("https://genius.remax.co.id/papi/Province/${widget.list[widget.index]['links']['listProvinceId']}");
    String prov = json.decode(response.body)['data']['mprvDescription'];
    return prov;
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
                  new Text("Listing ID ", style: new TextStyle(fontSize: 20.0),),
                  new Text("#${widget.list[widget.index]['listIdListing']}", style: new TextStyle(fontSize: 20.0, color: const Color(0xffDC1B2E)),),
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
            new Container(
              margin: EdgeInsets.all(15.0),
              child: new Row(
                children: <Widget>[
                  new Text("Provinsi: ", style: new TextStyle(fontSize: 20.0),),
                  new FutureBuilder<String>(
                    future: getDataProv(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData
                          ? new Text(
                        snapshot.data,
                        style: new TextStyle(fontSize: 20.0)
                      )
                          : new Text(
                          "Loading....",
                          style: new TextStyle(fontSize: 20.0,color: const Color(0xff767472))
                      );
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
                child: Html(data:widget.list[widget.index]['listDescription']),
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
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(url))),
      ),
    );
  }
}
