import 'package:flutter/material.dart';

import 'main_drawer.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Page'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Favourite Page'),
      ),
    );
  }
}
