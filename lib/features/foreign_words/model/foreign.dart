import 'dart:convert';

import 'package:boilerplate/database/database_helper_foreign.dart';

class ForeignModel {
  String? meaning;
  String? country;
  String? turkish;
  String? originalWord;
  String? word;
  int? id;

  ForeignModel(this.meaning, this.country, this.turkish, this.originalWord, this.word, {required this.id});

  ForeignModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    meaning = map['meaning'];
    country = map['country'];
    turkish = map['turkish'];
    originalWord = map['originalWord'];
    word = map['word'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'meaning': meaning,
      'country': country,
      'turkish': turkish,
      'originalWord': originalWord,
      'word': word,
    };
    return map;
  }

  static List<ForeignModel>? dataForeign;
  static Future<void> getForeigns() async {
    DataBaseHeplerForeign dataBaseHepler = DataBaseHeplerForeign();
    dataForeign = await dataBaseHepler.getForeigns();
  }

  static Future<void> saveForeigns(String src) async {
    var jsonData = json.decode(src);
    List<ForeignModel> foreignsJson = [];
    for (var item in jsonData) {
      foreignsJson.add(ForeignModel.fromMap(item));
    }
    DataBaseHeplerForeign dataBaseHepler = DataBaseHeplerForeign();
    await dataBaseHepler.saveData(foreignsJson);
  }
}
