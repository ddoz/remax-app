import 'package:flutter/material.dart';
import 'package:remax_app/util/constants.dart';

import 'components/body.dart';


class AjukanKprPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: kAppBarColorTheme, //change your color here
          ),
          title: Text(
            "Apply KPR",
            style: TextStyle(color: kAppBarColorTheme),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Body());
  }
}
