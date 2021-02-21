import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:remax_app/model/todo_item.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  final String tableName = "remaxTbl";
  final String columnId = "id";
  final String columnListTitle = "title";
  final String columnListThumbnail = "thumbnail";
  final String columnListPrice = "price";
  final String columnListCategoryId = "category";
  final String columnDateCreated = "dateCreated";

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "remax_db.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName(id INTEGER PRIMARY KEY, $columnListTitle TEXT, $columnListThumbnail TEXT, $columnListPrice TEXT,  $columnListCategoryId TEXT,  $columnDateCreated TEXT)");
    print("Table is created");
  }

//insertion
  Future<int> saveItem(TodoItem item) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableName", item.toMap());
    print(res.toString());
    return res;
  }

  //Get
  Future<List> getItems() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName ORDER BY $columnId ASC"); //ASC

    return result.toList();
  }

  Future<bool> getItemFav(int id) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName WHERE id = $id");
    if (result.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $tableName"
    ));
  }
//get
  Future<TodoItem> getItem(int id) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName WHERE id = $id");
    if (result.length == 0) return null;
    return TodoItem.fromMap(result.first);
  }

  //deletion
//  Future<int> deleteItem(int id) async {
//    var dbClient = await db;
//    var result = await dbClient.rawQuery("DELETE FROM $tableName WHERE id = $id");
//    if (result.length == 0) return null;
//    return result.first as int;
//  }

  Future<int> deleteItem(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableName,
        where: "$columnId = ?", whereArgs: [id]);

  }
  Future<int> updateItem(TodoItem item) async {
    var dbClient = await db;
    return await dbClient.update("$tableName", item.toMap(),
        where: "$columnId = ?", whereArgs: [item.id]);

  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
