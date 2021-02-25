import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remax_app/model/todo_item.dart';
import 'package:remax_app/sidebar/navigation_bloc.dart';
import 'package:remax_app/util/database_client.dart';
import 'package:remax_app/util/date_formatter.dart';

import '../main.dart';
import 'detail_page.dart';
import 'main_drawer.dart';

import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget  with NavigationStates  {
  @override
  _FavoritePageState createState() => new _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final TextEditingController _textEditingController = TextEditingController();
  var db = DatabaseHelper();
  final List<TodoItem> _itemList = <TodoItem>[];

  @override
  void initState() {
    super.initState();

    _readToDoList();
  }

  void _handleSubmitted(String text) async {
    _textEditingController.clear();

    TodoItem noDoItem = TodoItem(1, "", "", "", "", dateFormatted());
    int savedItemId = await db.saveItem(noDoItem);

    TodoItem addedItem = await db.getItem(savedItemId);

    setState(() {
      _itemList.insert(0, addedItem);
    });

    print("Item saved id: $savedItemId");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                  padding: EdgeInsets.all(2.0),
                  reverse: false,
                  itemCount: _itemList.length,
                  itemBuilder: (_, int index) {
                    return Container(
                      child: ListTile(
                        title: _itemList[index],
                        onTap: () => _showDetail(_itemList[index], index),
                        trailing: Listener(
                          key: Key(_itemList[index].itemTitle),
                          child: Icon(
                            Icons.delete_forever,
                            color: Colors.redAccent,
                          ),
                          onPointerDown: (pointerEvent) =>
                              _deleteNoDo(_itemList[index].id, index),
                        ),
                      ),
                    );
                  }),
            ),
            // Divider(
            //   height: 10.0,
            // )
          ],
        ),
      ),
    );
  }

  void _showFormDialog() {
    var alert = AlertDialog(
      content: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
                controller: _textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                    labelText: "Todo", icon: Icon(Icons.event_note)),
              ))
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              _handleSubmitted(_textEditingController.text);
              _textEditingController.clear();
              Navigator.pop(context);
            },
            child: Text("Save")),
        FlatButton(
            onPressed: () => Navigator.pop(context), child: Text("Cancel"))
      ],
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

  _readToDoList() async {
    List items = await db.getItems();
    items.forEach((item) {
      TodoItem todoItem = TodoItem.fromMap(item);
      setState(() {
        _itemList.add(TodoItem.map(item));
      });
      print("Db items: ${todoItem.itemTitle}");
    });
  }

  _deleteNoDo(int id, int index) async {
    debugPrint("Deleted Todo!");

    await db.deleteItem(id);
    setState(() {
      _itemList.removeAt(index);
    });
  }

  _updateItem(TodoItem item, int index) {
    var alert = AlertDialog(
      title: Text("Update Todo"),
      content: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
                controller: _textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                    labelText: "Update Todo", icon: Icon(Icons.update)),
              ))
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () async {
              TodoItem newItemUpdated = TodoItem.fromMap({
                "itemName": _textEditingController.text,
                "dateCreated": dateFormatted(),
                "id": item.id
              });

              _handleSubmittedUpdate(index, item); //redrawing the screen
              await db.updateItem(newItemUpdated); //updating the item
              setState(() {
                _readToDoList(); // redrawing the screen with all items saved in the db
              });

              Navigator.pop(context);
            },
            child: Text("Update")),
        FlatButton(
            onPressed: () => Navigator.pop(context), child: Text("Cancel"))
      ],
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

  _showDetail(TodoItem itemList, int index) {
    var alert = new AlertDialog(
      title: Text("Detail"),
      content: Row(
        children: <Widget>[
          Expanded(
            child: Text(itemList.itemTitle),
          )
        ],
      ),
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

  void _handleSubmittedUpdate(int index, TodoItem item) {
    setState(() {
      _itemList.removeWhere((element) {
        _itemList[index].itemTitle == item.itemTitle;
      });
    });
  }

  void _showTip() {
    var alert = new AlertDialog(
      title: Text("Tip"),
      content: Row(
        children: <Widget>[
          Expanded(
            child:
            Text("Press to see Todo detail\n\nLong press to update Todo"),
          )
        ],
      ),
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }
}

class ItemListFav extends StatelessWidget {
  //List list;
  List<TodoItem> list = <TodoItem>[];


  ItemListFav({this.list});

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
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new DetailPage(
                  list: list,
                  index: i,
                ))),
            child: new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(100),
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.all( const Radius.circular(10.0)
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://genius.remax.co.id/papi/' +
                                  list[i].itemThumbnail),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        list[i].itemTitle,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          fontSize: 16.0,
                          color: const Color(0xff767472),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
//                  Row(
//                    children: <Widget>[
//                      new Container(
//                        margin:
//                        EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
//                        child: new Align(
//                            alignment: Alignment.centerLeft,
//                            child: Column(
//                              children: <Widget>[
//                                new Image.asset('assets/images/bed.png',
//                                    width: 15, height: 15),
//                                list[i]['listBedroom'] != null
//                                    ? new Text(list[i]['listBedroom'],
//                                  style: new TextStyle(
//                                    fontSize: 10.0,
//                                    fontWeight: FontWeight.bold,
//                                  ),)
//                                    : new Text('-',
//                                    style: new TextStyle(
//                                      fontSize: 10.0,
//                                      fontWeight: FontWeight.bold,
//                                    ))
//                              ],
//                            )),
//                      ),
//                      new Container(
//                        margin:
//                        EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
//                        child: new Align(
//                            alignment: Alignment.centerLeft,
//                            child: Column(
//                              children: <Widget>[
//                                new Image.asset('assets/images/bathtub.png',
//                                    width: 15, height: 15),
//                                list[i]['listBathroom'] != null
//                                    ? new Text(list[i]['listBathroom'],
//                                  style: new TextStyle(
//                                    fontSize: 10.0,
//                                    fontWeight: FontWeight.bold,
//                                  ),)
//                                    : new Text('-',
//                                    style: new TextStyle(
//                                      fontSize: 10.0,
//                                      fontWeight: FontWeight.bold,
//                                    ))
//                              ],
//                            )),
//                      ),
//                      new Container(
//                        margin:
//                        EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
//                        child: new Align(
//                            alignment: Alignment.centerLeft,
//                            child: Column(
//                              children: <Widget>[
//                                new Image.asset('assets/images/home.png',
//                                    width: 15, height: 15),
//                                list[i]['listBuildingSize'] != null
//                                    ? new Text(list[i]['listBuildingSize'],
//                                  style: new TextStyle(
//                                    fontSize: 10.0,
//                                    fontWeight: FontWeight.bold,
//                                  ),)
//                                    : new Text('-',
//                                    style: new TextStyle(
//                                      fontSize: 10.0,
//                                      fontWeight: FontWeight.bold,
//                                    ))
//                              ],
//                            )),
//                      ),
//                      new Container(
//                        margin:
//                        EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
//                        child: new Align(
//                            alignment: Alignment.centerLeft,
//                            child: Column(
//                              children: <Widget>[
//                                new Image.asset('assets/images/area.png',
//                                    width: 15, height: 15),
//                                list[i]['listLandSize'] != null
//                                    ? new Text(list[i]['listLandSize'],
//                                  style: new TextStyle(
//                                    fontSize: 10.0,
//                                    fontWeight: FontWeight.bold,
//                                  ),)
//                                    : new Text('-',
//                                    style: new TextStyle(
//                                      fontSize: 10.0,
//                                      fontWeight: FontWeight.bold,
//                                    ))
//                              ],
//                            )),
//                      ),
//                    ],
//                  ),
                  list[i].itemCategory == "1"
                      ? Row(children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          NumberFormat.compactCurrency(
                              locale: 'id',
                              symbol: 'Rp ',
                              decimalDigits: 0)
                              .format(toInt(list[i].itemPrice)),
                          style: new TextStyle(
                            fontSize: 21.0,
                            color: const Color(0xffDC1B2E),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    new Text(
                      "DIJUAL",
                      style: new TextStyle(
                          fontSize: 12.0, color: const Color(0xffDC1B2E)),
                    )
                  ])
                      : Row(children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          NumberFormat.compactCurrency(
                              locale: 'id',
                              symbol: 'Rp ',
                              decimalDigits: 0)
                              .format(toInt(list[i].itemPrice)),
                          style: new TextStyle(
                            fontSize: 21.0,
                            color: const Color(0xff1A3668),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    new Text(
                      "DISEWAKAN",
                      style: new TextStyle(
                          fontSize: 12.0, color: const Color(0xff1A3668)),
                    )
                  ]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


