import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remax_app/screens/about/about_page.dart';
import 'package:remax_app/screens/agents/agents_page.dart';
import 'package:remax_app/screens/ajukan_kpr/ajukan_kpr_page.dart';
import 'package:remax_app/screens/contactus/contact_us_page.dart';
import 'package:remax_app/screens/favourite/favourite_page.dart';
import 'package:remax_app/screens/franchise/franchise_page.dart';
import 'package:remax_app/screens/istilahproperty/istilah_property.dart';
import 'package:remax_app/screens/search/search_screen.dart';
import 'package:remax_app/screens/sign_in/sign_in_page.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Image.asset('assets/logo/logo_remax_menu.png',
                        width: 180, height: 67),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        child: Image.asset(
                          'assets/icons/close_menu.png',
                          width: 35,
                          height: 35,
                        ),
                      ),
                    )
                  ],
                )),

            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              color: Colors.grey,
              child: SizedBox(
                  height: 1, width: MediaQuery.of(context).size.width * 0.7),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(left: 30.0, top: 15.0),
                child: Row(children: <Widget>[
                  SvgPicture.asset("assets/icons/home.svg"),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text('Home'),
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new SearchScreen()));
              },
              child: Container(
                margin: EdgeInsets.only(left: 30.0, top: 15.0),
                child: Row(children: <Widget>[
                  SvgPicture.asset("assets/icons/listings.svg"),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text('Properties'),
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new AboutPage()));
              },
              child: Container(
                margin: EdgeInsets.only(left: 30.0, top: 15.0),
                child: Row(children: <Widget>[
                  SvgPicture.asset("assets/icons/info.svg"),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text('About'),
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new FranchisePage()));
              },
              child: Container(
                margin: EdgeInsets.only(left: 30.0, top: 15.0),
                child: Row(children: <Widget>[
                  SvgPicture.asset("assets/icons/join.svg"),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text('Franchise'),
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new AgentsPage()));
              },
              child: Container(
                margin: EdgeInsets.only(left: 30.0, top: 15.0),
                child: Row(children: <Widget>[
                  SvgPicture.asset("assets/icons/agents.svg"),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text('Agents'),
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new ContactUsPage()));
              },
              child: Container(
                margin: EdgeInsets.only(left: 30.0, top: 15.0),
                child: Row(children: <Widget>[
                  SvgPicture.asset("assets/icons/call.svg"),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text('Contacts'),
                ]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0),
              child: ExpansionTile(
                leading: SvgPicture.asset("assets/icons/resources.svg"),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.centerLeft,
                title: Align(
                  child: new Text('Resources'),
                  alignment: Alignment(-1.2, 0),
                ),
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new IstilahPropertyPage()));
                    },
                    child: Container(
                        margin: EdgeInsets.only(left: 50.0, bottom: 10.0),
                        child: Text("Istilah Property")),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new AjukanKprPage()));
                    },
                    child: Container(
                        margin: EdgeInsets.only(left: 50.0, bottom: 10.0),
                        child: Text("Ajukan KPR")),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new FavoritePage()));
              },
              child: Container(
                margin: EdgeInsets.only(left: 30.0),
                child: Row(children: <Widget>[
                  SvgPicture.asset("assets/icons/love.svg"),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text('Favourite'),
                ]),
              ),
            ),
//            GestureDetector(
//              onTap: () {},
//              child: Container(
//                margin: EdgeInsets.only(left: 30.0, top: 15.0),
//                child: Row(children: <Widget>[
//                  SvgPicture.asset("assets/icons/listings.svg"),
//                  SizedBox(
//                    width: 20.0,
//                  ),
//                  Text('My Listing'),
//                ]),
//              ),
//            ),
//            GestureDetector(
//              onTap: () {},
//              child: Container(
//                margin: EdgeInsets.only(left: 30.0, top: 15.0),
//                child: Row(children: <Widget>[
//                  SvgPicture.asset("assets/icons/customers.svg"),
//                  SizedBox(
//                    width: 20.0,
//                  ),
//                  Text('My Customers'),
//                ]),
//              ),
//            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new SignInPage()));
              },
              child: Container(
                margin: EdgeInsets.only(left: 30.0, top: 15.0),
                child: Row(children: <Widget>[
                  SvgPicture.asset("assets/icons/signin.svg"),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text('Sign In'),
                ]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0, left: 25, right: 25),
              color: Colors.grey,
              child: SizedBox(
                  height: 1, width: MediaQuery.of(context).size.width * 0.7),
            ),
//            GestureDetector(
//              onTap: () {},
//              child: Container(
//                margin: EdgeInsets.only(left: 30.0, top: 15.0, bottom: 30.0),
//                child: Row(children: <Widget>[
//                  SvgPicture.asset("assets/icons/logout.svg"),
//                  SizedBox(
//                    width: 20.0,
//                  ),
//                  Text('Log Out'),
//                ]),
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}
