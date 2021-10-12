import 'package:sqflite/sqflite.dart'; //sqflite package
import 'package:path_provider/path_provider.dart'; //path_provider package
import 'package:path/path.dart'; //used to join paths
import './tracker_model.dart'; //import model class
import 'dart:io';
import 'dart:async';

class TrackerDbProvider {
  Future<Database> init() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path = join(directory.path, "tracker.db"); //create path to database

    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1, onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE Trackers(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          date TEXT,
          title TEXT,
          propertyType TEXT,
          ownerName TEXT,
          gender TEXT,
          ownerPhone TEXT,
          ownerMail TEXT,
          transactionType TEXT,
          buyerName TEXT,
          buyerPhone TEXT,
          buyerMail TEXT,
          startDate TEXT,
          endDate TEXT,
          propertyStatus TEXT,
          price TEXT,
          priceType TEXT,
          foto TEXT,
          notaryName TEXT,
          notaryPhone TEXT,
          statusData TEXT,
          modifiedData TEXT)""");
    });
  }

  Future<int> addItem(TrackerModel item) async {
    //returns number of items inserted as an integer

    final db = await init(); //open database

    return db.insert(
      "Trackers", item.toMap(), //toMap() function from MemoModel
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<List<TrackerModel>> fetchTrackers() async {
    //returns the memos as a list (array)

    final db = await init();
    final maps = await db
        .query("Memos"); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) {
      //create a list of memos
      return TrackerModel(
        id: maps[i]['id'],
        date: maps[i]['date'],
        title: maps[i]['title'],
        propertyType: maps[i]['propertyType'],
        ownerName: maps[i]['ownerName'],
        gender: maps[i]['gender'],
        ownerPhone: maps[i]['ownerPhone'],
        ownerMail: maps[i]['ownerMail'],
        transactionType: maps[i]['transactionType'],
        buyerName: maps[i]['buyerName'],
        buyerPhone: maps[i]['buyerPhone'],
        buyerMail: maps[i]['buyerMail'],
        startDate: maps[i]['startDate'],
        endDate: maps[i]['endDate'],
        propertyStatus: maps[i]['propertyStatus'],
        price: maps[i]['price'],
        priceType: maps[i]['priceType'],
        foto: maps[i]['foto'],
        notaryName: maps[i]['notaryName'],
        notaryPhone: maps[i]['notaryPhone'],
        statusData: maps[i]['statusData'],
        modifiedData: maps[i]['modifiedData'],
      );
    });
  }

  Future<int> deleteTracker(int id) async {
    //returns number of items deleted
    final db = await init();

    int result = await db.delete("Trackers", //table name
        where: "id = ?",
        whereArgs: [id] // use whereArgs to avoid SQL injection
        );

    return result;
  }

  Future<int> updateTracker(int id, TrackerModel item) async {
    // returns the number of rows updated

    final db = await init();

    int result = await db
        .update("Trackers", item.toMap(), where: "id = ?", whereArgs: [id]);
    return result;
  }
}
