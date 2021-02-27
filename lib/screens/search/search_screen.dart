import 'package:flutter/material.dart';
import 'package:remax_app/screens/search/components/bottom_nav.dart';
import 'package:remax_app/util/constants.dart';

import 'components/body.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kAppBarColorTheme, //change your color here
        ),
        title: Text("Search Properties", style: TextStyle(color: kAppBarColorTheme),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
      //bottomNavigationBar: MyBottomNavBar(),
    );
  }
}