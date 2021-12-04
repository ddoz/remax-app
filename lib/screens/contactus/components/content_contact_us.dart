import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContentContactUs extends StatefulWidget {
  @override
  _ContentContactUsState createState() => _ContentContactUsState();
}

class _ContentContactUsState extends State<ContentContactUs> {
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPhone = new TextEditingController();
  TextEditingController controllerMessage = new TextEditingController();

  String label_loading = "";
  String bahasa = "";
  getPrefBahasa() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    label_loading = "Loading";
    if (preferences.getString("bahasa") != null) {
      if (preferences.getString("bahasa") == "id_ID") {
        label_loading = "Memuat";
      } else {
        label_loading = "Loading";
      }
      setState(() {
        label_loading = label_loading;
        bahasa = preferences.getString("bahasa");
      });
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

  String validator() {
    String error = "kosong";
    if (controllerName.text.isEmpty) {
      error = (bahasa == "id_ID")
          ? "Nama Tidak Boleh Kosong"
          : "Please Input Your Name";
      return error;
    } else if (controllerEmail.text.isEmpty) {
      error = (bahasa == "id_ID")
          ? "Email tidak boleh kosong"
          : "Please Input Your Email";
      return error;
    } else if (!controllerEmail.text.contains('@')) {
      error = (bahasa == "id_ID")
          ? "Masukkan email yang benar"
          : "Please Input Valid Email";
      return error;
    } else if (controllerPhone.text.isEmpty) {
      error = (bahasa == "id_ID")
          ? "Phone tidak boleh kosong"
          : "Please Input your phone number";
      return error;
    } else if (!validateMobileNumber(controllerPhone.text)) {
      error = (bahasa == "id_ID")
          ? "Masukkan nomor telepon yang valid"
          : "Please Input valid phone number";
      return error;
    } else if (controllerMessage.text.isEmpty) {
      error = (bahasa == "id_ID")
          ? "Pesan tidak boleh kosong"
          : "Please Input your message";
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
        "ictsCustomerBody": controllerMessage.text,
        "ictsCustomerEmail": controllerEmail.text,
        "ictsCustomerName": controllerName.text,
        "ictsCustomerPhone": controllerPhone.text,
        "ictsToken": "prodesend27701",
        "links": {"ictsMscuId": 1}
      };

      var body = json.encode(dataListing);

      try {
        final response = await http.post(
            "https://genius.remax.co.id/papi/inquirycontactus/crud",
            body: body);

        final data = jsonDecode(response.body);

        String message = data['status']['message'];

        if (message == "Data Created") {
          message = (bahasa == "Indonesia")
              ? "Data berhasil dikirim"
              : "Data has been sent";
        }

        Navigator.pop(context);

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
    super.initState();
    getPrefBahasa();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      padding:
          new EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        child: Column(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(top: 20.0, left: 15.0, bottom: 10.0),
              child: new Align(
                alignment: Alignment.centerLeft,
                child: new Text(
                  'Quick Support',
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
              margin: EdgeInsets.only(
                  top: 20.0, left: 15.0, right: 15.0, bottom: 10.0),
              child: new Align(
                alignment: Alignment.centerLeft,
                child: new Text(
                  'For quick information, you can get all contact information',
                  style: new TextStyle(
                      fontSize: 13.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SvgPicture.asset("assets/icons/location.svg"),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Jl. Jendral Sudirman Kav. 52 - 53 (SCBD) \nJakarta - 12190\nIndonesia',
                    style: new TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SvgPicture.asset("assets/icons/call_sc.svg"),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '+62 21 5151 393',
                    style: new TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 10.0, left: 15.0, right: 15.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SvgPicture.asset("assets/icons/mail.svg"),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'info@remax.co.id',
                    style: new TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
              color: Colors.grey,
              child: SizedBox(
                  height: 1, width: MediaQuery.of(context).size.width * 0.8),
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
                          'Submit',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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
