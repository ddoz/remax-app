import 'package:flutter/material.dart';

import 'main_drawer.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1A3668),
        title: Text('Favourite Page'),
      ),
      body: Center(
        child: Text('Favourite Page'),
      ),
    );
  }
}
