import 'package:flutter/material.dart';
import 'package:remax_app/util/constants.dart';

class HeaderSignIn extends StatelessWidget {
  const HeaderSignIn({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      // It will cover 20% of our total height
      height: size.height * 0.65,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 151,
                    height: 56,
                    child: Image.asset("assets/logo/logo_remax.png"),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
