import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            height: 500,
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
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              height: 25.0,
                              width: 25.0,
                              child: SvgPicture.asset("assets/icons/home.svg",
                                  color: Colors.white)),
                        ),
                        Spacer(),
                        SvgPicture.asset("assets/icons/language-choose.svg"),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.08),
                    width: 151,
                    height: 56,
                    child: Image.asset("assets/logo/logo_remax.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 20.0, bottom: 20.0, left: 30.0, right: 30.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Welcome!\nPlease fill the Usernmae and Password to Sign in into Genius System',
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
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
