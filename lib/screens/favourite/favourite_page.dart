import 'package:flutter/material.dart';
import 'package:remax_app/model/todo_item.dart';
import 'package:remax_app/sidebar/navigation_bloc.dart';
import 'package:remax_app/util/constants.dart';
import 'package:remax_app/util/database_client.dart';
import 'package:remax_app/util/date_formatter.dart';

class FavoritePage extends StatefulWidget with NavigationStates {
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

    TodoItem noDoItem = TodoItem(1, "", "", "", "", "","","","","",dateFormatted());
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
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kAppBarColorTheme, //change your color here
        ),
        title: Text(
          "Favourite",
          style: TextStyle(color: kAppBarColorTheme),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
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
//                      child: ListTile(
//                        title: _itemList[index],
//                        onTap: () => _showDetail(_itemList[index], index),
//                        trailing: Listener(
//                          key: Key(_itemList[index].itemTitle),
//                          child: Icon(
//                            Icons.delete_forever,
//                            color: Colors.redAccent,
//                          ),
//                          onPointerDown: (pointerEvent) =>
//                              _deleteNoDo(_itemList[index].id, index),
//                        ),
//                      ),
                      height: 190.0,
                      child: Stack(
                        children: <Widget>[
                          _itemList[index],
                          GestureDetector(
                            onTap: () {
                              _deleteNoDo(_itemList[index].id, index);
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(right: 10.0, bottom: 10.0),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset('assets/images/love.png'),
                              ),
                            ),
                          ),
                        ],
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
