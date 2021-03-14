import 'package:flutter/material.dart';
import 'package:remax_app/screens/addlisting/components/add_info_listing.dart';
import 'package:remax_app/screens/addlisting/components/headers_listing.dart';

class Body extends StatelessWidget {

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device

    return SingleChildScrollView(
      controller: _scrollController,
      child: Stack(
        children: <Widget>[
          //HeaderAddListing(size: size),
          ContentAddInfoListing(scrollController: _scrollController)
//          ContentAgents(),
        ],
      ),
    );
  }
}
