import 'package:flutter/material.dart';
import 'package:remax_app/screens/istilahproperty/components/content_istilah.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device

    return ContentIstilah();
  }
}
