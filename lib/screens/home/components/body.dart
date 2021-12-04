import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:remax_app/screens/home/components/header_with_searchbox.dart';
import 'package:remax_app/screens/home/components/listing_properties.dart';
import 'package:remax_app/screens/home/components/partners.dart';
import 'package:remax_app/screens/home/components/title_only.dart';
import 'package:remax_app/screens/home/components/title_with_link.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'near_listing.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final PermissionHandler permissionHandler = PermissionHandler();
  Map<PermissionGroup, PermissionStatus> permissions;

  savePrefBahasa(String bahasa) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
//    setState(() {
//      preferences.setString("bahasa", bahasa);
//      preferences.commit();
//    });
    preferences.setString("bahasa", bahasa);
    preferences.commit();
  }

  void initState() {
    super.initState();
    // requestLocationPermission();
    // _gpsService();
    savePrefBahasa("id_ID");
  }

  Future<bool> requestLocationPermission({Function onPermissionDenied}) async {
    var granted = await _requestPermission(PermissionGroup.location);
    if (granted != true) {
      requestLocationPermission();
    }
    debugPrint('requestContactsPermission $granted');
    return granted;
  }

  Future<bool> _requestPermission(PermissionGroup permission) async {
    final PermissionHandler _permissionHandler = PermissionHandler();
    var result = await _permissionHandler.requestPermissions([permission]);
    if (result[permission] == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

  /*Check if gps service is enabled or not*/
  Future _gpsService() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      _checkGps();
      return null;
    } else
      return true;
  }

  Future _checkGps() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Can't get gurrent location"),
                content:
                    const Text('Please make sure you enable GPS and try again'),
                actions: <Widget>[
                  FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        // final AndroidIntent intent = AndroidIntent(
                        //     action:
                        //         'android.settings.LOCATION_SOURCE_SETTINGS');
                        // intent.launch();
                        Navigator.of(context, rootNavigator: true).pop();
                        _gpsService();
                      })
                ],
              );
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Near From You", press: () {}),
          NearMeListing(),
          SizedBox(height: 20.0),
          TitleWithLink(title: "Listing Properties", press: () {}),
          ListingProperties(),
          SizedBox(height: 20.0),
          TitleWithMoreBtn(title: "Our Approved Partner", press: () {}),
          SizedBox(height: 20.0),
          Partner(),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
