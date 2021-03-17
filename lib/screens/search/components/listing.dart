import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:remax_app/screens/home/components/near_listing.dart';
import 'package:remax_app/util/constants.dart';

import '../..//detail/detail_page.dart';

class Listing extends StatefulWidget {
  @override
  _ListingState createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  ScrollController _scrollController = ScrollController();
  int page = 1;

  bool isLoading = false;
  bool firstLoad = true;

//  Future<List> getData() async {
//    final response = await http.get("https://genius.remax.co.id/papi/listing?sort=-listId&pageSize=20&filter[listType]=3&pageNumber=1");
//
//    List list = json.decode(response.body)['data'];
//    return list;
//  }

  List list = new List();

  @override
  void initState() {
    super.initState();
    getProp();
    print(getProp());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          isLoading = true;
        });
        page++;
        getNext(page);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  getProp() async {
    final response = await http.get(
        "https://genius.remax.co.id/papi/listing?sort=-listId&pageSize=20&filter[listType]=3");
    if (response.statusCode == 200) {
      List liss = json.decode(response.body)['data'];
      for (int i = 0; i < liss.length; i++) {
        setState(() {
          firstLoad = false;
          list.add(liss[i]);
        });
      }
    } else {
      Exception('Failed to load data');
    }
  }

  getNext(int page) async {
    String url =
        "https://genius.remax.co.id/papi/listing?sort=-listId&pageSize=20&filter[listType]=3&pageNumber=$page";
    print(url);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List liss = json.decode(response.body)['data'];
      for (int i = 0; i < liss.length; i++) {
        setState(() {
          list.add(liss[i]);
          isLoading = false;
        });
      }
    } else {
      Exception('Failed to load data');
    }
  }

//  Future<List> getDataNext(int page) async {
//    final response = await http.get("https://genius.remax.co.id/papi/listing?sort=-listId&pageSize=20&filter[listType]=3&pageNumber=$page");
//
//    List list = json.decode(response.body)['data'];
//    return list;
//  }

  int toInt(String str) {
    var myInt = int.parse(str);
    assert(myInt is int);
    return myInt;
  }

//  Future<void> onScroll() async {
//    double maxScroll = controller.position.maxScrollExtent;
//    double currentScroll = controller.position.pixels;
//
//    if (currentScroll == maxScroll){
//      page++;
//      List list = await getData();
//      list.add(getDataNext(page));
//    }
//
//    print("page : "+page.toString());
//  }

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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGreyBgSearch,
//      child: SingleChildScrollView(
      child: Column(children: <Widget>[
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
                "assets/icons/location.svg",
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
                      hintText: "Search Your Properties..",
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
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    side: BorderSide(color: kBgFilters)),
                onPressed: () async {
                  await showDialog(
                    builder: (_) => ImageDialog(),
                    context: context,
                  );
                },
                color: kBgFilters,
                child: SvgPicture.asset(
                  "assets/icons/filters.svg",
                  height: 10.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
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
                    "Sale/Rent",
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
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
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
                    "Sort By",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kPrimaryColor.withOpacity(0.5),
                    ),
                  ),
                  value: _valSortBy,
                  items: _listSortBy.map((value) {
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
//                  onChanged: (value) {
//                    setState(() {
//                      _valTypeOfWork = value;
//                    });
//                  },
                ),
              ),
            ],
          ),
        ),
        firstLoad == false
            ? new Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: new ItemList(
                        list: list,
                        controller: _scrollController,
                      ),
                    ),
                    isLoading == true
                        ? new Center(
                            child: new CircularProgressIndicator(),
                          )
                        : new SizedBox(),
                  ],
                ),
              )
            : Expanded(child: new LoadingSearchListing())
      ]),
//      ),
    );
  }
}

//class Listing extends StatelessWidget {
//
//
//
//}

class LoadingSearchListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          LoadingShimmerEffect(),
//          SizedBox(
//            height: 10.0,
//          ),
//          LoadingShimmerEffect(),
//          SizedBox(
//            height: 10.0,
//          ),
//          LoadingShimmerEffect(),
        ],
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List list;
  ScrollController controller;

  ItemList({this.list, this.controller});

  int toInt(String str) {
    var myInt = int.parse(str);
    assert(myInt is int);
    return myInt;
  }

  List listMedia = new List();

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      shrinkWrap: true,
      controller: controller,
