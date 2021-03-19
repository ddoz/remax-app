import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:remax_app/util/constants.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

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
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Image.asset("assets/icons/menu_bar.png"),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                  Container(
                    width: 151,
                    height: 56,
                    child: Image.asset("assets/logo/logo_remax.png"),
                  ),
                  IconButton(
                    icon: Image.asset("assets/icons/language_choose.png"),
                    onPressed: () {},
                  ),
                ],
              ),
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
                  SvgPicture.asset("assets/icons/location.svg", color: kIconColor,),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: TextField(
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
                    onTap: () async{
                      await showDialog(
                          builder: (_) => ImageDialog(),
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

class ImageDialog extends StatefulWidget {
  @override
  _ImageDialogState createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {

  String _valSaleRent;
  String _valSortBy;

  List _listSaleRent = ["For Sale", "For Rent"];
  List _listSortBy = [
    "Highest Price",
    "Lowest Price",
    "Newest Listing",
    "Oldest Listing",
    "Largest Building Size",
    "Smallest Building Size"
  ];

  RangeValues valuesPrice = RangeValues(1, 100);
  RangeValues valuesLandSize = RangeValues(1, 100);
  RangeValues valuesBuilding = RangeValues(1, 100);
  bool checkedValuePrice = false;
  bool checkedValueLandSize = false;
  bool checkedValueBuildingSize = false;

  double startPrice = 0.0;
  double endPrice = 0.0;

  double startLandSize = 0.0;
  double endLandSize = 0.0;

  double startBuildingSize = 0.0;
  double endBuldingSize = 0.0;


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
                      margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: kDefaultPadding, right: 5.0),
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
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: DropdownButton(
                        underline: SizedBox(),
                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                        isExpanded: true,
                        hint: Text(
                          "For Sale/Rent",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                        value: _valSaleRent,
                        items: _listSaleRent.map((value) {
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
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: kDefaultPadding, right: 5.0),
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
                      margin: EdgeInsets.only(left: 10.0, right: 10.0, top:10.0),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: kDefaultPadding, right: 5.0),
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
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: DropdownButton(
                        underline: SizedBox(),
                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                        isExpanded: true,
                        hint: Text(
                          "Property Type",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                        value: _valSaleRent,
                        items: _listSaleRent.map((value) {
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
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: DropdownButton(
                        underline: SizedBox(),
                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                        isExpanded: true,
                        hint: Text(
                          "Facilities",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                        value: _valSaleRent,
                        items: _listSaleRent.map((value) {
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
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: DropdownButton(
                        underline: SizedBox(),
                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                        isExpanded: true,
                        hint: Text(
                          "Rent Frequency",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                        value: _valSaleRent,
                        items: _listSaleRent.map((value) {
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
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: DropdownButton(
                        underline: SizedBox(),
                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                        isExpanded: true,
                        hint: Text(
                          "Listing Status",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                        value: _valSaleRent,
                        items: _listSaleRent.map((value) {
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
                      ),
                    ),

                    CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Price", style: TextStyle(
                          color: kPrimaryColor
                      ),),
                      value: checkedValuePrice,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValuePrice = newValue;
                        });
                      },
                      controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text('Min', style: TextStyle(
                              color: Colors.grey
                          ),),
                          Spacer(),
                          Text('Max', style: TextStyle(
                              color: Colors.grey
                          ),)
                        ],
                      ),
                    ),
                    RangeSlider(
                        activeColor: Colors.red[700],
                        inactiveColor: Colors.grey[400],
                        min: 1,
                        max: 100,
                        values: valuesPrice,
                        onChanged: (values){
                          setState(() {
                            this.valuesPrice = values;
                            startPrice = values.start;
                            endPrice = values.end;
                          });
                        }
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(startPrice.toString(), style: TextStyle(
                              color: Colors.grey
                          ),),
                          Spacer(),
                          Text(endPrice.toString(), style: TextStyle(
                              color: Colors.grey
                          ),)
                        ],
                      ),
                    ),

                    CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Land Size", style: TextStyle(
                          color: kPrimaryColor
                      ),),
                      value: checkedValueLandSize,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValueLandSize = newValue;
                        });
                      },
                      controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text('Min', style: TextStyle(
                              color: Colors.grey
                          ),),
                          Spacer(),
                          Text('Max', style: TextStyle(
                              color: Colors.grey
                          ),)
                        ],
                      ),
                    ),
                    RangeSlider(
                        activeColor: Colors.red[700],
                        inactiveColor: Colors.grey[400],
                        min: 1,
                        max: 100,
                        values: valuesLandSize,
                        onChanged: (values){
                          setState(() {
                            this.valuesLandSize = values;
                            startLandSize = values.start;
                            endLandSize = values.end;
                          });
                        }
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(startLandSize.toString(), style: TextStyle(
                              color: Colors.grey
                          ),),
                          Spacer(),
                          Text(endLandSize.toString(), style: TextStyle(
                              color: Colors.grey
                          ),)
                        ],
                      ),
                    ),

                    CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Building Size", style: TextStyle(
                          color: kPrimaryColor
                      ),),
                      value: checkedValueBuildingSize,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValueBuildingSize = newValue;
                        });
                      },
                      controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text('Min', style: TextStyle(
                              color: Colors.grey
                          ),),
                          Spacer(),
                          Text('Max', style: TextStyle(
                              color: Colors.grey
                          ),)
                        ],
                      ),
                    ),
                    RangeSlider(
                        activeColor: Colors.red[700],
                        inactiveColor: Colors.grey[400],
                        min: 1,
                        max: 100,
                        values: valuesBuilding,
                        onChanged: (values){
                          setState(() {
                            this.valuesBuilding = values;
                            startBuildingSize = values.start;
                            endBuldingSize = values.end;
                          });
                        }
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(startBuildingSize.toString(), style: TextStyle(
                              color: Colors.grey
                          ),),
                          Spacer(),
                          Text(endBuldingSize.toString(), style: TextStyle(
                              color: Colors.grey
                          ),)
                        ],
                      ),
                    ),

                    SizedBox(height: 50.0,)

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
