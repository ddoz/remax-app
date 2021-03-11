import 'package:flutter/material.dart';
import 'package:remax_app/screens/addcustomer/components/content_add_customer.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ContentAddCustomer(),
        ],
      ),
    );
  }
}