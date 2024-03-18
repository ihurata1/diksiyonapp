import 'dart:async';
import 'dart:io' as io;
import 'package:boilerplate/features/foreign_words/model/foreign.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DataBaseHeplerForeign {
  static Database? _db;
  static const String FOREIGNTABLE = 'Foregn';
  static const String DB_NAME = 'foregn.db';

  static const String ID = 'id';
  static const String MEANING = 'meaning';
  static const String COUNTRY = 'country';
  static const String TURKISH = 'turkish';
  static const String ORIGINALWORD = 'originalWord';
  static const String WORD = 'word';

  static const List<String> foreignAllColumns = [ID, MEANING, COUNTRY, TURKISH, ORIGINALWORD, WORD];

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
    var db = await openDatabase(path, version: 5, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    String sqlQuery = """
    CREATE TABLE $FOREIGNTABLE
    (
      $ID INTEGER PRIMARY KEY,
      $MEANING TEXT,
      $COUNTRY TEXT,
      $TURKISH TEXT,
      $ORIGINALWORD TEXT,
      $WORD TEXT
    );
""";
    await db.execute(sqlQuery);
  }

  Future<ForeignModel> _saveForeign(ForeignModel foreign) async {
    var dbClient = await db;
    foreign.id = await dbClient.insert(FOREIGNTABLE, foreign.toMap());
    return foreign;
  }

  _clearDatabase() async {
    var dbClient = await db;
    dbClient.delete("$FOREIGNTABLE");
  }

  Future<List<ForeignModel>> saveData(List<ForeignModel> foreign) async {
    _clearDatabase();
    for (int i = 0; i < foreign.length; i++) {
      foreign[i] = await _saveForeign(foreign[i]);
    }
    return foreign;
  }

  Future<List<ForeignModel>> getForeigns() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(FOREIGNTABLE, columns: foreignAllColumns);
    List<ForeignModel> foreigns = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        foreigns.add(ForeignModel.fromMap(maps[i].cast()));
      }
    }
    return foreigns;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
