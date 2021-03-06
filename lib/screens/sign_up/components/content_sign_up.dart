import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remax_app/util/constants.dart';

class ContentSignUp extends StatefulWidget {
  @override
  _ContentSignUpState createState() => _ContentSignUpState();
}

class _ContentSignUpState extends State<ContentSignUp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Create Account',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Text(
                'Sign Up your account easy with less information',
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 45,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),

              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        // surffix isn't working properly  with SVG
                        // thats why we use row
                        // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 45,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),

              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        // surffix isn't working properly  with SVG
                        // thats why we use row
                        // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 45,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),

              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "First Name",
                        hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        // surffix isn't working properly  with SVG
                        // thats why we use row
                        // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 45,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),

              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Last Name",
                        hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        // surffix isn't working properly  with SVG
                        // thats why we use row
                        // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 45,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),

              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        // surffix isn't working properly  with SVG
                        // thats why we use row
                        // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 45,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),

              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        // surffix isn't working properly  with SVG
                        // thats why we use row
                        // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Text(
                'Please tick the box to continue',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Text(
                '[capcai]',
              ),
            ),

            GestureDetector(
              onTap: () {
                //check();
              },
              child: new Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  color: kAppBarColorTheme,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
