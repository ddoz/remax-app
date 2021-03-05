import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContentSignIn extends StatefulWidget {
  @override
  _ContentSignInState createState() => _ContentSignInState();
}

enum LoginStatus { notSignIn, signIn }

class _ContentSignInState extends State<ContentSignIn> {

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
        return Container(
          padding:
          new EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.45,),
          margin: EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Form(
                  key: _key,
                  child: Column(
                    children: <Widget>[
                      // TextFormField(
                      //   validator: (e) {
                      //     if (e.isEmpty) {
                      //       return "Please insert username";
                      //     }
                      //   },
                      //   onSaved: (e) => email = e,
                      //   decoration: InputDecoration(
                      //     labelText: "username",
                      //   ),
                      // ),
                      // TextFormField(
                      //   obscureText: _secureText,
                      //   onSaved: (e) => password = e,
                      //   decoration: InputDecoration(
                      //     labelText: "Password",
                      //     suffixIcon: IconButton(
                      //       onPressed: showHide,
                      //       icon: Icon(_secureText
                      //           ? Icons.visibility_off
                      //           : Icons.visibility),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 30, left: 15.0, right: 15.0),
                        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        height: 45,
                        decoration: BoxDecoration(
                          color: kLightGrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                validator: (e) {
                                  if (e.isEmpty) {
                                    return "Please insert username";
                                  }
                                },
                                onSaved: (e) => email = e,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    color: kPrimaryColor.withOpacity(0.5),
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            SvgPicture.asset("assets/icons/mail.svg", color: kIconColor,),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 20, left: 15.0, right: 15.0),
                        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        height: 45,
                        decoration: BoxDecoration(
                          color: kLightGrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                obscureText: _secureText,
                                onSaved: (e) => password = e,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: kPrimaryColor.withOpacity(0.5),
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  suffixIcon: IconButton(
                                    onPressed: showHide,
                                    icon: Icon(_secureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                ),
                              ),
                            ),
                            //SvgPicture.asset("assets/icons/mail.svg"),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 12.0, top: 10.0, bottom: 15.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('Forgot Password?', style: TextStyle(
                              color: kAppBarColorTheme,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          check();
                        },
                        child: new Container(
                          margin: EdgeInsets.all(10.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: kAppBarColorTheme,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Login',
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
                      Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Dont have an account?', style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold
                            )),
                            SizedBox(width: 2.0,),
                            Text('Sign Up', style: TextStyle(
                                fontSize: 12.0,
                                color: kRedColor,
                                fontWeight: FontWeight.bold
                            )),
                          ],
                        ),
                      )
                      // MaterialButton(
                      //   onPressed: () {
                      //     check();
                      //   },
                      //   child: Text("Login"),
                      // ),
                    ],
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 30.0),
                child: Text('REMAX application v2.0', style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold
                )),
              ),

            ],

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
    final response = await http.get(
        "https://genius.remax.co.id/api/listing/crud?sort=-listId",
        headers: widget.headers);
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
    return      Center(
      child: new Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                // onTap: () => Navigator.of(context).push(
                //     new MaterialPageRoute(
                //         builder: (BuildContext context) =>
                //         new MyListingPage(signOut, widget.headers))),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      width: 120.0,
                      height: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.list,
                              size: 50.0, color: Colors.pink),
                          Text('My Listing')
                        ],
                      ),
                    )),
              ),
              GestureDetector(
                // onTap: () => Navigator.of(context).push(
                //     new MaterialPageRoute(
                //         builder: (BuildContext context) =>
                //         new MyCustomerPage(signOut, widget.headers))),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      width: 120.0,
                      height: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.person,
                              size: 50.0, color: Colors.pink),
                          Text('My Customer')
                        ],
                      ),
                    )),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                // onTap: () => Navigator.of(context).push(
                //     new MaterialPageRoute(
                //         builder: (BuildContext context) =>
                //         new CreateListing())),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      width: 120.0,
                      height: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.format_list_bulleted,
                              size: 50.0, color: Colors.pink),
                          Text('Create Listing')
                        ],
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  signOut();
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      width: 120.0,
                      height: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.logout,
                              size: 50.0, color: Colors.pink),
                          Text('Logout')
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

