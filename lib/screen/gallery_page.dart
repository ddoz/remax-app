import 'package:flutter/material.dart';

import 'main_drawer.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery Page'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Gallery Page'),
      ),
    );
  }
}
