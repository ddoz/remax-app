import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remax_app/util/constants.dart';

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


  String _valProvince;
  List _listProvince = ["Jakarta", "Surabaya", "Medan"];

  String _valMarital;
  List _listMarital = ["Singel", "Married"];

  bool enableTv = false;

  String buttonText = "Edit";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerName.text = widget.list[widget.index]['custName'];
    controllerAddress.text = widget.list[widget.index]['custAddress'];
    controllerProvince.text = widget.list[widget.index]['links']['custProvinceId'];
    controllerCity.text = widget.list[widget.index]['links']['custCityId'];
    controllerMobileNmbr.text = widget.list[widget.index]['custMobile'];
    controllerPhoneNumber.text = widget.list[widget.index]['custPhone'];
    controllerEmail.text = widget.list[widget.index]['custEmail'];
    controllerMarital.text = widget.list[widget.index]['links']['custMaritalStatusId'];
    controllerIdentityNumber.text = widget.list[widget.index]['custKTP'];
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
              child: DropdownButton(
                underline: SizedBox(),
                icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                isExpanded: true,
                hint: Text("Province", style: TextStyle(
                  fontSize: 14.0,
                  color: kPrimaryColor.withOpacity(0.5),
                ),),
                value: _valProvince,
                items: _listProvince.map((value) {
                  return DropdownMenuItem(
                    child: Text(value, style: TextStyle(
                      fontSize: 14.0,
                    ),),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _valProvince = value;
                  });
                },
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
                      controller: controllerCity,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "City",
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
                  SvgPicture.asset("assets/icons/city.svg", color: kIconColor),
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
                borderRadius: BorderRadius.circular(7),
              ),
              child: DropdownButton(
                underline: SizedBox(),
                icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                isExpanded: true,
                hint: Text("Marital Status", style: TextStyle(
                  fontSize: 14.0,
                  color: kPrimaryColor.withOpacity(0.5),
                ),),
                value: _valMarital,
                items: _listMarital.map((value) {
                  return DropdownMenuItem(
                    child: Text(value, style: TextStyle(
                      fontSize: 14.0,
                    ),),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _valMarital = value;
                  });
                },
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
                    buttonText = "Edit";
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
}
