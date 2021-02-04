import 'package:flutter/material.dart';

import 'main_drawer.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('About Page'),
      ),
    );
  }
}
