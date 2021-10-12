import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CreateListing extends StatefulWidget {
  @override
  _CreateListingState createState() => _CreateListingState();
}

class _CreateListingState extends State<CreateListing> {
  String email, password;

  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  var _currencies = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];

  final TextEditingController _typeAheadController = TextEditingController();
  final TextEditingController _typeAheadControllerProv =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Listing'),
      ),
      body: Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(labelText: 'State'),
                  controller: this._typeAheadController,
                ),
                suggestionsCallback: (pattern) async {
                  return await StateService.getSuggestions(pattern);
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  this._typeAheadController.text = suggestion;
                }),
            TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(labelText: 'Province'),
                  controller: this._typeAheadControllerProv,
                ),
                suggestionsCallback: (pattern) async {
                  return await StateServiceProv.getSuggestions(pattern);
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  this._typeAheadControllerProv.text = suggestion;
                }),
            TextFormField(
              onSaved: (e) => email = e,
              decoration: InputDecoration(
                labelText: "Listing Tittle",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Publish Date",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Expiry Date",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Property Owner Name",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Custom Listing URL",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Street Name",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Property Number",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Block Number",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Country",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Province",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "City",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Post Code",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Asking Price",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Listing Type",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Listing Category",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Property Type",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Certificate Type",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Land Size",
              ),
            ),
            TextFormField(
              onSaved: (e) => password = e,
              decoration: InputDecoration(
                labelText: "Building Size",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StateService {
  static final List<String> states = [
    'Pertamburan, Jakarta Barat',
    'ANDHRA PRADESH',
    'ARUNACHAL PRADESH'
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(states);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}

class StateServiceProv {
  static Future<List<dynamic>> getSuggestions(String query) async {
    Map<String, String> headerss = {};
    SharedPreferences preferences = await SharedPreferences.getInstance();

    headerss['cookie'] = preferences.getString("cookie");
    print(headerss);
    final response = await http.get(
        "https://genius.remax.co.id/api/province/crud?pageSize=100",
        headers: headerss);
    List list = json.decode(response.body)['data'];
    List matches = List();

    for (int i = 0; i < list.length; i++) {
      matches.add(list[i]['mprvDescription']);
    }

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
