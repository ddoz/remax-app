import 'package:flutter/material.dart';
import 'package:remax_app/screens/search/search_screen.dart';
import 'package:remax_app/util/constants.dart';

class TitleWithLink extends StatelessWidget {
  const TitleWithLink({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);
  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(text: title),
          Spacer(),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new SearchScreen()));
            },
            child: Text('View All Listing',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: kPrimaryColor)),
          ),
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
