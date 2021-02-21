import 'package:flutter/material.dart';
import 'package:remax_app/screen/about_page.dart';
import 'package:remax_app/screen/agents_page.dart';
import 'package:remax_app/screen/contact_us_page.dart';
import 'package:remax_app/screen/favourite_page.dart';
import 'package:remax_app/screen/gallery_page.dart';
import 'package:remax_app/screen/map_page.dart';
import 'package:remax_app/screen/sign_in_page.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: const Color(0xff1A3668),
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
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, '/HomePage');
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Gallery'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, '/GalleryPage');
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favourite'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new FavoritePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new AboutPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Agents'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new AgentsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text('Contact Us'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new ContactUsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Map'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new MapPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Sign In'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new SignInPage()));
            },
          ),
        ],
      ),
    );
  }
}
