import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:remax_app/screens/addlisting/addlisting_page.dart';
import 'package:remax_app/screens/favourite/favourite_page.dart';
import 'package:remax_app/screens/maps/map_page.dart';
import 'package:remax_app/screens/search/search_screen.dart';
import 'package:remax_app/screens/sign_in/sign_in_page.dart';
import 'package:remax_app/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

enum LoginStatus { notSignIn, signIn }

class _BottomNavBarState extends State<BottomNavBar> {
  var value;
  LoginStatus _loginStatus = LoginStatus.notSignIn;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
      print(value);

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
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
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
      ),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -4),
            blurRadius: 15,
            color: kPrimaryColor.withOpacity(0.7),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(children: <Widget>[
                Container(
                  child: SvgPicture.asset("assets/icons/home.svg"),
                ),
                Text(
                  'Home',
                  style: TextStyle(fontSize: 13.0),
                )
              ]),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new FavoritePage()));
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(children: <Widget>[
                SizedBox(
                    height: 16.0,
                    child: SvgPicture.asset("assets/icons/love.svg")),
                Text(
                  'Favorite',
                  style: TextStyle(fontSize: 13.0),
                )
              ]),
            ),
          ),
          Spacer(),
          _loginStatus == LoginStatus.signIn
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => AddListingPage()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(children: <Widget>[
                      SizedBox(
                          height: 16.0,
                          child: Icon(Icons.add, color: kPrimaryColor,)),
                      Text(
                        'Add', style: TextStyle(fontSize: 13.0),
                      )
                    ]),
                  ),
                )
              : Container(),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => SearchScreen()));
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(children: <Widget>[
                SizedBox(
                    height: 16.0,
                    child: SvgPicture.asset(
                      "assets/icons/search.svg",
                      color: kPrimaryColor,
                    )),
                Text(
                  'Search',
                  style: TextStyle(fontSize: 13.0),
                )
              ]),
            ),
          ),
          Spacer(),
          _loginStatus == LoginStatus.signIn
              ? GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(new MaterialPageRoute(
                    //     builder: (BuildContext context) => SignInPage()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(children: <Widget>[
                      SizedBox(
                          height: 16.0,
                          child: SvgPicture.asset("assets/icons/person.svg",
                              color: kPrimaryColor)),
                      Text(
                        'Account',
                        style: TextStyle(fontSize: 13.0),
                      )
                    ]),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => SignInPage()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(children: <Widget>[
                      SizedBox(
                          height: 16.0,
                          child: SvgPicture.asset("assets/icons/signin.svg")),
                      Text(
                        'Sign In',
                        style: TextStyle(fontSize: 13.0),
                      )
                    ]),
                  ),
                )
        ],
      ),
    );
  }
}
