import 'dart:async';
import 'dart:io' as io;
import 'package:boilerplate/features/quiz/model/syyd.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DataBaseHeplerSyyd {
  static Database? _db;
  static const String SYYDTABLE = 'Syyd';
  static const String DB_NAME = 'asd.db';

  static const String ID = 'id';
  static const String WRONGWORD = 'yanliskelime';
  static const String RIGHTWORD = 'dogrukelime';

  static const List<String> syydAllColumns = [ID, WRONGWORD, RIGHTWORD];

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
    CREATE TABLE $SYYDTABLE
    (
      $ID INTEGER PRIMARY KEY,
      $WRONGWORD TEXT,
      $RIGHTWORD TEXT
    );
""";
    await db.execute(sqlQuery);
  }

  Future<SyydModel> _saveSyyd(SyydModel syyd) async {
    var dbClient = await db;
    syyd.id = await dbClient.insert(SYYDTABLE, syyd.toMap());
    return syyd;
  }

  _clearDatabase() async {
    var dbClient = await db;
    dbClient.delete("$SYYDTABLE");
  }

  Future<List<SyydModel>> saveData(List<SyydModel> syyd) async {
    _clearDatabase();
    for (int i = 0; i < syyd.length; i++) {
      syyd[i] = await _saveSyyd(syyd[i]);
    }
    return syyd;
  }

  Future<List<SyydModel>> getSyyds() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(SYYDTABLE, columns: syydAllColumns);
    List<SyydModel> syyds = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        syyds.add(SyydModel.fromMap(maps[i].cast()));
      }
    }
    return syyds;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
