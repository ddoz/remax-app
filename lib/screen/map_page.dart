import 'package:flutter/material.dart';

import 'main_drawer.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Page'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Map Page'),
      ),
    );
  }
}
