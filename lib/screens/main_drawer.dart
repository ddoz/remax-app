import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remax_app/screens/about/about_page.dart';
import 'package:remax_app/screens/agents/agents_page.dart';
import 'package:remax_app/screens/contactus/contact_us_page.dart';
import 'package:remax_app/screens/favourite/favourite_page.dart';
import 'package:remax_app/screens/gallery_page.dart';
import 'package:remax_app/screens/map_page.dart';
import 'package:remax_app/screens/search/search_screen.dart';
import 'package:remax_app/screens/sign_in_page.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 80,
                        margin: EdgeInsets.only(top: 25),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://genius.remax.co.id/papi/company/crud/1/links/compFileId/122390'),
                              fit: BoxFit.fill),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.grey,
                child: SizedBox(height: 1,
                width: MediaQuery.of(context).size.width * 0.7),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(left: 30.0, top: 15.0),
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/home.svg"),
                      SizedBox(width: 20.0,),
                      Text('Home'),
                    ]
                  ),
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
                  child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/listings.svg"),
                        SizedBox(width: 20.0,),
                        Text('Properties'),
                      ]
                  ),
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
                  child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/info.svg"),
                        SizedBox(width: 20.0,),
                        Text('About'),
                      ]
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(left: 30.0, top: 15.0),
                  child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/join.svg"),
                        SizedBox(width: 15.0,),
                        Text('Franchise'),
                      ]
                  ),
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
                  child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/agents.svg"),
                        SizedBox(width: 20.0,),
                        Text('Agents'),
                      ]
                  ),
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
                  child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/call.svg"),
                        SizedBox(width: 20.0,),
                        Text('Contacts'),
                      ]
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(left: 30.0, top: 15.0),
                  child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/resources.svg"),
                        SizedBox(width: 20.0,),
                        Text('Resources'),
                      ]
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new FavoritePage()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 30.0, top: 15.0),
                  child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/love.svg"),
                        SizedBox(width: 20.0,),
                        Text('Favourite'),
                      ]
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(left: 30.0, top: 15.0),
                  child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/listings.svg"),
                        SizedBox(width: 20.0,),
                        Text('My Listing'),
                      ]
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(left: 30.0, top: 15.0),
                  child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/customers.svg"),
                        SizedBox(width: 20.0,),
                        Text('My Customers'),
                      ]
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(left: 30.0, top: 15.0),
                  child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/signin.svg"),
                        SizedBox(width: 20.0,),
                        Text('Sign In'),
                      ]
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0),
                color: Colors.grey,
                child: SizedBox(height: 1,
                    width: MediaQuery.of(context).size.width * 0.7),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(left: 30.0, top: 15.0, bottom: 30.0),
                  child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/logout.svg"),
                        SizedBox(width: 20.0,),
                        Text('Log Out'),
                      ]
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
