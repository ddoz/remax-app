import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:random_string/random_string.dart';
import 'package:remax_app/screens/addcustomer/components/content_add_customer.dart';
import 'package:remax_app/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContentAddInfoListing extends StatefulWidget {
  final ScrollController scrollController;

  ContentAddInfoListing({this.scrollController});

  @override
  _ContentAddInfoState createState() => _ContentAddInfoState();
}

enum AddListingStatus { addInfo, inputDetail }

class _ContentAddInfoState extends State<ContentAddInfoListing> {
  Map<String, String> headerss = {};
  Map<String, String> headerssX = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    getPrefBahasa();
  }

  AddListingStatus _addStatus = AddListingStatus.addInfo;

  bool checkedValueLamudi = false;
  String isLamudi = "0";
  bool checkedValueRumah123 = false;
  String isRumah123 = "0";

  String nameUser, officeId, officeName, member;

  //Links
  String agentId,
      ownerId,
      countryId,
      provId,
      cityId,
      listingTypeId,
      listingCategoryId,
      propertyTypeId,
      certificateTypeId,
      currenciesId;

  // Page 1 Controller
  DateTime selectedPublishDate = DateTime.now();
  TextEditingController controllerPublishDate = new TextEditingController();

  DateTime selectedExpiryDate = DateTime.now();
  TextEditingController controllerExpiryDate = new TextEditingController();

  TextEditingController controllerOfficeName = new TextEditingController();
  TextEditingController controllerAgentName = new TextEditingController();
  TextEditingController controllerListingTitle = new TextEditingController();
  TextEditingController controllerCustomListingUrl =
      new TextEditingController();
  TextEditingController controllerOwnerName = new TextEditingController();
  TextEditingController controllerStreetName = new TextEditingController();
  TextEditingController controllerCountry = new TextEditingController();
  TextEditingController controllerProv = new TextEditingController();
  TextEditingController controllerHouseNo = new TextEditingController();
  TextEditingController controllerBlockNo = new TextEditingController();
  TextEditingController controllerCity = new TextEditingController();
  TextEditingController controllerPostCode = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerDescription = new TextEditingController();

  //Page 2 Controller
  TextEditingController controllerListingType = new TextEditingController();
  TextEditingController controllerListingCategory = new TextEditingController();
  TextEditingController controllerPropertyType = new TextEditingController();
  TextEditingController controllerCertificateType = new TextEditingController();
  TextEditingController controllerLandSize = new TextEditingController();
  TextEditingController controllerBuildingSize = new TextEditingController();
  TextEditingController controllerCurrencies = new TextEditingController();
  TextEditingController controllerPercent = new TextEditingController();
  TextEditingController controllerRupiah = new TextEditingController();

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      officeId = preferences.getString("office");
      officeName = preferences.getString("officename");
      nameUser = preferences.getString("name");
      member = preferences.getString("member");
      headerss['cookie'] = preferences.getString("cookie");
      headerssX['cookie'] = preferences.getString("cookie");

      controllerOfficeName.text = officeName;
    });
  }

  Future<void> _selectPublishDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedPublishDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedPublishDate)
      setState(() {
        selectedPublishDate = picked;
        //controllerPublishDate.text = convertTanggal(selectedPublishDate);
        controllerPublishDate.text = selectedPublishDate.toString();
      });
  }

  Future<void> _selectExpiryDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedExpiryDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedExpiryDate)
      setState(() {
        selectedExpiryDate = picked;
        //controllerExpiryDate.text = convertTanggal(selectedExpiryDate);
        controllerExpiryDate.text = selectedExpiryDate.toString();
      });
  }

  String convertTanggal(DateTime dtm) {
    String tanggal = dtm.toString();
    String tgl = tanggal.substring(8, 10);
    String bln = tanggal.substring(5, 7);
    String thn = tanggal.substring(0, 4);
//    if (bln == "01") {
//      bln = "Jan";
//    }
//    if (bln == "02") {
//      bln = "Feb";
//    }
//    if (bln == "03") {
//      bln = "Mar";
//    }
//    if (bln == "04") {
//      bln = "Apr";
//    }
//    if (bln == "05") {
//      bln = "Mei";
//    }
//    if (bln == "06") {
//      bln = "Jun";
//    }
//    if (bln == "07") {
//      bln = "Jul";
//    }
//    if (bln == "08") {
//      bln = "Agu";
//    }
//    if (bln == "09") {
//      bln = "Sep";
//    }
//    if (bln == "10") {
//      bln = "Okt";
//    }
//    if (bln == "11") {
//      bln = "Nov";
//    }
//    if (bln == "12") {
//      bln = "Des";
//    }
    return tgl + "-" + bln + "-" + thn;
  }

  String _valBedRooms;
  List _listBedRooms = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];

  String _valHelpersBedRoooms;
  List _listHelpersBedroom = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10"
  ];

  String _valBathRoom;
  List _listBathRoom = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];

  String _valHelperBathroom;
  List _listHelperBathroom = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10"
  ];

  List<Asset> images = <Asset>[];
  List files = [];
  List<MultipartFile> multipartImageList = [];
  List<File> listFile = [];
  String _error = 'No Error Detected';
  Widget buildGridView() {
    // return GridView.count(
    //   crossAxisCount: 3,
    //   children: List.generate(images.length, (index) {
    //     Asset asset = images[index];
    //     return AssetThumb(
    //       asset: asset,
    //       width: 300,
    //       height: 300,
    //     );
    //   }),
    // );
    return ListView.builder(
      shrinkWrap: true,
      itemCount: images.length,
      itemBuilder: (context, i) {
        Asset asset = images[i];
        return Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AssetThumb(asset: asset, width: 100, height: 100),
                    InkWell(
                      onTap: () {
                        setState(() {
                          images = List.from(images)..removeAt(i);
                        });
                      },
                      child: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );

        // return ListTile(title: Text(images[i].name));
      },
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Remax",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    switch (_addStatus) {
      case AddListingStatus.addInfo:
        return Stack(children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
            // It will cover 20% of our total height
            height: size.height * 0.45,
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: new AssetImage(
                      "assets/icons/bg_header.png",
                    ),
                    fit: BoxFit.cover,
                  )),
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 40.0),
                          width: 151,
                          height: 56,
                          child: Image.asset("assets/logo/logo_remax.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: SvgPicture.asset(
                              "assets/icons/add_info_listing.svg"),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Add Info Listing',
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              'Input Detail',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.50)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: new EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .30),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    color: Colors.white),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      margin:
                          EdgeInsets.only(top: 35.0, left: 15.0, bottom: 10.0),
                      child: new Align(
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          'Add Info Listing',
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    new Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 15.0),
                        width: 40,
                        height: 2,
                        color: const Color(0xffDC1B2E),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Please input your listing details below\n(approximate time to complete this form is 3 minutes)',
                      ),
                    ),
                    new Align(
                      child: Container(
                        margin: EdgeInsets.all(15.0),
                        height: 2,
                        color: kGreyBgSearch,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          margin:
                              EdgeInsets.only(top: 10, left: 15.0, right: 5.0),
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.43,
                          decoration: BoxDecoration(
                            color: kLightGrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _selectPublishDate(context);
                                  },
                                  child: TextField(
                                    enabled: false,
                                    controller: controllerPublishDate,
                                    onChanged: (value) {},
                                    style: TextStyle(fontSize: 13.0),
                                    decoration: InputDecoration(
                                        hintText: "Publish Date",
                                        hintStyle: TextStyle(
                                            color:
                                                kPrimaryColor.withOpacity(0.5),
                                            fontSize: 13.0),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none
                                        // surffix isn't working properly  with SVG
                                        // thats why we use row
                                        // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                                        ),
                                  ),
                                ),
//                              GestureDetector(
//                                  onTap: () {
//                                    _selectDate(context);
//                                  },
//                                  child: Text("${selectedDate.toLocal()}"
//                                      .split(' ')[0])),
                              ),
                              SvgPicture.asset(
                                "assets/icons/calendar.svg",
                                color: kIconColor,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin:
                              EdgeInsets.only(top: 10, left: 15.0, right: 5.0),
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.43,
                          decoration: BoxDecoration(
                            color: kLightGrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _selectExpiryDate(context);
                                  },
                                  child: TextField(
                                    enabled: false,
                                    controller: controllerExpiryDate,
                                    onChanged: (value) {},
                                    style: TextStyle(fontSize: 13.0),
                                    decoration: InputDecoration(
                                        hintText: "Expiry Date",
                                        hintStyle: TextStyle(
                                            color:
                                                kPrimaryColor.withOpacity(0.5),
                                            fontSize: 13.0),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none
                                        // surffix isn't working properly  with SVG
                                        // thats why we use row
                                        // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                                        ),
                                  ),
                                ),
//                              GestureDetector(
//                                  onTap: () {
//                                    _selectDate(context);
//                                  },
//                                  child: Text("${selectedDate.toLocal()}"
//                                      .split(' ')[0])),
                              ),
                              SvgPicture.asset(
                                "assets/icons/calendar.svg",
                                color: kIconColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                              controller: controllerOfficeName,
                              decoration: InputDecoration(
                                hintText: "Office Name",
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
                            "assets/icons/company.svg",
                            color: kIconColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              hintText: "Agent Name",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            controller: this.controllerAgentName,
                          ),
                          suggestionsCallback: (pattern) async {
                            return await StateServiceAgentName.getSuggestions(
                                pattern);
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion['mmbsNick']),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            this.controllerAgentName.text =
                                suggestion['mmbsNick'];
                            setState(() {
                              agentId = suggestion['mmbsId'];
                            });
                          }),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                              controller: controllerListingTitle,
                              decoration: InputDecoration(
                                hintText: "Listing Title",
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
                            "assets/icons/pencil.svg",
                            color: kIconColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                              controller: controllerCustomListingUrl,
                              decoration: InputDecoration(
                                hintText: "Custom Listing URL",
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
                            "assets/icons/url.svg",
                            color: kIconColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              hintText: "Owner Name",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            controller: this.controllerOwnerName,
                          ),
                          suggestionsCallback: (pattern) async {
                            return await StateServiceOwner.getSuggestions(
                                pattern);
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion['custName']),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            this.controllerOwnerName.text =
                                suggestion['custName'];
                            setState(() {
                              ownerId = suggestion['id'];
                            });
                          }),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 85,
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                              onChanged: (value) {},
                              controller: controllerStreetName,
                              decoration: InputDecoration(
                                hintText: "Street Name",
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
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              hintText: "Country",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            controller: this.controllerCountry,
                          ),
                          suggestionsCallback: (pattern) async {
                            return await StateServiceCountry.getSuggestions(
                                pattern);
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion['mctrDescription']),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            this.controllerCountry.text =
                                suggestion['mctrDescription'];
                            setState(() {
                              countryId = suggestion['id'];
                            });
                          }),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                            controller: this.controllerProv,
                          ),
                          suggestionsCallback: (pattern) async {
                            return await StateServiceProv.getSuggestions(
                                pattern);
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
                            this.controllerProv.text =
                                suggestion['mprvDescription'];
                            setState(() {
                              provId = suggestion['id'];
                            });
                          }),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          margin:
                              EdgeInsets.only(top: 10, left: 15.0, right: 5.0),
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.43,
                          decoration: BoxDecoration(
                            color: kLightGrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {},
                                  controller: controllerHouseNo,
                                  decoration: InputDecoration(
                                      hintText: "House No.",
                                      hintStyle: TextStyle(
                                        color: kPrimaryColor.withOpacity(0.5),
                                      ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none
                                      // surffix isn't working properly  with SVG
                                      // thats why we use row
                                      // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                                      ),
                                ),
//                              GestureDetector(
//                                  onTap: () {
//                                    _selectDate(context);
//                                  },
//                                  child: Text("${selectedDate.toLocal()}"
//                                      .split(' ')[0])),
                              ),
                              SvgPicture.asset(
                                "assets/icons/house_number.svg",
                                color: kIconColor,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin:
                              EdgeInsets.only(top: 10, left: 15.0, right: 5.0),
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.43,
                          decoration: BoxDecoration(
                            color: kLightGrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {},
                                  controller: controllerBlockNo,
                                  decoration: InputDecoration(
                                      hintText: "Block No.",
                                      hintStyle: TextStyle(
                                        color: kPrimaryColor.withOpacity(0.5),
                                      ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none
                                      // surffix isn't working properly  with SVG
                                      // thats why we use row
                                      // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                                      ),
                                ),

//                              GestureDetector(
//                                  onTap: () {
//                                    _selectDate(context);
//                                  },
//                                  child: Text("${selectedDate.toLocal()}"
//                                      .split(' ')[0])),
                              ),
                              SvgPicture.asset(
                                "assets/icons/house_number.svg",
                                color: kIconColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          margin:
                              EdgeInsets.only(top: 10, left: 15.0, right: 5.0),
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          width: MediaQuery.of(context).size.width * 0.43,
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
                                return await StateServiceCity.getSuggestions(
                                    pattern);
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
                                this.controllerCity.text =
                                    suggestion['mctyDescription'];
                                setState(() {
                                  cityId = suggestion['id'];
                                });
                              }),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin:
                              EdgeInsets.only(top: 10, left: 15.0, right: 5.0),
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.43,
                          decoration: BoxDecoration(
                            color: kLightGrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {},
                                  controller: controllerPostCode,
                                  decoration: InputDecoration(
                                      hintText: "Post Code",
                                      hintStyle: TextStyle(
                                        color: kPrimaryColor.withOpacity(0.5),
                                      ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none
                                      // surffix isn't working properly  with SVG
                                      // thats why we use row
                                      // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                                      ),
                                ),

//                              GestureDetector(
//                                  onTap: () {
//                                    _selectDate(context);
//                                  },
//                                  child: Text("${selectedDate.toLocal()}"
//                                      .split(' ')[0])),
                              ),
                              SvgPicture.asset(
                                "assets/icons/postcode.svg",
                                color: kIconColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {},
                              controller: controllerPrice,
                              decoration: InputDecoration(
                                hintText: "Price",
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
                            "assets/icons/price.svg",
                            color: kIconColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 105,
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              onChanged: (value) {},
                              controller: controllerDescription,
                              decoration: InputDecoration(
                                hintText: "Description Property",
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
                            "assets/icons/message.svg",
                            color: kIconColor,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.scrollController.animateTo(
                            widget.scrollController.position.minScrollExtent,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                        setState(() {
                          _addStatus = AddListingStatus.inputDetail;
                        });
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
                                  'Next',
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
                )),
          ),
        ]);
        break;
      case AddListingStatus.inputDetail:
        return Stack(children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
            // It will cover 20% of our total height
            height: size.height * 0.45,
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: new AssetImage(
                      "assets/icons/bg_header.png",
                    ),
                    fit: BoxFit.cover,
                  )),
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 40.0),
                          width: 151,
                          height: 56,
                          child: Image.asset("assets/logo/logo_remax.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child:
                              SvgPicture.asset("assets/icons/input_detail.svg"),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Add Info Listing',
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              'Input Detail',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: new EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .35),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    color: Colors.white),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      margin:
                          EdgeInsets.only(top: 35.0, left: 15.0, bottom: 10.0),
                      child: new Align(
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          'Input Detail',
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    new Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 15.0),
                        width: 40,
                        height: 2,
                        color: const Color(0xffDC1B2E),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0, left: 15.0),
                      child: Text(
                        'Please input your listing details below (approximate time to complete this form is 3 minutes)',
                      ),
                    ),
                    new Align(
                      child: Container(
                        margin: EdgeInsets.all(15.0),
                        height: 2,
                        color: kGreyBgSearch,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              hintText: "Listing Type",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            controller: this.controllerListingType,
                          ),
                          suggestionsCallback: (pattern) async {
                            return await StateServiceListingType.getSuggestions(
                                pattern);
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion['lstlName']),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            this.controllerListingType.text =
                                suggestion['lstlName'];
                            setState(() {
                              listingTypeId = suggestion['id'];
                            });
                          }),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              hintText: "Listing Category",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            controller: this.controllerListingCategory,
                          ),
                          suggestionsCallback: (pattern) async {
                            return await StateServiceListingCategory
                                .getSuggestions(pattern);
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion['lsclName']),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            this.controllerListingCategory.text =
                                suggestion['lsclName'];
                            setState(() {
                              listingCategoryId = suggestion['id'];
                            });
                          }),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              hintText: "Property Type",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            controller: this.controllerPropertyType,
                          ),
                          suggestionsCallback: (pattern) async {
                            return await StateServicePropertyType
                                .getSuggestions(pattern);
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion['prtlName']),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            this.controllerPropertyType.text =
                                suggestion['prtlName'];
                            setState(() {
                              propertyTypeId = suggestion['id'];
                            });
                          }),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              hintText: "Certificate Type",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            controller: this.controllerCertificateType,
                          ),
                          suggestionsCallback: (pattern) async {
                            return await StateServiceCertificateType
                                .getSuggestions(pattern);
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion['ltlgName']),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            this.controllerCertificateType.text =
                                suggestion['ltlgName'];
                            setState(() {
                              certificateTypeId = suggestion['id'];
                            });
                          }),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                              controller: controllerLandSize,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Land Size",
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
                            "assets/icons/land_size.svg",
                            color: kIconColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                              controller: controllerBuildingSize,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Building Size",
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
                            "assets/icons/home.svg",
                            color: kIconColor,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 10, left: 15.0),
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          height: 45,
                          decoration: BoxDecoration(
                            color: kLightGrey,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: DropdownButton(
                            underline: SizedBox(),
                            icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                            isExpanded: true,
                            hint: Text(
                              "Bedrooms",
                              style: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                            ),
                            value: _valBedRooms,
                            items: _listBedRooms.map((value) {
                              return DropdownMenuItem(
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _valBedRooms = value;
                              });
                            },
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 10, right: 15.0),
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          height: 45,
                          decoration: BoxDecoration(
                            color: kLightGrey,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: DropdownButton(
                            underline: SizedBox(),
                            icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                            isExpanded: true,
                            hint: Text(
                              "Helper Bedrooms",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                            ),
                            value: _valHelpersBedRoooms,
                            items: _listHelpersBedroom.map((value) {
                              return DropdownMenuItem(
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _valHelpersBedRoooms = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 10, left: 15.0),
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          height: 45,
                          decoration: BoxDecoration(
                            color: kLightGrey,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: DropdownButton(
                            underline: SizedBox(),
                            icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                            isExpanded: true,
                            hint: Text(
                              "Bathroom",
                              style: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                            ),
                            value: _valBathRoom,
                            items: _listBathRoom.map((value) {
                              return DropdownMenuItem(
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _valBathRoom = value;
                              });
                            },
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 10, right: 15.0),
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          height: 45,
                          decoration: BoxDecoration(
                            color: kLightGrey,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: DropdownButton(
                            underline: SizedBox(),
                            icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                            isExpanded: true,
                            hint: Text(
                              "Helper Bathroom",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                            ),
                            value: _valHelperBathroom,
                            items: _listHelperBathroom.map((value) {
                              return DropdownMenuItem(
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _valHelperBathroom = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              hintText: "Currencies",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            controller: this.controllerCurrencies,
                          ),
                          suggestionsCallback: (pattern) async {
                            return await StateServiceCurrencies.getSuggestions(
                                pattern);
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion['mculName']),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            this.controllerCurrencies.text =
                                suggestion['mculName'];
                            setState(() {
                              currenciesId = suggestion['id'];
                            });
                          }),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {},
                              controller: controllerPercent,
                              decoration: InputDecoration(
                                hintText: "Commision In %",
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
                            "assets/icons/commision.svg",
                            color: kIconColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {},
                              controller: controllerRupiah,
                              decoration: InputDecoration(
                                hintText: "Commision in Rp",
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
                            "assets/icons/rupiah.svg",
                            color: kIconColor,
                          ),
                        ],
                      ),
                    ),
                    //Publish On Portal Below
                    Container(
                        alignment: Alignment.centerLeft,
                        margin:
                            EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                        child: Text('Publish On Portal Below:')),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text("Lamudi"),
                      value: checkedValueLamudi,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValueLamudi = newValue;
                          if (checkedValueLamudi == true) {
                            isLamudi = "1";
                          } else {
                            isLamudi = "0";
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text("Rumah123"),
                      value: checkedValueRumah123,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValueRumah123 = newValue;
                          if (checkedValueRumah123 == true) {
                            isRumah123 = "1";
                          } else {
                            isRumah123 = "0";
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                    GestureDetector(
                      onTap: () {
                        loadAssets();
                      },
                      child: new Container(
                        height: 70.0,
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Card(
                          elevation: 5.0,
                          color: kRedColor,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset("assets/icons/upload.svg"),
                                SizedBox(width: 10.0),
                                Text(
                                  'Upload Files',
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
                    Container(child: buildGridView()),
                    GestureDetector(
                      onTap: () {
                        widget.scrollController.animateTo(
                            widget.scrollController.position.maxScrollExtent,
                            duration: Duration(milliseconds: 100),
                            curve: Curves.ease);
                        setState(() {
                          _addStatus = AddListingStatus.addInfo;
                        });
                      },
                      child: new Container(
                        margin: EdgeInsets.all(10.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            side: BorderSide(
                              color: kAppBarColorTheme,
                              width: 1.0,
                            ),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Previous',
                                  style: TextStyle(
                                      color: kAppBarColorTheme,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        publishListing();
                      },
                      child: new Container(
                        margin: EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 10.0),
                        child: Card(
                          color: kAppBarColorTheme,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Publish',
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
                )),
          ),
        ]);
        break;
    }
  }

  String validator() {
    String error = "kosong";
    if (controllerPublishDate.text.isEmpty) {
      error = "Publish Date tidak boleh kosong";
      return error;
    } else if (controllerExpiryDate.text.isEmpty) {
      error = "Expiry Date tidak boleh kosong";
      return error;
    } else if (officeId == null) {
      error = "Office Name tidak boleh kosong";
      return error;
    } else if (agentId == null) {
      error = "Agent Name tidak boleh kosong";
      return error;
    } else if (controllerListingTitle.text.isEmpty) {
      error = "Listing title tidak boleh kosong";
      return error;
    } else if (controllerCustomListingUrl.text.isEmpty) {
      error = "Custom URL tidak boleh kosong";
      return error;
    } else if (ownerId == null) {
      error = "Owner Name tidak boleh kosong";
      return error;
    } else if (controllerStreetName.text.isEmpty) {
      error = "Street Name tidak boleh kosong";
      return error;
    } else if (countryId == null) {
      error = "Country tidak boleh kosong";
      return error;
    } else if (provId == null) {
      error = "Province tidak boleh kosong";
      return error;
    } else if (controllerHouseNo.text.isEmpty) {
      error = "House Number tidak boleh kosong";
      return error;
    } else if (controllerBlockNo.text.isEmpty) {
      error = "Block Number tidak boleh kosong";
      return error;
    } else if (cityId == null) {
      error = "City tidak boleh kosong";
      return error;
    } else if (controllerPrice.text.isEmpty) {
      error = "Price tidak boleh kosong";
      return error;
    } else if (controllerDescription.text.isEmpty) {
      error = "Description tidak boleh kosong";
      return error;
    } else if (listingTypeId == null) {
      error = "Listing Type tidak boleh kosong";
      return error;
    } else if (listingCategoryId == null) {
      error = "Listing Category tidak boleh kosong";
      return error;
    } else if (propertyTypeId == null) {
      error = "Property Type tidak boleh kosong";
      return error;
    } else if (certificateTypeId == null) {
      error = "Certificate Type tidak boleh kosong";
      return error;
    } else if (controllerLandSize.text.isEmpty) {
      error = "Land Size tidak boleh kosong";
      return error;
    } else if (controllerBuildingSize.text.isEmpty) {
      error = "Building Size tidak boleh kosong";
      return error;
    } else if (_valBedRooms == null) {
      error = "Bedroom tidak boleh kosong";
      return error;
    } else if (_valBathRoom == null) {
      error = "Bathroom tidak boleh kosong";
      return error;
    } else if (_valHelperBathroom == null) {
      error = "Helper Bathroom tidak boleh kosong";
      return error;
    } else if (_valHelpersBedRoooms == null) {
      error = "Helper Bedroom tidak boleh kosong";
      return error;
    } else if (currenciesId == null) {
      error = "Currencies tidak boleh kosong";
      return error;
    } else if (controllerPercent.text.isEmpty) {
      error = "Commision Percent tidak boleh kosong";
      return error;
    } else if (controllerRupiah.text.isEmpty) {
      error = "Commision Rupiah tidak boleh kosong";
      return error;
    } else {
      return error;
    }
  }

  String label_loading = "";
  getPrefBahasa() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    label_loading = "Loading";
    if (preferences.getString("bahasa") != null) {
      if (preferences.getString("bahasa") == "id_ID") {
        label_loading = "Memuat";
      } else {
        label_loading = "Loading";
      }
      setState(() {
        label_loading = label_loading;
      });
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
              margin: EdgeInsets.only(left: 7),
              child: Text("$label_loading...")),
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
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: new Text(message),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  publishListing() async {
    showLoaderDialog(context);
    getFileList();

    if (validator() == "kosong") {
      Map dataListing = {
        "listStreetName": controllerStreetName.text,
        "listTitle": controllerListingTitle.text,
        "listDescription": controllerDescription.text,
        "listBlock": controllerBlockNo.text,
        "listHouseNumber": controllerHouseNo.text,
        "listUrl": controllerCustomListingUrl.text,
        "listPostalCode": controllerPostCode.text,
        "listCoordinat": "",
        "listListingPrice": controllerPrice.text,
        "listPublishDate": controllerPublishDate.text,
        "listExpiryDate": controllerExpiryDate.text,
        "listBedroom": _valBedRooms,
        "listLandSize": controllerLandSize.text,
        "listBuildingSize": controllerBuildingSize.text,
        "listBathroom": _valBathRoom,
        "listLamudi": isLamudi,
        "listRumah123": isRumah123,
        "listValueSVTO": "",
        "listCreatedTime": "",
        "listIdListing": "",
        "listCommissionPercentage": controllerPercent.text,
        "listCommissionMoneter": controllerRupiah.text,
        "listMaidRoom": _valHelpersBedRoooms,
        "listMaidBathroom": _valHelperBathroom,
        "links": {
          "listCustId": ownerId,
          "listType": listingTypeId,
          "listMmbsId": agentId,
          "listOfficeId": officeId,
          "listCityId": cityId,
          "listProvinceId": provId,
          "listCountryId": countryId,
          "listListingStatusId": listingTypeId,
          "listListingCategoryId": listingCategoryId,
          "listPropertyTypeId": propertyTypeId,
          // "listRentFreqId": listingTypeId,
          "listLegalTermId": certificateTypeId,
          "listCurrencyId": currenciesId,
          "listDistrictId": "",
          "listFile": ""
        }
      };

      var body = json.encode(dataListing);

      headerss['Content-Type'] = "application/json";
      // headerssX['Content-Type'] = "multipart/form-data";

      try {
        final response = await http.post(
            "https://genius.remax.co.id/api/listing/crud",
            headers: headerss,
            body: body);

        final data = jsonDecode(response.body);
        String listId = data['data']['listId'];

        String urlImage =
            "https://genius.remax.co.id/api/listing/crud/${listId}/links/listingFile";
        postImage(urlImage);
      } catch (e) {
        print(e);
      }
    } else {
      Navigator.pop(context);
      _showToast(context, validator());
    }
  }

  postImage(String url) async {
    try {
      var dio = Dio();
      var j = 1;
      for (var i = 0; i < images.length; i++) {
        var path =
            await FlutterAbsolutePath.getAbsolutePath(images[i].identifier);
        var file = await getImageFileFromAsset(path);
        var filetype = p.extension(path);
        var filename = randomAlphaNumeric(10);
        var formDataPostImage = FormData.fromMap({
          "listFile[0]": new MultipartFile.fromBytes(file.readAsBytesSync(),
              filename: '$filename$filetype')
        });
        j++;
        try {
          var responses =
              await http.post(url, headers: headerssX, body: formDataPostImage);
          print(responses);
        } catch (e) {
          print(e);
        }
      }
      Navigator.pop(context);
      _showToast(context, "Berhasil Upload");
    } catch (e) {
      print(e);
      Navigator.pop(context);
      _showToast(context, "Gagal Upload, Coba Lagi");
    }
  }

  void getFileList() async {
    listFile.clear();
    for (int i = 0; i < images.length; i++) {
      var path = await images[i].identifier;
      //print(path);
      var file = await getImageFileFromAsset(path);
      //print(file);
      listFile.add(file);
    }
    setState(() {});
  }

  Future<File> getImageFileFromAsset(String path) async {
    final file = File(path);
    return file;
  }
}

class StateServiceOwner {
  static Future<List<dynamic>> getSuggestions(String query) async {
    Map<String, String> headerss = {};
    SharedPreferences preferences = await SharedPreferences.getInstance();

    headerss['cookie'] = preferences.getString("cookie");
    print(headerss);
    final response = await http.get(
        "https://genius.remax.co.id/api/customer/crud?pageSize=505",
        headers: headerss);
    List list = json.decode(response.body)['data'];

    list.retainWhere(
        (s) => s['custName'].toLowerCase().contains(query.toLowerCase()));
    return list;
  }
}

class StateServiceAgentName {
  static Future<List<dynamic>> getSuggestions(String query) async {
    Map<String, String> headerss = {};
    SharedPreferences preferences = await SharedPreferences.getInstance();

    headerss['cookie'] = preferences.getString("cookie");
    print(headerss);
    final response = await http.get(
        "https://genius.remax.co.id/api/membership/crud",
        headers: headerss);
    List list = json.decode(response.body)['data'];

    list.retainWhere((s) {
      if (s['mmbsNick'] == null) {
        s['mmbsNick'] = "null";
      }
      return s['mmbsNick'].toLowerCase().contains(query.toLowerCase());
    });
    return list;
  }
}

class StateServiceCountry {
  static Future<List<dynamic>> getSuggestions(String query) async {
    Map<String, String> headerss = {};
    SharedPreferences preferences = await SharedPreferences.getInstance();

    headerss['cookie'] = preferences.getString("cookie");
    print(headerss);
    final response = await http
        .get("https://genius.remax.co.id/api/country/crud/", headers: headerss);
    List list = json.decode(response.body)['data'];
    print(query);

    list.retainWhere((s) {
      if (s['mctrDescription'] == null) {
        s['mctrDescription'] = "null";
      }
      return s['mctrDescription'].toLowerCase().contains(query.toLowerCase());
    });
    return list;
  }
}

class StateServiceListingType {
  static Future<List<dynamic>> getSuggestions(String query) async {
    Map<String, String> headerss = {};
    SharedPreferences preferences = await SharedPreferences.getInstance();

    headerss['cookie'] = preferences.getString("cookie");
    print(headerss);
    final response = await http.get(
        "https://genius.remax.co.id/api/listingstatus/crud",
        headers: headerss);
    List list = json.decode(response.body)['data'];

    list.retainWhere(
        (s) => s['lstlName'].toLowerCase().contains(query.toLowerCase()));
    return list;
  }
}

class StateServiceListingCategory {
  static Future<List<dynamic>> getSuggestions(String query) async {
    Map<String, String> headerss = {};
    SharedPreferences preferences = await SharedPreferences.getInstance();

    headerss['cookie'] = preferences.getString("cookie");

    final response = await http.get(
        "https://genius.remax.co.id/api/listingcategory/crud",
        headers: headerss);
    List list = json.decode(response.body)['data'];

    list.retainWhere(
        (s) => s['lsclName'].toLowerCase().contains(query.toLowerCase()));
    return list;
  }
}

class StateServicePropertyType {
  static Future<List<dynamic>> getSuggestions(String query) async {
    Map<String, String> headerss = {};
    SharedPreferences preferences = await SharedPreferences.getInstance();

    headerss['cookie'] = preferences.getString("cookie");
    print(headerss);
    final response = await http.get(
        "https://genius.remax.co.id/api/propertytype/crud",
        headers: headerss);
    List list = json.decode(response.body)['data'];

    list.retainWhere(
        (s) => s['prtlName'].toLowerCase().contains(query.toLowerCase()));
    return list;
  }
}

class StateServiceCertificateType {
  static Future<List<dynamic>> getSuggestions(String query) async {
    Map<String, String> headerss = {};
    SharedPreferences preferences = await SharedPreferences.getInstance();

    headerss['cookie'] = preferences.getString("cookie");
    print(headerss);
    final response = await http.get(
        "https://genius.remax.co.id/api/legalterm/crud",
        headers: headerss);
    List list = json.decode(response.body)['data'];

    list.retainWhere(
        (s) => s['ltlgName'].toLowerCase().contains(query.toLowerCase()));
    return list;
  }
}

class StateServiceCurrencies {
  static Future<List<dynamic>> getSuggestions(String query) async {
    Map<String, String> headerss = {};
    SharedPreferences preferences = await SharedPreferences.getInstance();

    headerss['cookie'] = preferences.getString("cookie");
    print(headerss);
    final response = await http
        .get("https://genius.remax.co.id/api/currency/crud", headers: headerss);
    List list = json.decode(response.body)['data'];

    list.retainWhere(
        (s) => s['mculName'].toLowerCase().contains(query.toLowerCase()));
    return list;
  }
}
