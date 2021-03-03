import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remax_app/util/constants.dart';

class ContentSlideAgents extends StatelessWidget {
  const ContentSlideAgents({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          PartnerCard(
            number: "01",
            text:
                "When you join RE/MAX, you will be part of a marketing super power family with more than 125,000 marketing associates in more than 115 countries.",
            image: "assets/images/bg_agents.png",
            press: () {},
          ),
          PartnerCard(
            number: "02",
            text:
                "Together with RE/MAX, you will receive structured training to increase your knowledge and marketing skills to market your salable listings. RE/MAX University, available only to RE/MAX associates 24 hours a day, offers the best training modules in the real estate industry.",
            image: "assets/images/bg_agents.png",
            press: () {},
          ),
          PartnerCard(
            number: "03",
            text:
                "Our technology and mobile apps enable you to easily share your salable listings to your client with a push of a button. Direct connection with your clients increase the chance of selling your salable listings.",
            image: "assets/images/bg_agents.png",
            press: () {},
          ),
          PartnerCard(
            number: "04",
            text:
                "Cloud based Genius application easily assist you in clear reports, easy and secure billing to your clients. QR code invoicing system ensures the safety of your transactions.",
            image: "assets/images/bg_agents.png",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class PartnerCard extends StatelessWidget {
  const PartnerCard({
    Key key,
    this.number,
    this.text,
    this.image,
    this.press,
  }) : super(key: key);
  final String number;
  final String text;
  final String image;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
            left: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding / 2,
            right: kDefaultPadding / 2),
        width: size.width * 0.8,
        height: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(10.0),
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0),
              child: Text(
                number,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.3),
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
