import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:remax_app/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:contact_picker/contact_picker.dart';

class ContentAddCustomer extends StatefulWidget {
  @override
  _ContentAddCustomerState createState() => _ContentAddCustomerState();
}

class _ContentAddCustomerState extends State<ContentAddCustomer> {
  final TextEditingController _typeAheadControllerProv =
      TextEditingController();
  final TextEditingController _typeAheadControllerCity =
      TextEditingController();
  final TextEditingController _typeAheadControllerMarital =
      TextEditingController();

  TextEditingController controllerCustName = new TextEditingController();
  TextEditingController controllerCustAddres = new TextEditingController();
  TextEditingController controllerCustMobileNumber =
      new TextEditingController();
  TextEditingController controllerCustPhoneNumber = new TextEditingController();
  TextEditingController controllerCustEmail = new TextEditingController();
  TextEditingController controllerCustIdentity = new TextEditingController();

  String idProvince, idCity, idMarital;

  Map<String, String> headerss = {};

  String number, name;
  final ContactPicker contactPicker = new ContactPicker();

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      setState(() {
        headerss['cookie'] = preferences.getString("cookie");
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    name = "";
    number = "";
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: 45,
            decoration: BoxDecoration(
              color: kLightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: controllerCustName,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Customer Name",
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
                GestureDetector(
                    onTap: () async {
                      Contact contact = await contactPicker.selectContact();
                      if(contact != null){
                        number = contact.phoneNumber.number;
                        name = contact.fullName;
                        controllerCustName.text = name;
                        controllerCustMobileNumber.text = number;
                        setState(() {
                          
                        });
                      }
                    },
                    child: SvgPicture.asset("assets/icons/person.svg")),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: 45,
            decoration: BoxDecoration(
              color: kLightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: controllerCustAddres,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Cust Address",
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
                SvgPicture.asset(
                  "assets/icons/location.svg",
                  color: kIconColor,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: 45,
            decoration: BoxDecoration(
              color: kLightGrey,
              borderRadius: BorderRadius.circular(7),
            ),
            child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                    hintText: "Province",
                    hintStyle: TextStyle(
                      color: kPrimaryColor.withOpacity(0.5),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
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
                    title: Text(suggestion['mprvDescription']),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  this._typeAheadControllerProv.text =
                      suggestion['mprvDescription'];
                  //print( suggestion['mprvDescription'] +" idnya adalah "+suggestion['id']);
                  setState(() {
                    idProvince = suggestion['id'];
                  });
                }),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: 45,
            decoration: BoxDecoration(
              color: kLightGrey,
              borderRadius: BorderRadius.circular(7),
            ),
            child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                    hintText: "City",
                    hintStyle: TextStyle(
                      color: kPrimaryColor.withOpacity(0.5),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  controller: this._typeAheadControllerCity,
                ),
                suggestionsCallback: (pattern) async {
                  return await StateServiceCity.getSuggestions(pattern);
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion['mctyDescription']),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  this._typeAheadControllerCity.text =
                      suggestion['mctyDescription'];
                  setState(() {
                    idCity = suggestion['id'];
                  });
                }),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: 45,
            decoration: BoxDecoration(
              color: kLightGrey,
              borderRadius: BorderRadius.circular(7),
            ),
            child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                    hintText: "Marital Status",
                    hintStyle: TextStyle(
                      color: kPrimaryColor.withOpacity(0.5),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  controller: this._typeAheadControllerMarital,
                ),
                suggestionsCallback: (pattern) async {
                  return await StateServiceMartial.getSuggestions(pattern);
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion['mmslName']),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  this._typeAheadControllerMarital.text =
                      suggestion['mmslName'];
                  setState(() {
                    idMarital = suggestion['id'];
                  });
                }),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: 45,
            decoration: BoxDecoration(
              color: kLightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: controllerCustMobileNumber,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Mobile Number",
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
                SvgPicture.asset("assets/icons/mobile_phone.svg",
                    color: kIconColor),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: 45,
            decoration: BoxDecoration(
              color: kLightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: controllerCustPhoneNumber,
                    keyboardType: TextInputType.phone,
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
                SvgPicture.asset("assets/icons/call.svg", color: kIconColor),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: 45,
            decoration: BoxDecoration(
              color: kLightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: controllerCustEmail,
                    keyboardType: TextInputType.emailAddress,
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
                SvgPicture.asset("assets/icons/mail.svg", color: kIconColor),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: 45,
            decoration: BoxDecoration(
              color: kLightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: controllerCustIdentity,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Identity Number",
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
                SvgPicture.asset("assets/icons/identitycard.svg",
                    color: kIconColor),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              addData();
            },
            child: new Container(
              margin: EdgeInsets.all(10.0),
              child: Card(
                color: kAppBarColorTheme,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String validator() {
    String error = "kosong";
    if (controllerCustName.text.isEmpty) {
      error = "Nama cust tidak boleh kosong";
      return error;
    } else if (controllerCustAddres.text.isEmpty) {
      error = "Alamat cust tidak boleh kosong";
      return error;
    } else if (controllerCustMobileNumber.text.isEmpty) {
      error = "Email cust tidak boleh kosong";
      return error;
    } else if (controllerCustPhoneNumber.text.isEmpty) {
      error = "Phone Number cust tidak boleh kosong";
      return error;
    } else if (controllerCustEmail.text.isEmpty) {
      error = "Mobile Number cust tidak boleh kosong";
      return error;
    } else if (controllerCustIdentity.text.isEmpty) {
      error = "No KTP cust tidak boleh kosong";
      return error;
    } else {
      return error;
    }
  }

  addData() async {
    showLoaderDialog(context);

    if (validator() == "kosong") {
      Map dataCust = {
        "custAddress": controllerCustAddres.text,
        "custEmail": controllerCustEmail.text,
        "custKTP": controllerCustIdentity.text,
        "custMobile": controllerCustMobileNumber.text,
        "custName": controllerCustName.text,
        "custPhone": controllerCustPhoneNumber.text,
        "links": {
          "custCityId": idCity,
          "custMaritalStatusId": idMarital,
          "custProvinceId": idProvince
        }
      };
      var body = json.encode(dataCust);
      print(body);
      headerss['Content-Type'] = "application/json";
      print(headerss);

      final response = await http.post(
          "https://genius.remax.co.id/api/customer/crud",
          headers: headerss,
          body: body);

      final data = jsonDecode(response.body);

      print(data);

      String message = "kosong";
      if (data['status'].containsKey('error')) {
        Navigator.pop(context);
        message = data['status']['error']['message'];
        print(message);
        _showToast(context, message);
      } else {
        Navigator.pop(context);
        message = data['status']['message'];
        print(message);
        _showToast(context, message);
        Navigator.pop(context);
      }
    } else {
      Navigator.pop(context);
      _showToast(context, validator());
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            width: 10,
          ),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: new Text(message),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}

class StateServiceProv {
  static Future<List> getSuggestions(String query) async {
    Map<String, String> headerss = {};
    SharedPreferences preferences = await SharedPreferences.getInstance();

    headerss['cookie'] = preferences.getString("cookie");
    print(headerss);
    final response = await http.get(
        "https://genius.remax.co.id/api/province/crud?pageSize=100",
        headers: headerss);
    List list = json.decode(response.body)['data'];
//    List matches = List();
//
//
//    for (int i=0; i<list.length; i++){
//      matches.add(list[i]['mprvDescription']);
//    }

    list.retainWhere((s) =>
        s['mprvDescription'].toLowerCase().contains(query.toLowerCase()));
    return list;
  }

  static Future<String> getProvNameById(String id) async {
    Map<String, String> headerss = {};
    SharedPreferences preferences = await SharedPreferences.getInstance();

    headerss['cookie'] = preferences.getString("cookie");
    print(headerss);
    final response = await http.get(
        "https://genius.remax.co.id/api/province/crud?pageSize=100",
        headers: headerss);
    List list = json.decode(response.body)['data'];
    String prov;
    for (int i = 0; i < list.length; i++) {
      if (list[i]['id'] == id) {
        prov = list[i]['mprvDescription'];

        return prov;
      }
    }
    return prov;
  }
}

class StateServiceCity {
  static Future<List<dynamic>> getSuggestions(String query) async {
    Map<String, String> headerss = {};
    SharedPreferences preferences = await SharedPreferences.getInstance();

    headerss['cookie'] = preferences.getString("cookie");
    print(headerss);
    final response = await http.get(
        "https://genius.remax.co.id/api/city/crud?pageSize=505",
        headers: headerss);
    List list = json.decode(response.body)['data'];

    list.retainWhere((s) =>
        s['mctyDescription'].toLowerCase().contains(query.toLowerCase()));
    return list;
  }

  static Future<String> getCityNameById(String id) async {
    Map<String, String> headerss = {};
    SharedPreferences preferences = await SharedPreferences.getInstance();

    headerss['cookie'] = preferences.getString("cookie");
    print(headerss);
    final response = await http.get(
        "https://genius.remax.co.id/api/city/crud?pageSize=505",
        headers: headerss);
    List list = json.decode(response.body)['data'];
    String city;
    for (int i = 0; i < list.length; i++) {
      if (list[i]['id'] == id) {
        city = list[i]['mctyDescription'];
        return city;
      }
    }
    return city;
  }
}

class StateServiceMartial {
  static Future<List<dynamic>> getSuggestions(String query) async {
    Map<String, String> headerss = {};
    SharedPreferences preferences = await SharedPreferences.getInstance();

    headerss['cookie'] = preferences.getString("cookie");
    print(headerss);
    final response = await http.get(
        "https://genius.remax.co.id/api/maritalstatus/crud",
        headers: headerss);
    List list = json.decode(response.body)['data'];

    list.retainWhere(
        (s) => s['mmslName'].toLowerCase().contains(query.toLowerCase()));
    return list;
  }

  static Future<String> getMaritalNameById(String id) async {
    Map<String, String> headerss = {};
    SharedPreferences preferences = await SharedPreferences.getInstance();

    headerss['cookie'] = preferences.getString("cookie");
    print(headerss);
    final response = await http.get(
        "https://genius.remax.co.id/api/maritalstatus/crud?pageSize=100",
        headers: headerss);
    List list = json.decode(response.body)['data'];
    String marital;
    for (int i = 0; i < list.length; i++) {
      if (list[i]['id'] == id) {
        marital = list[i]['mmslName'];

        return marital;
      }
    }
    return marital;
  }
}
