import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remax_app/screens/home/components/body.dart';
import 'package:remax_app/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main_drawer.dart';
import 'components/bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


enum LoginStatus { notSignIn, signIn }


class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  var value;
  bool isLogin = false;


  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
      print(value);

      isLogin = value == 1 ? true : false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavBar(isLogin),
      //bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
