import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:remax_app/util/constants.dart';

class HeaderAddListing extends StatelessWidget {
  const HeaderAddListing({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      // It will cover 20% of our total height
      height: size.height * 0.45,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
            ),
            height: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage(
                    "assets/icons/bg_header.png",
                  ),
                  fit: BoxFit.cover,
                )),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 40.0),
                    width: 151,
                    height: 56,
                    child: Image.asset("assets/logo/logo_remax.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: SvgPicture.asset("assets/icons/add_info_listing.svg"),
                  ),
                  Row(
                    children: <Widget>[
                      Text('Add Info Listing', style: TextStyle(
                        color: Colors.white
                      ),),
                      Spacer(),
                      Text('Input Detail', style: TextStyle(
                        color: Colors.white.withOpacity(0.50)
                      ),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
