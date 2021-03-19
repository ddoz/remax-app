import 'package:flutter/material.dart';
import 'package:remax_app/sidebar/navigation_bloc.dart';
import 'package:remax_app/util/constants.dart';

import 'components/body.dart';
import 'components/bottom_nav.dart';


class MapPage extends StatelessWidget  with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kAppBarColorTheme, //change your color here
        ),
        title: Text("Properties", style: TextStyle(color: kAppBarColorTheme),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
