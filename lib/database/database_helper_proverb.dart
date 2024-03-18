import 'dart:async';
import 'dart:io' as io;
import 'package:boilerplate/features/proverbs/model/proverb.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DataBaseHeplerProverb {
  static Database? _db;
  static const String PROVERBTABLE = 'Proverb';
  static const String DB_NAME = 'proverb.db';

  static const String ID = 'id';
  static const String PROVERB = 'sozum';
  static const String KEY = 'anahtar';
  static const String MEANING = 'anlami';
  static const String TYPE = 'turu2';

  static const List<String> proverbAllColumns = [ID, PROVERB, KEY, MEANING, TYPE];

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
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    String sqlQuery = """
    CREATE TABLE $PROVERBTABLE
    (
      $ID INTEGER PRIMARY KEY,
      $PROVERB TEXT,
      $KEY TEXT,
      $MEANING TEXT,
      $TYPE TEXT
    );
""";
    await db.execute(sqlQuery);
  }

  Future<ProverbModel> _saveProverb(ProverbModel proverb) async {
    var dbClient = await db;
    proverb.id = await dbClient.insert(PROVERBTABLE, proverb.toMap());
    return proverb;
  }

  _clearDatabase() async {
    var dbClient = await db;
    dbClient.delete("$PROVERBTABLE");
  }

  Future<List<ProverbModel>> saveData(List<ProverbModel> proverb) async {
    _clearDatabase();
    for (int i = 0; i < proverb.length; i++) {
      proverb[i] = await _saveProverb(proverb[i]);
    }
    return proverb;
  }

  Future<List<ProverbModel>> getProverbs() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(PROVERBTABLE, columns: proverbAllColumns);
    List<ProverbModel> proverbs = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        proverbs.add(ProverbModel.fromMap(maps[i].cast()));
      }
    }
    return proverbs;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
