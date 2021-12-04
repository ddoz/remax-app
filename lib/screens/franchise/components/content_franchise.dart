import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/screens/agents/components/content_slide.dart';
import 'package:remax_app/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  String label_readMore = "";
  String label_kantor = "";
  String label_training = "";
  String label_contentItem1Title="";
  String label_contentItem1Sub="";
  String label_contentItem1Body="";
  String label_contentItem2Title="";
  String label_contentItem2Sub="";
  String label_contentItem2Body="";
  String label_contentItem3Title="";
  String label_contentItem3Sub="";
  String label_contentItem3Body="";
  String label_contentItem4Title="";
  String label_contentItem4Sub="";
  String label_contentItem4Body="";


  getPrefBahasa() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString("bahasa") != null) {
      print(preferences.getString("bahasa"));
      if (preferences.getString("bahasa") == "en") {
        label_readMore = "Read More";
        label_kantor = "Own a RE/MAX Office";
        label_training = "Training";
        label_contentItem1Title = "Start Up Training";
        label_contentItem1Sub = "RE/MAX provides the best training program that is offered in the industry.";
        label_contentItem1Body = "Across the world, the network of RE/MAX is in more than 115 countries and supported by more than 135,000 trusted marketing associates. With the power of this network, RE/MAX has become the leader in real estate industry, providing world class service and achieving maximum results. Together with RE/MAX, you have the opportunity to expand your business, not only nationally, but also internationally.";
        label_contentItem2Title = "Ongoing Training";
        label_contentItem2Sub = "The advantage that you will gain by owning a RE/MAX office is not limited to classroom trainings but unlimited access to training 24 hours a day, 365 days a year.";
        label_contentItem2Body = "RE/MAX builds a tight family culture which synergize and bring the best of each other so parties can achieve maximum results. Each year, RE/MAX held an Asia Pacific convention amongst the region and a global convention in the United States of America so each member can build its network, learn from each other, and compete to be the best";
        label_contentItem3Title = "Momentum";
        label_contentItem3Sub = "A specialized training program created for business owners to understand the agency business on a deeper level.";
        label_contentItem3Body = "The RE/MAX business is built on a entrepreneurial concept. This lucrative business can be built as big as an empire and can be passed down to generations. Even though it is an entrepreneurial concept, with RE/MAX, you are never alone. RE/MAX provides support, training and continuance guidance to assist you in achieving your goal.";
        label_contentItem4Title = "Bootcamp";
        label_contentItem4Sub = "A specialized training for agents consisting of 12 modules is proven to increase productivity.";
        label_contentItem4Body = "RE/MAX technologies create business opportunities between agents and clients. The Genius System is designed to be user friendly and will increase the effectiveness and efficiency of your business.";


      } else {
        label_readMore = "Baca lebih lanjut";
        label_kantor = "Miliki Kantor RE/MAX";
        label_training = "Pelatihan";
        label_contentItem1Title = "Pelatihan Awal";
        label_contentItem1Sub = "Anda dapat mengikuti program pelatihan yang terbaik yang ditawarkan industri ini.";
        label_contentItem1Body = "Di seluruh dunia, RE/MAX berada di lebih dari 115 negara dan lebih dari 135,000 marketing associate terpercaya. Dengan kekuatan jaringan ini, RE/MAX menjadi pemimpin dalam industri real estate berskala dunia dengan memberikan pelayanan berkualitas dunia dan meraih hasil yang maksimal. Bersama dengan RE/MAX, anda memiliki peluang untuk mengembangkan bisnis anda tidak hanya secara nasional tetapi secara internasional.";
        label_contentItem2Title = "Pelatihan Yang Berkesinambungan";
        label_contentItem2Sub = "Keuntungan yang akan anda peroleh dengan menjadi anggota RE/MAX tidak terbatas pada akses untuk melanjutkan pelatihan untuk anda dan para marketing associate anda.";
        label_contentItem2Body = "RE/MAX memiliki kultur kekeluargaan yang erat dimana setiap personnel saling membangun dan membantu satu dengan yang lain agar dapat sama–sama mencapai hasil yang maksimal. Setiap tahun, RE/MAX mengadakan satu kali pertemuan antara negara Asia Pasifik dan satu kali pertemuan seluruh dunia di Amerika Serikat agar setiap anggotanya dapat membangun jaringan bisnis yang kuat, belajar dari satu dan yang lainnya, dan saling berkompetisi.";
        label_contentItem3Title = "Momentum";
        label_contentItem3Sub = "Pelatihan khusus Momentum bagi business owner dirancang sedemikian rupa agar anda dapat menjalankan usaha ini dan mengerti bagaimana tugas utama anda sebagai pemilik usaha.";
        label_contentItem3Body = "Usaha RE/MAX didasarkan dengan konsep kewirausahaan mandiri. Usaha yang sangat menggiurkan ini dapat dibangun menjadi usaha yang sangat besar dan luas dan dapat diwariskan ke generasi penerus. Walaupun berjalan dalam konsep kewirausahawaan, bersama RE/MAX anda tidak akan pernah sendirian. RE/MAX selalu siap untuk memberikan dukungan, pelatihan, dan bimbingan yang berkesinambungan agar anda mencapai cita-cita anda.";
        label_contentItem4Title = "Bootcamp";
        label_contentItem4Sub = "Pelatihan khusus bagi para marketing associate yang terdiri dari 12 modul telah terbukti dapat meningkatkan kinerja para marketing associate.";
        label_contentItem4Body = "Teknologi RE/MAX menciptakan peluang usaha yang sangat besar diantara marketing associate dan klien. Teknologi Genius milik RE/MAX dirancang agar ramah pengguna dan dapat meningkatkan efektivitas dan efisiensi usaha anda.";



      }
      setState(() {
        // labeling = labeling;
        // labeling_body = labeling_body;
        // bahasa = preferences.getString("bahasa");
      });
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
                    label_training,
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
                    label_contentItem1Title,
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
                    label_contentItem1Sub,
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
                    child: Text(label_readMore),
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1),
                    onPressed: () async {
                      await showDialog(
                        builder: (_) => ImageDialog(
                            'assets/images/fr_ct_1.png',
                            label_contentItem1Title,
                            label_contentItem1Body),
                        context: context,
                      );
                    },
                  )),
              new Container(
                margin: EdgeInsets.only(top: 25.0),
                child: new Align(
                  child: new Text(
                    label_contentItem2Title,
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
                    label_contentItem2Sub,
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
                    child: Text(label_readMore),
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1),
                    onPressed: () async {
                      await showDialog(
                        builder: (_) => ImageDialog(
                            'assets/images/fr_ct_2.png',
                            label_contentItem2Title,
                            label_contentItem2Body),
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
                    label_contentItem3Title,
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
                    label_contentItem3Sub,
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
                    child: Text(label_readMore),
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1),
                    onPressed: () async {
                      await showDialog(
                        builder: (_) => ImageDialog(
                            'assets/images/fr_ct_3.png',
                            label_contentItem3Title,
                            label_contentItem3Body),
                        context: context,
                      );
                    },
                  )),
              new Container(
                margin: EdgeInsets.only(top: 25.0),
                child: new Align(
                  child: new Text(
                    label_contentItem4Title,
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
                    label_contentItem4Sub,
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
                    child: Text(label_readMore),
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1),
                    onPressed: () async {
                      await showDialog(
                        builder: (_) => ImageDialog(
                            'assets/images/fr_ct_4.png',
                            label_contentItem4Title,
                            label_contentItem4Body),
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

class ImageDialogKantor extends StatefulWidget {
  @override
  _ImageDialogKantorState createState() => _ImageDialogKantorState();
}

class _ImageDialogKantorState extends State<ImageDialogKantor> {
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPhone = new TextEditingController();
  TextEditingController controllerDomisili = new TextEditingController();
  TextEditingController controllerMessage = new TextEditingController();

  String label_loading = "";
  String labeling = "";
  String labeling_body = "";
  String bahasa = "";
  getPrefBahasa() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    label_loading = "Loading";
    if (preferences.getString("bahasa") != null) {
      if (preferences.getString("bahasa") == "id_ID") {
        label_loading = "Memuat";
        labeling = "Kesempatan Penghasilan Tanpa Batas";
        labeling_body = "Miliki Usaha Anda Sendiri";
      } else {
        label_loading = "Loading";
        labeling = "Unlimited Income Opportunities";
        labeling_body = "Own Your Business";
      }
      setState(() {
        label_loading = label_loading;
        labeling = labeling;
        labeling_body = labeling_body;
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

        if (message == "Data Created") {
          message =
              (bahasa == "n") ? "Data berhasil dikirim" : "Data has been sent";
        }

        Navigator.pop(context);

        _showToast(context, message);

        controllerName.text = "";
        controllerEmail.text = "";
        controllerPhone.text = "";
        controllerDomisili.text = "";
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
                              'Submit',
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