//      physics: NeverScrollableScrollPhysics(),
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, int i) {
        listMedia = list[i]['links']['listFile'];
        return new Container(
          padding: const EdgeInsets.only(
              top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new DetailPage(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      width: 120,
                      height: 153,
//                    padding: EdgeInsets.all(80),
                      decoration: BoxDecoration(
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(10.0)),
                        image: DecorationImage(
                            image: list[i]['listThumbnail'] != null
                                ? NetworkImage(
                                    'https://genius.remax.co.id/papi/' +
                                        list[i]['listThumbnail'])
                                : NetworkImage('-'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: new BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                      ),
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/icons/camera.svg",
                            height: 12.0,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            listMedia.length.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              list[i]['listTitle'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: new TextStyle(
                                fontSize: 13.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        list[i]['links']['listListingCategoryId'] == "1"
                            ? Row(children: <Widget>[
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Text(
                                      NumberFormat.compactCurrency(
                                              locale: 'id',
                                              symbol: 'Rp ',
                                              decimalDigits: 0)
                                          .format(toInt(
                                              list[i]['listListingPrice'])),
                                      style: new TextStyle(
                                        fontSize: 21.0,
                                        color: const Color(0xffDC1B2E),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                new Text(
                                  "(DIJUAL)",
                                  style: new TextStyle(
                                      fontSize: 12.0,
                                      color: const Color(0xffDC1B2E)),
                                )
                              ])
                            : Row(children: <Widget>[
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Text(
                                      NumberFormat.compactCurrency(
                                              locale: 'id',
                                              symbol: 'Rp ',
                                              decimalDigits: 0)
                                          .format(toInt(
                                              list[i]['listListingPrice'])),
                                      style: new TextStyle(
                                        fontSize: 21.0,
                                        color: const Color(0xff1A3668),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                new Text(
                                  "(DISEWAKAN)",
                                  style: new TextStyle(
                                      fontSize: 12.0,
                                      color: const Color(0xff1A3668)),
                                )
                              ]),
                        Row(
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.only(left: 10.0, top: 5.0),
                              child: new Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/icons/sofa.svg",
                                        height: 10.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      list[i]['listBedroom'] != null
                                          ? new Text(
                                              list[i]['listBedroom'],
                                              style: new TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            )
                                          : new Text('-',
                                              style: new TextStyle(
                                                fontSize: 10.0,
                                              ))
                                    ],
                                  )),
                            ),
                            new Container(
                              margin: EdgeInsets.only(left: 5.0, top: 5.0),
                              child: new Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/icons/bathub.svg",
                                        height: 10.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      list[i]['listBathroom'] != null
                                          ? new Text(
                                              list[i]['listBathroom'],
                                              style: new TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            )
                                          : new Text('-',
                                              style: new TextStyle(
                                                fontSize: 10.0,
                                              ))
                                    ],
                                  )),
                            ),
                            new Container(
                              margin: EdgeInsets.only(left: 5.0, top: 5.0),
                              child: new Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/icons/home.svg",
                                        height: 10.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      list[i]['listBuildingSize'] != null
                                          ? new Text(
                                              list[i]['listBuildingSize'] +
                                                  '(m2)',
                                              style: new TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            )
                                          : new Text('-',
                                              style: new TextStyle(
                                                fontSize: 10.0,
                                              ))
                                    ],
                                  )),
                            ),
                            new Container(
                              margin: EdgeInsets.only(left: 5.0, top: 5.0),
                              child: new Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/icons/size.svg",
                                        height: 10.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      list[i]['listLandSize'] != null
                                          ? new Text(
                                              list[i]['listLandSize'] + '(m2)',
                                              style: new TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            )
                                          : new Text('-',
                                              style: new TextStyle(
                                                fontSize: 10.0,
                                              ))
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.only(
                                  left: 10.0, top: 5.0, bottom: 10.0),
                              child: new Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/icons/share.svg",
                                      ),
                                    ],
                                  )),
                            ),
                            Spacer(),
//                            new Container(
//                              margin: EdgeInsets.only(
//                                  left: 10.0, top: 5.0, bottom: 5.0),
//                              child: new Align(
//                                  alignment: Alignment.centerLeft,
//                                  child: Row(
//                                    children: <Widget>[
//                                      SvgPicture.asset(
//                                        "assets/icons/love_white.svg",
//                                      ),
//                                    ],
//                                  )),
//                            ),
//                            RawMaterialButton(
//                              onPressed: () {
//                               // Navigator.of(context).pop();
//                              },
//                              padding: EdgeInsets.zero,
//                              elevation: 2.0,
//                              fillColor: Colors.white,
//                              child: Icon(
//                                Icons.favorite_border,
//                                size: 20.0,
//                              ),
//                              shape: CircleBorder(),
//                            ),
                            Card(
                              margin: EdgeInsets.only(right: 10.0),
//                              onPressed: () {
//                                // Navigator.of(context).pop();
//                              },
//                              padding: EdgeInsets.zero,
                              elevation: 2.0,
                              //fillColor: Colors.white,
                              child: Container(
                                margin: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 15.0,
                                ),
                              ),
                              shape: CircleBorder(),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

