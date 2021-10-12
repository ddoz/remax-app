import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MapsContent extends StatefulWidget {
  MapsContent() : super();

  @override
  MapsContentState createState() => MapsContentState();
}

class MapsContentState extends State<MapsContent> {
  //
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  List<dynamic> allMarkers = [];
  Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  GoogleMapController newGoogleMapController;
  Position currentPosition;
  CameraPosition cameraPosition;

  void locatePosition() async {
    var locator = new Geolocator();
    Position position = await locator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLng = LatLng(position.latitude, position.longitude);
    cameraPosition = new CameraPosition(target: latLng, zoom: 15);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Map<String, dynamic> getCoordinate() {
    String coordinate =
        "{\"coordinate\":{\"latitude\":-7.313501362255947,\"longitude\":112.72094845609742},\"radius\":200}";
    Map valueMap = json.decode(coordinate);
    return valueMap;
  }

  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: LatLng(45.531563, -122.677433),
    tilt: 59.440,
    zoom: 11.0,
  );

  Future<void> _goToPosition1() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Future<List> getData() async {
    final response = await http.get("https://genius.remax.co.id/papi/listing");
    List list = json.decode(response.body)['data'];
    return list;
  }

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    newGoogleMapController = controller;
    locatePosition();
    getData();
    _onAddMarkerButtonPressed();
    //getCoordinate();
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  int toInt(String str) {
    var myInt = int.parse(str);
    assert(myInt is int);
    return myInt;
  }

  _onAddMarkerButtonPressed() async {
    List data = await getData();
    for (int i = 0; i < data.length; i++) {
      if (data[i]['listCoordinat'] != null) {
        Map s = json.decode(data[i]['listCoordinat']);
        setState(() {
          _markers.add(
            Marker(
              markerId: MarkerId(data[i]['listTitle']),
              position: LatLng(
                  s['coordinate']['latitude'], s['coordinate']['longitude']),
              infoWindow: InfoWindow(
                title: data[i]['listTitle'],
                snippet: NumberFormat.compactCurrency(
                        locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                    .format(toInt(data[i]['listListingPrice'])),
              ),
              icon: BitmapDescriptor.defaultMarker,
            ),
          );
        });
      }
    }
  }

  Widget button(Function function, IconData icon, String heroTag) {
    return FloatingActionButton(
      onPressed: function,
      heroTag: heroTag,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: Icon(
        icon,
        size: 36.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          mapType: _currentMapType,
          markers: _markers,
          onCameraMove: _onCameraMove,
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[
                button(_onMapTypeButtonPressed, Icons.map, "btnTag1"),
                SizedBox(
                  height: 16.0,
                ),
//                  button(
//                      _onAddMarkerButtonPressed, Icons.add_location, "btnTag2"),
                SizedBox(
                  height: 16.0,
                ),
                button(_goToPosition1, Icons.location_searching, "btnTag3"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
