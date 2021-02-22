import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:remax_app/screen/member/my_customer_page.dart';
import 'package:remax_app/sidebar/navigation_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'detail_page.dart';
import 'member/my_listing_page.dart';

class SignInPage extends StatefulWidget with NavigationStates {
  @override
  _SignInPageState createState() => _SignInPageState();
}

enum LoginStatus { notSignIn, signIn }

class _SignInPageState extends State<SignInPage> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String email, password;
  final _key = new GlobalKey<FormState>();

  Map<String, String> headers = {};

  void updateCookie(http.Response response) {
    String rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    Map dataLogin = {
      'username': '$email',
      'password': '$password',
    };
    var body = json.encode(dataLogin);

    final response = await http.post("https://genius.remax.co.id/session/login",
        headers: {"Content-Type": "application/json"}, body: body);
    updateCookie(response);
    final data = jsonDecode(response.body);
    String message = 'kosong';
    if (data['status'].containsKey('error')) {
      message = data['status']['error']['message'];
      print(message);
    } else {
      value = 1;
      message = data['status']['message'];
      Map<String, dynamic> datas = await getData();
      String name = datas['profile']['name'];
      String member = datas['profile']['member'];
      String office = datas['profile']['office'];
      print(name + member + office);
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, name, member, office);
      });
    }
  }

  Future<Map<String, dynamic>> getData() async {
    final response = await http.get("https://genius.remax.co.id/json/user",
        headers: headers);
    Map<String, dynamic> data = json.decode(response.body);
    return data;
  }

  savePref(int value, String name, String member, String office) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("name", name);
      preferences.setString("member", member);
      preferences.setString("office", office);
      preferences.commit();
    });
  }

  var value;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          appBar: AppBar(
            title: Text("Login"),
          ),
          body: Form(
            key: _key,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  validator: (e) {
                    if (e.isEmpty) {
                      return "Please insert username";
                    }
                  },
                  onSaved: (e) => email = e,
                  decoration: InputDecoration(
                    labelText: "username",
                  ),
                ),
                TextFormField(
                  obscureText: _secureText,
                  onSaved: (e) => password = e,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      onPressed: showHide,
                      icon: Icon(_secureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    check();
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        return MainMenu(signOut, headers);
        break;
    }
  }
}

class MainMenu extends StatefulWidget {
  final VoidCallback signOut;
  final Map<String, String> headers;

  MainMenu(this.signOut, this.headers);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  String name = "", member = "";

//  TabController tabController;

  Future<List> getData() async {
    final response = await http.get("https://genius.remax.co.id/api/listing/crud?sort=-listId", headers: widget.headers);
    List list = json.decode(response.body)['data'];
    return list;
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString("name");
      member = preferences.getString("member");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text(""),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  signOut();
                },
                icon: Icon(Icons.lock_open),
              )
            ],
          ),
          body: Center(
            child: new Column(
              children: <Widget>[
                new InkWell(
                  onTap: () =>   Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new MyListingPage(
                        signOut, widget.headers
                      ))),
                  child: new Container(
                    //width: 100.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                      color: Colors.blueAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: new Center(child: new Text('My Listing', style: new TextStyle(fontSize: 18.0, color: Colors.white),),),
                  ),
                ),
                new InkWell(
                  onTap: () =>  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new MyCustomerPage(
                          signOut, widget.headers
                      ))),
                  child: new Container(
                    //width: 100.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                      color: Colors.blueAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: new Center(child: new Text('My Customer', style: new TextStyle(fontSize: 18.0, color: Colors.white),),),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}

