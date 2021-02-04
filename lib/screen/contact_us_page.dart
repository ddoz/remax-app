import 'package:flutter/material.dart';

import 'main_drawer.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us Page'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Conctact Us Page'),
      ),
    );
  }
}
