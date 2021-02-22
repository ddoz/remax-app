import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyCustomerPage extends StatefulWidget {
  final VoidCallback signOut;
  final Map<String, String> headers;

  MyCustomerPage(this.signOut, this.headers);

  @override
  _MyCustomerPageState createState() => _MyCustomerPageState();
}

class _MyCustomerPageState extends State<MyCustomerPage> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  String name = "", member = "";

//  TabController tabController;

  Future<List> getData() async {
    final response = await http.get(
        "https://genius.remax.co.id/api/customer/crud?pageSize=30",
        headers: widget.headers);
    List list = json.decode(response.body)['data'];
    return list;
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString("name");
      member = preferences.getString("member");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Customer "),
        ),
        body: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new ItemList(
                    list: snapshot.data,
                  )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List list;

  ItemList({this.list});

  int toInt(String str) {
    var myInt = int.parse(str);
    assert(myInt is int);
    return myInt;
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
//            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//                builder: (BuildContext context) => new DetailPage(
//                  list: list,
//                  index: i,
//                ))),
            child: new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        list[i]['custName'],
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          fontSize: 16.0,
                          color: const Color(0xff767472),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  list[i]['custAddress'] != null
                      ? Container(
                          margin: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              list[i]['custAddress'],
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(
                                fontSize: 16.0,
                                color: const Color(0xff767472),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              '-',
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(
                                fontSize: 16.0,
                                color: const Color(0xff767472),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
