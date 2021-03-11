import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remax_app/util/constants.dart';

class ContentAddCustomer extends StatefulWidget {
  @override
  _ContentAddCustomerState createState() => _ContentAddCustomerState();
}

class _ContentAddCustomerState extends State<ContentAddCustomer> {

  String _valProvince;
  List _listProvince = ["Jakarta", "Surabaya", "Medan"];

  String _valMarital;
  List _listMarital = ["Singel", "Married"];

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
              hint: Text("Gender", style: TextStyle(
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
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "City",
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
                SvgPicture.asset("assets/icons/identitycard.svg", color: kIconColor),
              ],
            ),
          ),

          new Container(
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
