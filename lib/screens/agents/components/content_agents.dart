import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/screens/agents/components/content_slide.dart';
import 'package:remax_app/util/constants.dart';

class ContentAgents extends StatefulWidget {
  @override
  _ContentAgentsState createState() => _ContentAgentsState();
}

class _ContentAgentsState extends State<ContentAgents> {
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
          new EdgeInsets.only(top: MediaQuery.of(context).size.height * .58),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0), color: Colors.white),
        child: new FutureBuilder<List<dynamic>>(
          future: getDataMemberFoto(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new Column(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.only(
                            top: 35.0, left: 15.0, bottom: 10.0),
                        child: new Align(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            snapshot.data[0]['wbilTitle'],
                            style: new TextStyle(
                                fontSize: 24.0,
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
                      Container(
                          margin: EdgeInsets.only(top: 35.0),
                          child: ContentSlideAgents()),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                        child: Text(
                            'Are You Ready To Have A Sucessful Real Estate Career? Together with RE/MAX, Your Dreams Can Come True. Join Us Now!',
                            textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Text(
                          '#StrongerTogether #UniteGrowWin!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kAppBarColorTheme,
                              fontSize: 18.0),
                        ),
                      ),
                      Container(
                        margin:  EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0, bottom: 40.0),
                        child: new OutlineButton(
                          shape: StadiumBorder(),
                          textColor: kRedColor,
                          child: Text('Click Here to Join Us'),
                          borderSide: BorderSide(
                              color: kRedColor, style: BorderStyle.solid,
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
                        )
                      )
                    ],
                  )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          },
        ),
      ),
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

