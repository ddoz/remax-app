import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:remax_app/screens/addcustomer/components/content_add_customer.dart';
import 'package:remax_app/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DetailEditCustomer extends StatefulWidget {

  List list;
  int index;

  DetailEditCustomer({this.index, this.list});

  @override
  _DetailEditCustomerState createState() => _DetailEditCustomerState();
}

class _DetailEditCustomerState extends State<DetailEditCustomer> {

  var controllerName = TextEditingController();
  var controllerAddress = TextEditingController();
  var controllerProvince = TextEditingController();
  var controllerCity = TextEditingController();
  var controllerMobileNmbr = TextEditingController();
  var controllerPhoneNumber = TextEditingController();
  var controllerEmail = TextEditingController();
  var controllerMarital = TextEditingController();
  var controllerIdentityNumber = TextEditingController();

  String idProv, idCity, idMarital, idCustomer;


  bool enableTv = false;

  String buttonText = "Edit";

  Map<String, String> headerss = {};


  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      setState(() {
        headerss['cookie'] = preferences.getString("cookie");
      });

    });
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    idCustomer = widget.list[widget.index]['custId'];
    controllerName.text = widget.list[widget.index]['custName'];
    controllerAddress.text = widget.list[widget.index]['custAddress'];
    idProv = widget.list[widget.index]['links']['custProvinceId'];
    //controllerProvince.text = widget.list[widget.index]['links']['custProvinceId'];
    idCity = widget.list[widget.index]['links']['custCityId'];
    //controllerCity.text = widget.list[widget.index]['links']['custCityId'];
    controllerMobileNmbr.text = widget.list[widget.index]['custMobile'];
    controllerPhoneNumber.text = widget.list[widget.index]['custPhone'];
    controllerEmail.text = widget.list[widget.index]['custEmail'];
    idMarital = widget.list[widget.index]['links']['custMaritalStatusId'];
    //controllerMarital.text = widget.list[widget.index]['links']['custMaritalStatusId'];
    controllerIdentityNumber.text = widget.list[widget.index]['custKTP'];
    getProv();
    getCity();
    getMarital();
    getPref();
  }

  getProv() async {
    controllerProvince.text = await StateServiceProv.getProvNameById(widget.list[widget.index]['links']['custProvinceId']);
  }
  getCity() async {
    controllerCity.text = await StateServiceCity.getCityNameById(widget.list[widget.index]['links']['custCityId']);
  }
  getMarital() async {
    controllerMarital.text = await StateServiceMartial.getMaritalNameById(widget.list[widget.index]['links']['custMaritalStatusId']);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kAppBarColorTheme, //change your color here
        ),
        title: Text(
          "Detail Customer",
          style: TextStyle(color: kAppBarColorTheme),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
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
                      controller: controllerName,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Customer Name",
                        hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabled: enableTv,
                        // surffix isn't working properly  with SVG
                        // thats why we use row
                        // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/person.svg"),
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
                      controller: controllerAddress,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Cust Address",
                        hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabled: enableTv,
                        // surffix isn't working properly  with SVG
                        // thats why we use row
                        // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/location.svg", color: kIconColor,),
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
                    controller: this.controllerProvince,
                  ),
                  suggestionsCallback: (pattern) async {
                    return await StateServiceProv.getSuggestions(pattern);
                  },
                  transitionBuilder:
                      (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion['mprvDescription']),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    this.controllerProvince.text = suggestion['mprvDescription'];
                    //print( suggestion['mprvDescription'] +" idnya adalah "+suggestion['id']);
                    setState(() {
                      idProv = suggestion['id'];
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
                    controller: this.controllerCity,
                  ),
                  suggestionsCallback: (pattern) async {
                    return await StateServiceCity.getSuggestions(pattern);
                  },
                  transitionBuilder:
                      (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion['mctyDescription']),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    this.controllerCity.text = suggestion['mctyDescription'];
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
                    controller: this.controllerMarital,
                  ),
                  suggestionsCallback: (pattern) async {
                    return await StateServiceMartial.getSuggestions(pattern);
                  },
                  transitionBuilder:
                      (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion['mmslName']),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    this.controllerMarital.text = suggestion['mmslName'];
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
                      controller: controllerMobileNmbr,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Mobile Number",
                        hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabled: enableTv,
                        // surffix isn't working properly  with SVG
                        // thats why we use row
                        // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/mobile_phone.svg", color: kIconColor),
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
                      controller: controllerPhoneNumber,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabled: enableTv,
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
                      controller: controllerEmail,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabled: enableTv,
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
                      controller: controllerIdentityNumber,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Identity Number",
                        hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabled: enableTv,
                        // surffix isn't working properly  with SVG
                        // thats why we use row
                        // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/identitycard.svg", color: kIconColor),
                ],
              ),
            ),

            GestureDetector(
              onTap: (){
                if (enableTv == false){
                  setState(() {
                    enableTv = true;
                    buttonText = "Save Edit";
                  });
                } else {
                  setState(() {
                    enableTv = false;
                    //buttonText = "Edit";
                    addData();
                  });

                }
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
                          buttonText,
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
      )
    );
  }

  String validator(){
    String error = "kosong";
    if (controllerName.text.isEmpty){
      error = "Nama cust tidak boleh kosong";
      return error;
    } else if (controllerAddress.text.isEmpty){
      error = "Alamat cust tidak boleh kosong";
      return error;
    } else if (controllerMobileNmbr.text.isEmpty){
      error = "Email cust tidak boleh kosong";
      return error;
    } else if (controllerPhoneNumber.text.isEmpty){
      error = "Phone Number cust tidak boleh kosong";
      return error;
    } else if (controllerEmail.text.isEmpty){
      error = "Mobile Number cust tidak boleh kosong";
      return error;
    } else if (controllerIdentityNumber.text.isEmpty){
      error = "No KTP cust tidak boleh kosong";
      return error;
    } else {
      return error;
    }
  }

  addData() async {
    showLoaderDialog(context);

    if(validator() == "kosong"){
      Map dataCust = {
        "custAddress": controllerAddress.text,
        "custEmail": controllerEmail.text,
        "custKTP": controllerIdentityNumber.text,
        "custMobile": controllerMobileNmbr.text,
        "custName": controllerName.text,
        "custPhone": controllerPhoneNumber.text,
        "links" : {
          "custCityId": idCity,
          "custMaritalStatusId": idMarital,
          "custProvinceId": idProv
        }
      };
      var body = json.encode(dataCust);
      print(body);
      headerss['Content-Type'] = "application/json";
      print(headerss);

      final response = await http.put("https://genius.remax.co.id/api/customer/crud/${idCustomer}",
          headers: headerss, body: body);

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

  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 10,),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  void _showToast(BuildContext context, String message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: new Text(message),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}

//class StateServiceProv {
//  static Future<String> getProvNameById(String id) async {
//
//    Map<String, String> headerss = {};
//    SharedPreferences preferences = await SharedPreferences.getInstance();
//
//    headerss['cookie'] = preferences.getString("cookie");
//    print(headerss);
//    final response = await http.get(
//        "https://genius.remax.co.id/api/province/crud?pageSize=100",
//        headers: headerss);
//    List list = json.decode(response.body)['data'];
//    String prov;
//    for(int i=0; i<list.length; i++){
//      if(list[i]['id']==id){
//        prov = list[i]['mprvDescription'];
//
//        return prov;
//      }
//    }
//
//    //list.retainWhere((s) => s['mprvDescription'].toLowerCase().contains(query.toLowerCase()));
//
//  }
//}

