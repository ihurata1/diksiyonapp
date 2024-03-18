import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DataBaseHeplerLocations {
  static Database? _db;
  static const String LOCATIONSTTABLE = 'Location';
  static const String MAXNUMBERS = 'MaxNumbers';
  static const String DB_NAME = 'Dksyn.db';

  static const String LID = 'lid';
  static const String CID = 'cid';
  static const String FILEPATH = 'filepath';
  static const List<String> locationsAllColumns = [LID, CID, FILEPATH];

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
    CREATE TABLE $LOCATIONSTTABLE
    (
      $LID INTEGER PRIMARY KEY AUTOINCREMENT,
      $CID INTEGER,
      $FILEPATH TEXT
      
    );
""";
//FOREIGN KEY ($CATEGORYID) REFERENCES $CATEGORYTTABLE($CID)
    await db.execute(sqlQuery);
  }

  Future<String> saveLocation(String filePath, int contentId) async {
    var dbClient = await db;
    Map<String, dynamic> map = {FILEPATH: filePath};
    map[CID] = contentId;
    await dbClient.insert(LOCATIONSTTABLE, map);
    return filePath;
  }

  clearDatabase() async {
    var dbClient = await db;
    dbClient.delete("$LOCATIONSTTABLE");
  }

  Future<List<String>> getFilePaths(int contentId) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(LOCATIONSTTABLE, columns: locationsAllColumns, where: '$CID = ?', whereArgs: [contentId]);
    List<String> locations = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        locations.add(maps[i][FILEPATH]);
      }
    }
    return locations;
  }

  Future deletePath(String filepath) async {
    var dbClient = await db;
    await dbClient.delete(LOCATIONSTTABLE, where: '$FILEPATH = ?', whereArgs: [filepath]);
//FOREIGN KEY ($CATEGORYID) REFERENCES $CATEGORYTTABLE($CID)
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }

  Future<int> getMaxNumber() async {
    var dbClient = await db;
    String sqlQuery = """
    SELECT MAX($LID) FROM $LOCATIONSTTABLE
""";
//FOREIGN KEY ($CATEGORYID) REFERENCES $CATEGORYTTABLE($CID)

    var number = await dbClient.rawQuery(sqlQuery);
    return number[0]["MAX(lid)"] != null ? int.parse(number[0]["MAX(lid)"].toString()) : 0; // TEMP
  }
}