//class ImageDialog extends StatelessWidget {
//
//  String _valSaleRent;
//  String _valSortBy;
//
//  List _listSaleRent = ["For Sale", "For Rent"];
//  List _listSortBy = [
//    "Highest Price",
//    "Lowest Price",
//    "Newest Listing",
//    "Oldest Listing",
//    "Largest Building Size",
//    "Smallest Building Size"
//  ];
//
//  RangeValues values = RangeValues(1, 100);
//
//  @override
//  Widget build(BuildContext context) {
//    return Material(
//      child: SingleChildScrollView(
//        child: Container(
//          color: kBgCardItemListing,
//          height: MediaQuery.of(context).size.height,
//          width: MediaQuery.of(context).size.width,
//          child: Stack(
//            children: <Widget>[
//              SingleChildScrollView(
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Container(
//                      margin: EdgeInsets.only(left: 15.0, top: 45.0),
//                      child: Text(
//                        'Filter',
//                        style: TextStyle(
//                            fontSize: 20.0,
//                            fontWeight: FontWeight.bold,
//                            color: kAppBarColorTheme),
//                      ),
//                    ),
//                    Container(
//                      margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
//                      alignment: Alignment.center,
//                      padding: EdgeInsets.only(left: kDefaultPadding, right: 5.0),
//                      height: 45,
//                      decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.circular(7),
//                      ),
//                      child: Row(
//                        children: <Widget>[
//                          SvgPicture.asset(
//                            "assets/icons/search.svg",
//                            color: kIconColor,
//                          ),
//                          SizedBox(
//                            width: 5.0,
//                          ),
//                          Expanded(
//                            child: Align(
//                              alignment: Alignment.center,
//                              child: TextField(
//                                onChanged: (value) {},
//                                decoration: InputDecoration(
//                                  hintText: "Search...",
//                                  hintStyle: TextStyle(
//                                    fontSize: 14.0,
//                                    color: kPrimaryColor.withOpacity(0.5),
//                                  ),
//                                  enabledBorder: InputBorder.none,
//                                  focusedBorder: InputBorder.none,
//                                ),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                    Container(
//                      alignment: Alignment.center,
//                      margin: EdgeInsets.all(10.0),
//                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                      height: 45,
//                      decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.circular(7),
//                      ),
//                      child: DropdownButton(
//                        underline: SizedBox(),
//                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
//                        isExpanded: true,
//                        hint: Text(
//                          "For Sale/Rent",
//                          style: TextStyle(
//                            fontSize: 14.0,
//                            color: kPrimaryColor.withOpacity(0.5),
//                          ),
//                        ),
//                        value: _valSaleRent,
//                        items: _listSaleRent.map((value) {
//                          return DropdownMenuItem(
//                            child: Text(
//                              value,
//                              style: TextStyle(
//                                fontSize: 14.0,
//                              ),
//                            ),
//                            value: value,
//                          );
//                        }).toList(),
//                      ),
//                    ),
//                    Container(
//                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
//                      alignment: Alignment.center,
//                      padding: EdgeInsets.only(left: kDefaultPadding, right: 5.0),
//                      height: 45,
//                      decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.circular(7),
//                      ),
//                      child: Row(
//                        children: <Widget>[
//                          Expanded(
//                            child: Align(
//                              alignment: Alignment.center,
//                              child: TextField(
//                                onChanged: (value) {},
//                                decoration: InputDecoration(
//                                  hintText: "Listing Title",
//                                  hintStyle: TextStyle(
//                                    fontSize: 14.0,
//                                    color: kPrimaryColor.withOpacity(0.5),
//                                  ),
//                                  enabledBorder: InputBorder.none,
//                                  focusedBorder: InputBorder.none,
//                                ),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                    Container(
//                      margin: EdgeInsets.only(left: 10.0, right: 10.0, top:10.0),
//                      alignment: Alignment.center,
//                      padding: EdgeInsets.only(left: kDefaultPadding, right: 5.0),
//                      height: 45,
//                      decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.circular(7),
//                      ),
//                      child: Row(
//                        children: <Widget>[
//                          Expanded(
//                            child: Align(
//                              alignment: Alignment.center,
//                              child: TextField(
//                                onChanged: (value) {},
//                                decoration: InputDecoration(
//                                  hintText: "City",
//                                  hintStyle: TextStyle(
//                                    fontSize: 14.0,
//                                    color: kPrimaryColor.withOpacity(0.5),
//                                  ),
//                                  enabledBorder: InputBorder.none,
//                                  focusedBorder: InputBorder.none,
//                                ),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//
//                    Container(
//                      alignment: Alignment.center,
//                      margin: EdgeInsets.all(10.0),
//                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                      height: 45,
//                      decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.circular(7),
//                      ),
//                      child: DropdownButton(
//                        underline: SizedBox(),
//                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
//                        isExpanded: true,
//                        hint: Text(
//                          "Property Type",
//                          style: TextStyle(
//                            fontSize: 14.0,
//                            color: kPrimaryColor.withOpacity(0.5),
//                          ),
//                        ),
//                        value: _valSaleRent,
//                        items: _listSaleRent.map((value) {
//                          return DropdownMenuItem(
//                            child: Text(
//                              value,
//                              style: TextStyle(
//                                fontSize: 14.0,
//                              ),
//                            ),
//                            value: value,
//                          );
//                        }).toList(),
//                      ),
//                    ),
//                    Container(
//                      alignment: Alignment.center,
//                      margin: EdgeInsets.all(10.0),
//                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                      height: 45,
//                      decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.circular(7),
//                      ),
//                      child: DropdownButton(
//                        underline: SizedBox(),
//                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
//                        isExpanded: true,
//                        hint: Text(
//                          "Facilities",
//                          style: TextStyle(
//                            fontSize: 14.0,
//                            color: kPrimaryColor.withOpacity(0.5),
//                          ),
//                        ),
//                        value: _valSaleRent,
//                        items: _listSaleRent.map((value) {
//                          return DropdownMenuItem(
//                            child: Text(
//                              value,
//                              style: TextStyle(
//                                fontSize: 14.0,
//                              ),
//                            ),
//                            value: value,
//                          );
//                        }).toList(),
//                      ),
//                    ),
//                    Container(
//                      alignment: Alignment.center,
//                      margin: EdgeInsets.all(10.0),
//                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                      height: 45,
//                      decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.circular(7),
//                      ),
//                      child: DropdownButton(
//                        underline: SizedBox(),
//                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
//                        isExpanded: true,
//                        hint: Text(
//                          "Rent Frequency",
//                          style: TextStyle(
//                            fontSize: 14.0,
//                            color: kPrimaryColor.withOpacity(0.5),
//                          ),
//                        ),
//                        value: _valSaleRent,
//                        items: _listSaleRent.map((value) {
//                          return DropdownMenuItem(
//                            child: Text(
//                              value,
//                              style: TextStyle(
//                                fontSize: 14.0,
//                              ),
//                            ),
//                            value: value,
//                          );
//                        }).toList(),
//                      ),
//                    ),
//                    Container(
//                      alignment: Alignment.center,
//                      margin: EdgeInsets.all(10.0),
//                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                      height: 45,
//                      decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.circular(7),
//                      ),
//                      child: DropdownButton(
//                        underline: SizedBox(),
//                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
//                        isExpanded: true,
//                        hint: Text(
//                          "Listing Status",
//                          style: TextStyle(
//                            fontSize: 14.0,
//                            color: kPrimaryColor.withOpacity(0.5),
//                          ),
//                        ),
//                        value: _valSaleRent,
//                        items: _listSaleRent.map((value) {
//                          return DropdownMenuItem(
//                            child: Text(
//                              value,
//                              style: TextStyle(
//                                fontSize: 14.0,
//                              ),
//                            ),
//                            value: value,
//                          );
//                        }).toList(),
//                      ),
//                    ),
//                    RangeSlider(
//                        activeColor: Colors.red[700],
//                        inactiveColor: Colors.red[300],
//                        min: 1,
//                        max: 100,
//                        values: values,
//                        onChanged: (values){
//                          setState(() {
//                            values =values;
//                          });
//                        }
//                    ),
//                    new Container(
//                      margin: EdgeInsets.all(10.0),
//                      child: Card(
//                        color: kAppBarColorTheme,
//                        child: Padding(
//                          padding: EdgeInsets.all(10.0),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            crossAxisAlignment: CrossAxisAlignment.center,
//                            children: <Widget>[
//                              Text(
//                                'Join',
//                                style: TextStyle(
//                                    color: Colors.white,
//                                    fontWeight: FontWeight.bold),
//                              ),
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.only(top: 15.0),
//                child: Align(
//                    alignment: Alignment.topRight,
//                    child: RawMaterialButton(
//                      onPressed: () {
//                        Navigator.of(context).pop();
//                      },
//                      elevation: 2.0,
//                      fillColor: Colors.white,
//                      child: Icon(
//                        Icons.close,
//                        size: 20.0,
//                      ),
//                      shape: CircleBorder(),
//                    )),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

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

