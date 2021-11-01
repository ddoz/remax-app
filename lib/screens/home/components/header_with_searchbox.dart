import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:remax_app/screens/filter/filter_result.dart';
import 'package:remax_app/util/constants.dart';
import 'package:remax_app/util/typeahead_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;
  final String dropdownValue = 'Indonesia';

  savePrefBahasa(String bahasa) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
//    setState(() {
//      preferences.setString("bahasa", bahasa);
//      preferences.commit();
//    });
    preferences.setString("bahasa", bahasa);
    preferences.commit();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      // It will cover 20% of our total height
      height: size.height * 0.3,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
            ),
            height: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: new AssetImage(
                "assets/icons/bg_header.png",
              ),
              fit: BoxFit.cover,
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Image.asset("assets/icons/menu_bar.png"),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
                Container(
                  // width: 151,
                  // height: 56,
                  // decoration: BoxDecoration(color: Colors.black),
                  child: Image.asset("assets/logo/logo_remax.png"),
                ),
                DropdownButton<String>(
                  //value: dropdownValue,
                  // isDense: true,
                  icon: Image.asset("assets/icons/language_choose.png"),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.transparent,
                  ),
                  onChanged: (newValue) {
//                      setState(() {
//                        dropdownValue = newValue!;
//                      });
                    if (newValue == "ID") {
                      savePrefBahasa("id_ID");
                    } else {
                      savePrefBahasa("en");
                    }
                  },
                  items: <String>['ID', 'EN']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.only(left: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/icons/location.svg",
                    color: kIconColor,
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: TextField(
                      textInputAction: TextInputAction.go,
                      onSubmitted: (value) {
                        String requestUrl =
                            "https://genius.remax.co.id/papi/listing?language=id_ID&filter[search]=" +
                                value;
                        print(requestUrl);
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new FilterResult(
                                  url: requestUrl,
                                )));
                      },
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Search Location..",
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
                      await showDialog(
                        builder: (_) => ImageDialogFilter(),
                        context: context,
                      );
                    },
                    child: Container(
                      width: 50.0,
                      padding: EdgeInsets.zero,
                      decoration: new BoxDecoration(
                          color: kBgFilters,
                          borderRadius: new BorderRadius.only(
                            bottomRight: const Radius.circular(50.0),
                            topRight: const Radius.circular(50.0),
                          )),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              "assets/icons/filters.svg",
                              height: 12.0,
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageDialogFilter extends StatefulWidget {
  @override
  _ImageDialogFilterState createState() => _ImageDialogFilterState();
}

class _ImageDialogFilterState extends State<ImageDialogFilter> {
  RangeValues valuesPrice = RangeValues(0, 10000000000);
  RangeValues valuesLandSize = RangeValues(0, 10000);
  RangeValues valuesBuilding = RangeValues(0, 10000);
  bool checkedValuePrice = false;
  bool checkedValueLandSize = false;
  bool checkedValueBuildingSize = false;

  double startPrice = 0.0;
  double endPrice = 10000000000.0;

  double startLandSize = 0.0;
  double endLandSize = 10000.0;

  double startBuildingSize = 0.0;
  double endBuldingSize = 10000.0;

  TextEditingController controllerSearch = new TextEditingController();
  TextEditingController controllerListingTittle = new TextEditingController();
  TextEditingController controllerCity = new TextEditingController();
  TextEditingController controllerListingType = new TextEditingController();
  TextEditingController controllerPropertyType = new TextEditingController();
  TextEditingController controllerFacilities = new TextEditingController();
  TextEditingController controllerRentFreq = new TextEditingController();
  TextEditingController controllerListingStatus = new TextEditingController();

  //Links
  String listingTypeId, propertyType, facilities, rentFreq, listingStatus;

  final formatter = new NumberFormat("#,###");

  int toInt(String str) {
    var myInt = int.parse(str);
    assert(myInt is int);
    return myInt;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          color: kBgCardItemListing,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15.0, top: 45.0),
                      child: Text(
                        'Filter',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: kAppBarColorTheme),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.only(left: kDefaultPadding, right: 5.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/icons/search.svg",
                            color: kIconColor,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: TextField(
                                controller: controllerSearch,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  hintText: "Search...",
                                  hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: kPrimaryColor.withOpacity(0.5),
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              hintText: "For Sale/Rent",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            controller: this.controllerListingType,
                          ),
                          suggestionsCallback: (pattern) async {
                            return await StateServiceCategory.getSuggestions(
                                pattern);
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
                            this.controllerListingType.text =
                                suggestion['lsclName'];
                            setState(() {
                              listingTypeId = suggestion['id'];
                            });
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.only(left: kDefaultPadding, right: 5.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: TextField(
                                controller: controllerListingTittle,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  hintText: "Listing Title",
                                  hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: kPrimaryColor.withOpacity(0.5),
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.only(left: kDefaultPadding, right: 5.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: TextField(
                                controller: controllerCity,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  hintText: "City",
                                  hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: kPrimaryColor.withOpacity(0.5),
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                              propertyType = suggestion['id'];
                            });
                          }),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              hintText: "Facilities",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            controller: this.controllerFacilities,
                          ),
                          suggestionsCallback: (pattern) async {
                            return await StateServiceFacilites.getSuggestions(
                                pattern);
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion['fctlName']),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            this.controllerFacilities.text =
                                suggestion['fctlName'];
                            setState(() {
                              facilities = suggestion['id'];
                            });
                          }),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              hintText: "Rent Frequency",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            controller: this.controllerRentFreq,
                          ),
                          suggestionsCallback: (pattern) async {
                            return await StateServiceRentFreq.getSuggestions(
                                pattern);
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion['rfqlName']),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            this.controllerRentFreq.text =
                                suggestion['rfqlName'];
                            setState(() {
                              rentFreq = suggestion['id'];
                            });
                          }),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              hintText: "Listing Status",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            controller: this.controllerListingStatus,
                          ),
                          suggestionsCallback: (pattern) async {
                            return await StateServiceListingStatus
                                .getSuggestions(pattern);
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
                            this.controllerListingStatus.text =
                                suggestion['lstlName'];
                            setState(() {
                              listingStatus = suggestion['id'];
                            });
                          }),
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Price",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      value: checkedValuePrice,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValuePrice = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Min',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            'Max',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    RangeSlider(
                        activeColor: Colors.red[700],
                        inactiveColor: Colors.grey[400],
                        min: 0,
                        max: 10000000000,
                        values: valuesPrice,
                        onChanged: (values) {
                          setState(() {
                            this.valuesPrice = values;
                            startPrice = values.start;
                            endPrice = values.end;
                          });
                        }),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            NumberFormat.compactCurrency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(toInt(startPrice.toStringAsFixed(0))),
                            style: TextStyle(color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            NumberFormat.compactCurrency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(toInt(endPrice.toStringAsFixed(0))),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Land Size M" + '\u00B2',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      value: checkedValueLandSize,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValueLandSize = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Min',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            'Max',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    RangeSlider(
                        activeColor: Colors.red[700],
                        inactiveColor: Colors.grey[400],
                        min: 0,
                        max: 10000,
                        values: valuesLandSize,
                        onChanged: (values) {
                          setState(() {
                            this.valuesLandSize = values;
                            startLandSize = values.start;
                            endLandSize = values.end;
                          });
                        }),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            startLandSize.toStringAsFixed(0),
                            style: TextStyle(color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            endLandSize.toStringAsFixed(0),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Building Size M" + '\u00B2',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      value: checkedValueBuildingSize,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValueBuildingSize = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Min',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            'Max',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    RangeSlider(
                        activeColor: Colors.red[700],
                        inactiveColor: Colors.grey[400],
                        min: 0,
                        max: 10000,
                        values: valuesBuilding,
                        onChanged: (values) {
                          setState(() {
                            this.valuesBuilding = values;
                            startBuildingSize = values.start;
                            endBuldingSize = values.end;
                          });
                        }),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            startBuildingSize.toStringAsFixed(0),
                            style: TextStyle(color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            endBuldingSize.toStringAsFixed(0),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
//                        var queryParameters = {
//                          'param1': 'one',
//                          'param2': 'two',
//                        };

                        Map<String, String> queryParams = {
                          'language': 'id_ID'
//                          'filter[listListingPrice][<]': endPrice.toStringAsFixed(0),
//                          'filter[listListingPrice][>]': startPrice.toStringAsFixed(0),
//                          'filter[listLandSize][<]': endBuldingSize.toStringAsFixed(0),
//                          'filter[listLandSize][>]': startBuildingSize.toStringAsFixed(0),
//                          'filter[listBuildingSize][<]': startPrice.toStringAsFixed(0),
//                          'filter[listBuildingSize][>]': startPrice.toStringAsFixed(0),
//                          //'filter[search]': controllerSearch.text,
//                         //'filter[listTitle]': controllerListingTittle.text,
//                          //'filter[mctyDescription]': controllerCity.text,
//                          'filter[listPropertyTypeId][in]': propertyType,
//                          'filter[listFacility][in]': facilities,
//                          'filter[listListingCategoryId][in]': listingTypeId,
//                          'filter[listRentFreqId][in]': rentFreq,
//                          'filter[listListingStatusId][in]': listingStatus,
                        };

                        if (checkedValuePrice == true) {
                          queryParams['filter[listListingPrice][<]'] =
                              endPrice.toStringAsFixed(0);
                          queryParams['filter[listListingPrice][>]'] =
                              startPrice.toStringAsFixed(0);
                        }
                        if (checkedValueBuildingSize == true) {
                          queryParams['filter[listBuildingSize][<]'] =
                              endBuldingSize.toStringAsFixed(0);
                          queryParams['filter[listBuildingSize][>]'] =
                              startBuildingSize.toStringAsFixed(0);
                        }
                        if (checkedValueLandSize == true) {
                          queryParams['filter[listLandSize][<]'] =
                              endLandSize.toStringAsFixed(0);
                          queryParams['filter[listLandSize][>]'] =
                              endLandSize.toStringAsFixed(0);
                        }
                        if (controllerSearch.text != "") {
                          queryParams['filter[search]'] = controllerSearch.text;
                        }
//                        if(controllerListingTittle.text!=""){
//                          queryParams['filter[listTitle]'] = controllerListingTittle.text;
//                        }
//                        if(controllerCity.text!=""){
//                          queryParams['filter[mctyDescription]'] = controllerCity.text;
//                        }

                        if (facilities != null) {
                          queryParams['filter[listFacility][in]'] = facilities;
                        }
                        if (propertyType != null) {
                          queryParams['filter[listPropertyTypeId][in]'] =
                              propertyType;
                        }
                        if (listingTypeId != null) {
                          queryParams['filter[listListingCategoryId][in]'] =
                              listingTypeId;
                        }
                        if (rentFreq != null) {
                          queryParams['filter[listRentFreqId][in]'] = rentFreq;
                        }
                        if (listingStatus != null) {
                          queryParams['filter[listListingStatusId][in]'] =
                              listingStatus;
                        }

                        String queryString =
                            Uri(queryParameters: queryParams).query;
                        String requestUrl =
                            'https://genius.remax.co.id/papi/listing' +
                                '?' +
                                queryString;

                        print(requestUrl);
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new FilterResult(
                                  url: requestUrl,
                                )));

//                        var uri =
//                        Uri.https('https://genius.remax.co.id/papi/listing', queryString);
//                        print(uri);
                      },
                      child: new Container(
                        height: 50.0,
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
                                Text(
                                  'Find',
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
                    SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: RawMaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.close,
                        size: 20.0,
                      ),
                      shape: CircleBorder(),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
