import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remax_app/screens/home/components/body.dart';
import 'package:remax_app/util/constants.dart';

import '../main_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      drawer: MainDrawer(),
      //bottomNavigationBar: MyBottomNavBar(),
    );
  }

  // AppBar buildAppBar() {
  //   return AppBar(
  //     backgroundColor: kPrimaryColor,
  //     elevation: 0,
  //     leading: IconButton(
  //       icon: Image.asset("assets/icons/menu_bar.png"),
  //       onPressed: () {},
  //     ),
  //   );
  // }
}
