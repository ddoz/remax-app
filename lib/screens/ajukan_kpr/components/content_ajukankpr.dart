import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remax_app/util/constants.dart';

class ContentAjukaKpr extends StatefulWidget {
  @override
  _ContentAjukaKprState createState() => _ContentAjukaKprState();
}

class _ContentAjukaKprState extends State<ContentAjukaKpr> {
  String _mySelection = "";

  String _valGender;
  String _valMarital;
  String _valTypeOfWork;
  String _valPuposeofCredit;
  String _creditFacility;
  String _creditPeriod;

  List _listGender = ["Male", "Female"];
  List _listMarital = ["Singel", "Married"];
  List _listTypeOfWork = ["1", "2"];
  List _listPurposeCredit = ["1", "2"];
  List _listCreditFacility = ["1", "2"];
  List _listCreditPeriod = ["1", "2"];


  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 45,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/person.svg",
                      color: kIconColor),
                ],
              ),
            ), //name
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
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
                value: _valGender,
                items: _listGender.map((value) {
                  return DropdownMenuItem(
                    child: Text(value, style: TextStyle(
                      fontSize: 14.0,
                    ),),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _valGender = value;
                  });
                },
              ),
            ), //gender
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
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
            ), //marital
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 45,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/mail.svg", color: kIconColor),
                ],
              ),
            ), //email
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 45,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Phone",
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/call_sc.svg",
                      color: kIconColor),
                ],
              ),
            ), //phone
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 45,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Place of Birth",
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/place_birth.svg",
                      color: kIconColor),
                ],
              ),
            ), //place of birth
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 45,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Date of Birth",
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/date_birth.svg",
                      color: kIconColor),
                ],
              ),
            ), //date of birth
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 85,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Address of Property for KPR",
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/location.svg",
                      color: kIconColor),
                ],
              ),
            ), //addres property
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
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
                hint: Text("Type of Work", style: TextStyle(
                  fontSize: 14.0,
                  color: kPrimaryColor.withOpacity(0.5),
                ),),
                value: _valTypeOfWork,
                items: _listTypeOfWork.map((value) {
                  return DropdownMenuItem(
                    child: Text(value, style: TextStyle(
                      fontSize: 14.0,
                    ),),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _valTypeOfWork = value;
                  });
                },
              ),
            ), //type of work
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 45,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Company Name",
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/company.svg",
                      color: kIconColor),
                ],
              ),
            ), //company name
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 85,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Company's Address",
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/location.svg",
                      color: kIconColor),
                ],
              ),
            ), //company address
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: kDefaultPadding, right: 5.0),
              height: 45,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Identity card'),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        side: BorderSide(color: kRedColor)),
                    onPressed: () {},
                    color: kRedColor,
                    textColor: Colors.white,
                    child: Text("Upload", style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
            ), //identity card
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: kDefaultPadding, right: 5.0),
              height: 45,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('NPWP'),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        side: BorderSide(color: kRedColor)),
                    onPressed: () {},
                    color: kRedColor,
                    textColor: Colors.white,
                    child: Text("Upload", style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
            ), //NPWP
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
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
                hint: Text("Type of Work", style: TextStyle(
                  fontSize: 14.0,
                  color: kPrimaryColor.withOpacity(0.5),
                ),),
                value: _valTypeOfWork,
                items: _listTypeOfWork.map((value) {
                  return DropdownMenuItem(
                    child: Text(value, style: TextStyle(
                      fontSize: 14.0,
                    ),),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _valTypeOfWork = value;
                  });
                },
              ),
            ), //type of work
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
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
                hint: Text("Purpose of Credit", style: TextStyle(
                  fontSize: 14.0,
                  color: kPrimaryColor.withOpacity(0.5),
                ),),
                value: _valPuposeofCredit,
                items: _listPurposeCredit.map((value) {
                  return DropdownMenuItem(
                    child: Text(value, style: TextStyle(
                      fontSize: 14.0,
                    ),),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _valPuposeofCredit = value;
                  });
                },
              ),
            ), //Purpose of credit
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 45,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Credit Type",
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/credit.svg",
                      color: kIconColor),
                ],
              ),
            ), //Credit type
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
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
                hint: Text("Credit Facility" , style: TextStyle(
                  fontSize: 14.0,
                  color: kPrimaryColor.withOpacity(0.5),
                ),),
                value: _creditFacility,
                items: _listCreditFacility.map((value) {
                  return DropdownMenuItem(
                    child: Text(value, style: TextStyle(
                      fontSize: 14.0,
                    ),),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _creditFacility = value;
                  });
                },
              ),
            ), //Credit Facility
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 45,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Loan Amount",
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/loan.svg",
                      color: kIconColor),
                ],
              ),
            ), //Loan Amount
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
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
                hint: Text("Credit Period", style: TextStyle(
                  fontSize: 14.0,
                  color: kPrimaryColor.withOpacity(0.5),
                ),),
                value: _creditPeriod,
                items: _listCreditPeriod.map((value) {
                  return DropdownMenuItem(
                    child: Text(value, style: TextStyle(
                      fontSize: 14.0,
                    ),),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _creditPeriod = value;
                  });
                },
              ),
            ), //Credit Period
            GestureDetector(
              onTap: () {
                //check();
              },
              child: new Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      side: BorderSide(color: kAppBarColorTheme)),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Select Bank',
                          style: TextStyle(
                              color: kAppBarColorTheme,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ), //Select bank
            CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                  "Dengan menandai persetujuan ini, Anda setuju dengan syarat dan ketentuan dari remax.co.id dan bank yang anda pilih serta memberikan otorisasi kepada remax.co.id untuk menawarkan produk bank dan meneruskan cata-data anda kepada bank afiliasi kami."),
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            GestureDetector(
              onTap: () {
                //check();
              },
              child: new Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  color: kAppBarColorTheme,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Register',
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
      ),
    );
  }
}
