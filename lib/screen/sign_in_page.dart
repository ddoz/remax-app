import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:remax_app/screen/login_page.dart';
import 'package:remax_app/sidebar/navigation_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'main_drawer.dart';

class SignInPage extends StatefulWidget with NavigationStates {
  @override
  _SignInPageState createState() => _SignInPageState();
}

enum LoginStatus { notSignIn, signIn }


class _SignInPageState extends State<SignInPage> {

  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String email, password;
  final _key = new GlobalKey<FormState>();

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
        headers: {"Content-Type": "application/json"},
        body: body);
    final data = jsonDecode(response.body);
    String message = 'kosong';
    if (data['status'].containsKey('error')){
      message = data['status']['error']['message'];
      print(message);
    } else {
      message = data['status']['message'];
      //print(getData());
      //message = getData();
//      Map<String, dynamic> datas = getData();
//      //String id = datas['profile']['id'];
    print(await getData());

//      String pesan = data['message'];
//      String emailAPI = data['email'];
//      String namaAPI = data['nama'];
//      String id = data['id'];
//      if (value == 1) {
//        setState(() {
//          _loginStatus = LoginStatus.signIn;
//          //savePref(value, emailAPI, namaAPI, id);
//        });
//        print(pesan);
//      } else {
//        print(pesan);
//      }
    }
  }

  Future<Map<String, dynamic>> getData() async {
    final response = await http.get("https://genius.remax.co.id/json/user");
    Map<String, dynamic> data =  json.decode(response.body);
    return data;
  }

  savePref(int value, String email, String nama, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("nama", nama);
      preferences.setString("email", email);
      preferences.setString("id", id);
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
                      return "Please insert email";
                    }
                  },
                  onSaved: (e) => email = e,
                  decoration: InputDecoration(
                    labelText: "email",
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
        return MainMenu(signOut);
        break;
    }
  }
}

class MainMenu extends StatefulWidget {
  final VoidCallback signOut;
  MainMenu(this.signOut);
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

//  String email = "", nama = "";
//  TabController tabController;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
//      email = preferences.getString("email");
//      nama = preferences.getString("nama");
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
            title: Text("Halaman Dashboard"),
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
            child: Text(
                "Dashboard"
            ),
          )
      ),
    );
  }
}
