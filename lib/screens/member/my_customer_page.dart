import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/screens/addcustomer/add_customer_page.dart';
import 'package:remax_app/screens/sign_in/sign_in_page.dart';
import 'package:remax_app/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'detail_edit_customer.dart';

class MyCustomerPage extends StatefulWidget {
  @override
  _MyCustomerPageState createState() => _MyCustomerPageState();
}

enum LoginStatus { notSignIn, signIn }

class _MyCustomerPageState extends State<MyCustomerPage> {
  String name = "", member = "";

//  TabController tabController;

  Map<String, String> headerss = {};

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString("name");
      member = preferences.getString("member");
      setState(() {
        headerss['cookie'] = preferences.getString("cookie");
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    cekSession();
    print(headerss);
  }

  LoginStatus _loginStatus = LoginStatus.notSignIn;

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  void _showToast(BuildContext context, String message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: new Text(message),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  cekSession() async {
    final response = await http.get(
        "https://genius.remax.co.id/api/listing/crud?sort=-listId",
        headers: headerss);

    final data = jsonDecode(response.body);
    String message = "Terjadi Kesalahan, ";
    if (data['status'].containsKey('error')) {
      message = message + data['status']['error']['message'];
      print(message);
      _showToast(context, message);
      signOut();
      Navigator.of(context).pop;
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new SignInPage()));
    }
  }

  Future<List> getData() async {
    final response = await http
        .get("https://genius.remax.co.id/api/customer/crud", headers: headerss);
    List list = json.decode(response.body)['data'];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: kAppBarColorTheme, //change your color here
          ),
          title: Text(
            "My Customer",
            style: TextStyle(color: kAppBarColorTheme),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        floatingActionButton: new FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new AddCustomerPage()));
          },
          backgroundColor: kRedColor,
        ),
        body: Container(
          color: kLightGrey,
          child: Column(
            children: [
              new Container(
                margin: EdgeInsets.only(
                    top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: kDefaultPadding, right: 5.0),
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/icons/location.svg",
                      color: kIconColor,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: "Search Customers..",
                            hintStyle: TextStyle(
                              fontSize: 14.0,
                              color: kPrimaryColor.withOpacity(0.5),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: new FutureBuilder<List>(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? new ItemList(
                            list: snapshot.data,
                          )
                        : new Center(
                            child: new CircularProgressIndicator(),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List list;

  ItemList({this.list});

  int toInt(String str) {
    var myInt = int.parse(str);
    assert(myInt is int);
    return myInt;
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new DetailEditCustomer(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.all(10.0),
                      width: 50.0,
                      height: 50.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/profile.png"),
                          ))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10.0, top: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            list[i]['custName'],
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      list[i]['custAddress'] != null
                          ? Container(
                              margin:
                                  EdgeInsets.only(right: 10.0, bottom: 10.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: new Text(
                                  list[i]['custAddress'],
                                  overflow: TextOverflow.ellipsis,
                                  style: new TextStyle(
                                    color: const Color(0xff767472),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 10.0,
                                  bottom: 5.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: new Text(
                                  '-',
                                  overflow: TextOverflow.ellipsis,
                                  style: new TextStyle(
                                    fontSize: 16.0,
                                    color: const Color(0xff767472),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
