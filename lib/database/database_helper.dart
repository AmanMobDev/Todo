import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  //static final _dataBaseName = "MyDataBase.db";
  // static final _dataBaseVersion = 1;

  static final tableName = "MyTodoTable";

  static final id = "id";
  static final title = "titile";
  static final description = "description";

  static Database _db;

  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_db != null) {
      return _db;
    }

    _db = await initDataBase();

    return _db;
  }

  initDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "todo.db");

    var theDb = openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE $tableName ($id integer autoincrement, $title text,$description text)');
    });

    return theDb;
  }

  DataBaseHelper.internal();

  Future<int> insert(Map<String, dynamic> row) async {
    var db = await instance.database;
    return db.insert(tableName, row);
  }

  queryAllRows() async {
    Database db = await instance.database;
    return await db.query(tableName);
  }

  Future close() async {
    var dbClient = await database;
    dbClient.close();
  }
}
