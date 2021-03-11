import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/screens/member/create_listing_page.dart';
import 'package:remax_app/screens/member/my_customer_page.dart';
import 'package:remax_app/screens/sign_in/components/body.dart';
import 'package:remax_app/sidebar/navigation_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../member/my_listing_page.dart';

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
    return Scaffold(
      body: Body(),
    );
  }
}

