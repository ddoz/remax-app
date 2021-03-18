import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:remax_app/util/constants.dart';

class ContentAddInfoListing extends StatefulWidget {
  final ScrollController scrollController;

  ContentAddInfoListing({this.scrollController});

  @override
  _ContentAddInfoState createState() => _ContentAddInfoState();
}

enum AddListingStatus { addInfo, inputDetail }

class _ContentAddInfoState extends State<ContentAddInfoListing> {
  AddListingStatus _addStatus = AddListingStatus.addInfo;

  bool checkedValueLamudi = false;
  bool checkedValueRumah123 = false;

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
  TextEditingController controllerCurrencies = new TextEditingController();
  TextEditingController controllerCommisionPercent = new TextEditingController();
  TextEditingController controllerCommisionRupiah = new TextEditingController();


  Future<void> _selectPublishDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedPublishDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedPublishDate)
      setState(() {
        selectedPublishDate = picked;
        controllerPublishDate.text = convertTanggal(selectedPublishDate);
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
        controllerExpiryDate.text = convertTanggal(selectedExpiryDate);
      });
  }

  String convertTanggal(DateTime dtm) {
    String tanggal = dtm.toString();
    String tgl = tanggal.substring(8, 10);
    String bln = tanggal.substring(5, 7);
    String thn = tanggal.substring(0, 4);
    if (bln == "01") {
      bln = "Jan";
    }
    if (bln == "02") {
      bln = "Feb";
    }
    if (bln == "03") {
      bln = "Mar";
    }
    if (bln == "04") {
      bln = "Apr";
    }
    if (bln == "05") {
      bln = "Mei";
    }
    if (bln == "06") {
      bln = "Jun";
    }
    if (bln == "07") {
      bln = "Jul";
    }
    if (bln == "08") {
      bln = "Agu";
    }
    if (bln == "09") {
      bln = "Sep";
    }
    if (bln == "10") {
      bln = "Okt";
    }
    if (bln == "11") {
      bln = "Nov";
    }
    if (bln == "12") {
      bln = "Des";
    }
    return tgl + " " + bln + " " + thn;
  }

  String _valCountry;
  List _listCountry = ["Indonesia", "Autralia", "Malaysia"];
  String _valProvince;
  List _listProvince = ["Jakarta", "Surabaya", "Medan"];

  String _valBedRooms;
  List _listBedRooms = ["1", "2", "3"];

  String _valHelpersBedRoooms;
  List _listHelpersBedroom = ["1", "2", "3"];

  String _valBathRoom;
  List _listBathRoom = ["1", "2", "3"];

  String _valHelperBathroom;
  List _listHelperBathroom = ["1", "2", "3"];

  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';

  Widget buildGridView() {
//    return GridView.count(
//      crossAxisCount: 3,
//      children: List.generate(images.length, (index) {
//        Asset asset = images[index];
//        return AssetThumb(
//          asset: asset,
//          width: 300,
//          height: 300,
//        );
//      }),
//    );
  return ListView.builder(
    shrinkWrap: true,
    itemCount: images.length,
    itemBuilder: (context, i) {
//      return Container(
//        child: Column(
//          children: <Widget>[
//            Text(images[i].name, style: TextStyle(
//              fontWeight: FontWeight.bold
//            ),),
//            Text(images[i].toString(), style: TextStyle(
//            ),),
//          ],
//        ),
//      );

      return ListTile(
          title: Text(images[i].name));
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
          actionBarTitle: "Example App",
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              onChanged: (value) {},
                              controller: controllerAgentName,
                              decoration: InputDecoration(
                                hintText: "Agent Name",
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
                            "assets/icons/person.svg",
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              onChanged: (value) {},
                              controller: controllerOwnerName,
                              decoration: InputDecoration(
                                hintText: "Owner Name",
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
                            "assets/icons/person.svg",
                            color: kIconColor,
                          ),
                        ],
                      ),
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
                          "Country",
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                        value: _valCountry,
                        items: _listCountry.map((value) {
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
                            _valCountry = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
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
                          "Province",
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                        value: _valProvince,
                        items: _listProvince.map((value) {
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
                            _valProvince = value;
                          });
                        },
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
                                  controller: controllerCity,
                                  decoration: InputDecoration(
                                      hintText: "City",
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
                                "assets/icons/city.svg",
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
                      height: 85,
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              onChanged: (value) {},
                              controller: controllerListingType,
                              decoration: InputDecoration(
                                hintText: "Listing Type",
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
                            "assets/icons/listing_type.svg",
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
                              controller: controllerListingCategory,
                              decoration: InputDecoration(
                                hintText: "Listing Category",
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
                            "assets/icons/listing_category.svg",
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
                              controller: controllerPropertyType,
                              decoration: InputDecoration(
                                hintText: "Property Type",
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
                            "assets/icons/property_type.svg",
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
                              controller: controllerCertificateType,
                              decoration: InputDecoration(
                                hintText: "Certificate Type",
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
                            "assets/icons/certificate.svg",
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
                              controller: controllerLandSize,
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              onChanged: (value) {},
                              controller: controllerCurrencies,
                              decoration: InputDecoration(
                                hintText: "Currencies",
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
                            "assets/icons/currencies.svg",
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
                              controller: controllerCommisionPercent,
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
                              onChanged: (value) {},
                              controller: controllerCommisionRupiah,
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
                                SvgPicture.asset(
                                  "assets/icons/upload.svg"
                                ),
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
                            curve: Curves.ease
                        );
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
//                        setState(() {
//                          _addStatus = AddListingStatus.addInfo;
//                        });
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
}
