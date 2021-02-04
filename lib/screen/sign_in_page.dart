import 'package:flutter/material.dart';

import 'main_drawer.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In Page'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Sign In Page'),
      ),
    );
  }
}
