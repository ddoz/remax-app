import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/screens/agents/components/content_slide.dart';
import 'package:remax_app/util/constants.dart';

class ContentFranchise extends StatefulWidget {
  @override
  _ContentFranchiseState createState() => _ContentFranchiseState();
}

class _ContentFranchiseState extends State<ContentFranchise> {
  Future<List<dynamic>> getDataMemberFoto() async {
    final response =
        await http.get("https://genius.remax.co.id/papi/webagentinformation");
    List<dynamic> data = json.decode(response.body)['data'];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          new EdgeInsets.only(top: MediaQuery.of(context).size.height * .78),
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kRedGradient, kOrangeGradient]),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)),
              color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                margin: EdgeInsets.only(top: 25.0),
                child: new Align(
                  child: new Text(
                    'Training',
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              new Align(
                child: Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 20.0),
                  width: 35,
                  height: 2,
                  color: Colors.white,
                ),
              ),
              new Container(
                margin: EdgeInsets.only(top: 25.0),
                child: new Align(
                  child: new Text(
                    'Start Up Training',
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              new Container(
                margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                child: new Align(
                  child: new Text(
                    'RE/MAX provides the best training program that is offered in the industry.',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 40.0),
                  child: new OutlineButton(
                    shape: StadiumBorder(),
                    textColor: Colors.white,
                    child: Text('Read More'),
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1),
                    onPressed: () async {
                      await showDialog(
                        builder: (_) => ImageDialog(
                            'assets/images/fr_ct_1.png',
                            'Pelatihan Awal',
                            'Di seluruh dunia, RE/MAX berada di lebih dari 115 negara dan lebih dari 125,000 marketing associate terpercaya. Dengan kekuatan jaringan ini, RE/MAX menjadi pemimpin dalam industri real estate berskala dunia dengan memberikan pelayanan berkualitas dunia dan meraih hasil yang maksimal. Bersama dengan RE/MAX, anda memiliki peluang untuk mengembangkan bisnis anda tidak hanya secara nasional tetapi secara internasional.'),
                        context: context,
                      );
                    },
                  )),
              new Container(
                margin: EdgeInsets.only(top: 25.0),
                child: new Align(
                  child: new Text(
                    'On Going Training',
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              new Container(
                margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                child: new Align(
                  child: new Text(
                    'The advantage that you will gain by owning a RE/MAX office is not limited to classroom trainings but unlimited access to training 24 hours a day, 365 days a year.',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 40.0),
                  child: new OutlineButton(
                    shape: StadiumBorder(),
                    textColor: Colors.white,
                    child: Text('Read More'),
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1),
                    onPressed: () async {
                      await showDialog(
                        builder: (_) => ImageDialog(
                            'assets/images/fr_ct_2.png',
                            'Pelatihan Yang Berkesinambungan',
                            'RE/MAX memiliki kultur kekeluargaan yang erat dimana setiap personnel saling membangun dan membantu satu dengan yang lain agar dapat sama–sama mencapai hasil yang maksimal. Setiap tahun, RE/MAX mengadakan satu kali pertemuan antara negara Asia Pasifik dan satu kali pertemuan seluruh dunia di Amerika Serikat agar setiap anggotanya dapat membangun jaringan bisnis yang kuat, belajar dari satu dan yang lainnya, dan saling berkompetisi.'),
                        context: context,
                      );
                    },
                  )),
              Container(
                  margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
                  child: Image.asset('assets/images/baloon.png')),
              new Container(
                margin: EdgeInsets.only(top: 25.0),
                child: new Align(
                  child: new Text(
                    'Momentum',
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              new Container(
                margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                child: new Align(
                  child: new Text(
                    'A specialized training program created for business owners to understand the agency business on a deeper level.',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 40.0),
                  child: new OutlineButton(
                    shape: StadiumBorder(),
                    textColor: Colors.white,
                    child: Text('Read More'),
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1),
                    onPressed: () async {
                      await showDialog(
                        builder: (_) => ImageDialog(
                            'assets/images/fr_ct_3.png',
                            'Momentum',
                            'Usaha RE/MAX didasarkan dengan konsep kewirausahaan mandiri. Usaha yang sangat menggiurkan ini dapat dibangun menjadi usaha yang sangat besar dan luas dan dapat diwariskan ke generasi penerus. Walaupun berjalan dalam konsep kewirausahawaan, bersama RE/MAX anda tidak akan pernah sendirian. RE/MAX selalu siap untuk memberikan dukungan, pelatihan, dan bimbingan yang berkesinambungan agar anda mencapai cita-cita anda.'),
                        context: context,
                      );
                    },
                  )),
              new Container(
                margin: EdgeInsets.only(top: 25.0),
                child: new Align(
                  child: new Text(
                    'Bootcamp',
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              new Container(
                margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                child: new Align(
                  child: new Text(
                    'A specialized training for agents consisting of 12 modules is proven to increase productivity',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 40.0),
                  child: new OutlineButton(
                    shape: StadiumBorder(),
                    textColor: Colors.white,
                    child: Text('Read More'),
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1),
                    onPressed: () async {
                      await showDialog(
                        builder: (_) => ImageDialog(
                            'assets/images/fr_ct_4.png',
                            'Bootcamp',
                            'Teknologi RE/MAX menciptakan peluang usaha yang sangat besar diantara marketing associate dan klien. Teknologi Genius milik RE/MAX dirancang agar ramah pengguna dan dapat meningkatkan efektivitas dan efisiensi usaha anda.'),
                        context: context,
                      );
                    },
                  ))
            ],
          )),
    );
  }
}

class ImageDialog extends StatelessWidget {
  final String assets;
  final String judul;
  final String deskripsi;

  ImageDialog(this.assets, this.judul, this.deskripsi);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(assets),
                Container(
                  margin: EdgeInsets.only(top: 20.0, left: 15.0),
                  child: Text(
                    judul,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: kAppBarColorTheme),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(15.0),
                    child: Text(deskripsi, style: TextStyle(fontSize: 13.0)))
              ],
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
      ),
    );
  }
}



class ImageDialogKantor extends StatelessWidget {
  final String assets;
  final String judul;
  final String deskripsi;

  ImageDialogKantor(this.assets, this.judul, this.deskripsi);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(15.0),
                    child: Text('Kesempatan Penghasilan Tanpa Batas', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold))),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Miliki Usaha Anda Sendiri',
                    style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: kAppBarColorTheme),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 45,
                  decoration: BoxDecoration(
                    color: kLightGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            // surffix isn't working properly  with SVG
                            // thats why we use row
                            // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                          ),
                        ),
                      ),
                      SvgPicture.asset("assets/icons/person.svg"),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 45,
                  decoration: BoxDecoration(
                    color: kLightGrey,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            // surffix isn't working properly  with SVG
                            // thats why we use row
                            // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                          ),
                        ),
                      ),
                      SvgPicture.asset("assets/icons/mail.svg", color: kIconColor,),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 45,
                  decoration: BoxDecoration(
                    color: kLightGrey,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: "Phone",
                            hintStyle: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            // surffix isn't working properly  with SVG
                            // thats why we use row
                            // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                          ),
                        ),
                      ),
                      SvgPicture.asset("assets/icons/call_sc.svg", color: kIconColor),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 45,
                  decoration: BoxDecoration(
                    color: kLightGrey,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: "Domisili",
                            hintStyle: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            // surffix isn't working properly  with SVG
                            // thats why we use row
                            // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                          ),
                        ),
                      ),
                      SvgPicture.asset("assets/icons/domisili.svg", color: kIconColor),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 85,
                  decoration: BoxDecoration(
                    color: kLightGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: "Message",
                            hintStyle: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            // surffix isn't working properly  with SVG
                            // thats why we use row
                            // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                          ),
                        ),
                      ),
                      SvgPicture.asset("assets/icons/message.svg"),
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: Card(
                    color: kAppBarColorTheme,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Join',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
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
      ),
    );
  }
}