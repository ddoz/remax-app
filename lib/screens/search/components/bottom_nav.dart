import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:remax_app/util/constants.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
      ),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 15,
            color: kPrimaryColor.withOpacity(0.68),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
              Container(
                child: SvgPicture.asset("assets/icons/home.svg"),
              ),
              Text(
                'Home',
                style: TextStyle(fontSize: 13.0),
              )
            ]),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
              SizedBox(
                  height: 16.0,
                  child: SvgPicture.asset("assets/icons/map.svg")),
              Text(
                'Map',
                style: TextStyle(fontSize: 13.0),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
