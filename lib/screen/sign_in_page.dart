import 'package:flutter/material.dart';
import 'package:remax_app/screen/login_page.dart';

import 'main_drawer.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1A3668),
        title: Text('Sign In Page'),
      ),
      body: LoginPage()
    );
  }
}
