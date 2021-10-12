import 'package:flutter/material.dart';
import 'package:remax_app/util/constants.dart';

import 'components/body.dart';

class TrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(Icons.logout_rounded),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
        title: Text(
          "Start Tracker",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: kAppBarColorTheme,
      ),
      body: Body(),
    );
  }
}
