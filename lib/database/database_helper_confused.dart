import 'dart:async';
import 'dart:io' as io;
import 'package:boilerplate/features/confused/model/confused.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DataBaseHeplerConfused {
  static Database? _db;
  static const String CONFUSEDTABLE = 'Confused';
  static const String DB_NAME = 'confused.db';

  static const String ID = 'id';
  static const String WRONGWORD = 'yanlis';
  static const String RIGHTWORD = 'dogru';

  static const List<String> confusedAllColumns = [ID, WRONGWORD, RIGHTWORD];

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 4, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    String sqlQuery = """
    CREATE TABLE $CONFUSEDTABLE
    (
      $ID INTEGER PRIMARY KEY,
      $WRONGWORD TEXT,
      $RIGHTWORD TEXT
    );
""";
    await db.execute(sqlQuery);
  }

  Future<ConfusedModel> _saveConfused(ConfusedModel confused) async {
    var dbClient = await db;
    confused.id = await dbClient.insert(CONFUSEDTABLE, confused.toMap());
    return confused;
  }

  _clearDatabase() async {
    var dbClient = await db;
    dbClient.delete("$CONFUSEDTABLE");
  }

  Future<List<ConfusedModel>> saveData(List<ConfusedModel> confused) async {
    _clearDatabase();
    for (int i = 0; i < confused.length; i++) {
      confused[i] = await _saveConfused(confused[i]);
    }
    return confused;
  }

  Future<List<ConfusedModel>> getConfuseds() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(CONFUSEDTABLE, columns: confusedAllColumns);
    List<ConfusedModel> confuseds = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        confuseds.add(ConfusedModel.fromMap(maps[i].cast()));
      }
    }
    return confuseds;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
