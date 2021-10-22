import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/screens/agents/components/content_slide.dart';
import 'package:remax_app/screens/franchise/components/content_franchise.dart';
import 'package:remax_app/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                      // Container(
                      //     margin: EdgeInsets.only(top: 35.0),
                      //     child: ContentSlideAgents()),
                      PartnerCard(
                        number: "01",
                        text:
                        "When you join RE/MAX, you will be part of a marketing super power family with more than 125,000 marketing associates in more than 115 countries.",
                        image: "assets/images/bg_agents.png",
                        press: () {},
                      ),
                      PartnerCard(
                        number: "02",
                        text:
                        "Together with RE/MAX, you will receive structured training to increase your knowledge and marketing skills to market your salable listings. RE/MAX University, available only to RE/MAX associates 24 hours a day, offers the best training modules in the real estate industry.",
                        image: "assets/images/bg_agents.png",
                        press: () {},
                      ),
                      PartnerCard(
                        number: "03",
                        text:
                        "Our technology and mobile apps enable you to easily share your salable listings to your client with a push of a button. Direct connection with your clients increase the chance of selling your salable listings.",
                        image: "assets/images/bg_agents.png",
                        press: () {},
                      ),
                      PartnerCard(
                        number: "04",
                        text:
                        "Cloud based Genius application easily assist you in clear reports, easy and secure billing to your clients. QR code invoicing system ensures the safety of your transactions.",
                        image: "assets/images/bg_agents.png",
                        press: () {},
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                        child: Text(
                          'Are You Ready To Have A Sucessful Real Estate Career? Together with RE/MAX, Your Dreams Can Come True. Join Us Now!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          margin: EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 20.0, bottom: 40.0),
                          child: new OutlineButton(
                            shape: StadiumBorder(),
                            textColor: kRedColor,
                            child: Text('Click Here to Join Us'),
                            borderSide: BorderSide(
                                color: kRedColor,
                                style: BorderStyle.solid,
                                width: 1),
                            onPressed: () async {
                              await showDialog(
                                builder: (_) => ImageDialogKantor(),
                                context: context,
                              );
                            },
                          ))
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

class ImageDialog extends StatefulWidget {
  final String assets;
  final String judul;
  final String deskripsi;

  ImageDialog(this.assets, this.judul, this.deskripsi);

  @override
  State<ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPhone = new TextEditingController();
  TextEditingController controllerMessage = new TextEditingController();

  String label_loading = "";

  String labeling = "";
  String labeling_body = "";
  String bahasa = "";
  getPrefBahasa() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    labeling = "Loading";
    if (preferences.getString("bahasa") != null) {
      if (preferences.getString("bahasa") == "Indonesian") {
        labeling = "Kesempatan Penghasilan Tanpa Batas";
        labeling_body = "Miliki Usaha Anda Sendiri";
        label_loading = "Memuat";
      } else {
        labeling = "Unlimited Income Opportunities";
        labeling_body = "Own Your Business";
        label_loading = "Loading";
      }
      setState(() {
        label_loading = label_loading;
        labeling = labeling;
        labeling_body = labeling_body;
        bahasa = preferences.getString("bahasa");
      });
    } else {
      print('ora ono');
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            width: 10,
          ),
          Container(
              margin: EdgeInsets.only(left: 7),
              child: Text("$label_loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  String validator() {
    String error = "kosong";
    if (controllerName.text.isEmpty) {
      error = "Nama Tidak Boleh Kosong";
      return error;
    } else if (controllerEmail.text.isEmpty) {
      error = "Email tidak boleh kosong";
      return error;
    } else if (!controllerEmail.text.contains('@')) {
      error = "Masukkan email yang benar";
      return error;
    } else if (controllerPhone.text.isEmpty) {
      error = "Phone tidak boleh kosong";
      return error;
    } else if (!validateMobileNumber(controllerPhone.text)) {
      error = "Masukkan nomor telepon yang valid";
      return error;
    } else if (controllerMessage.text.isEmpty) {
      error = "Message tidak boleh kosong";
      return error;
    } else {
      return error;
    }
  }

  addData() async {
    print("addData");
    showLoaderDialog(context);
    if (validator() == "kosong") {
      Map dataListing = {
        "infsCustomerBody": controllerMessage.text,
        "infsCustomerEmail": controllerEmail.text,
        "infsCustomerName": controllerName.text,
        "infsCustomerPhone": controllerPhone.text,
        "infsToken": "prodesend27701"
      };

      var body = json.encode(dataListing);

      try {
        final response = await http.post(
            "https://genius.remax.co.id/papi/inquiryfranchise/crud",
            body: body);

        final data = jsonDecode(response.body);

        String message = data['status']['message'];

        Navigator.pop(context);

        if (message == "Data Created") {
          message = (bahasa == "Indonesia")
              ? "Data berhasil dikirim"
              : "Data has been sent";
        }

        _showToast(context, message);

        controllerName.text = "";
        controllerEmail.text = "";
        controllerPhone.text = "";
        controllerMessage.text = "";

        print(validator());
      } catch (e) {
        print(e);
      }
    } else {
      Navigator.pop(context);
      _showToast(context, validator());
      print(validator());
    }
  }

  void _showToast(BuildContext context, String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  bool validateMobileNumber(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (!regExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getPrefBahasa();
    super.initState();
  }

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
                    child: Text('$labeling',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold))),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Text(
                    '$labeling_body',
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
                          controller: controllerName,
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
                          controller: controllerEmail,
                          onChanged: (value) {},
                          keyboardType: TextInputType.emailAddress,
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
                      SvgPicture.asset(
                        "assets/icons/mail.svg",
                        color: kIconColor,
                      ),
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
                          controller: controllerPhone,
                          onChanged: (value) {},
                          keyboardType: TextInputType.number,
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
                      SvgPicture.asset("assets/icons/call_sc.svg",
                          color: kIconColor),
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
                          controller: controllerMessage,
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
                GestureDetector(
                  onTap: () {
                    addData();
                  },
                  child: new Container(
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
