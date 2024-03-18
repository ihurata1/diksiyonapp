import 'dart:convert';

import 'package:boilerplate/database/database_helper_proverb.dart';
import 'package:turkish/turkish.dart';

class ProverbModel {
  int? id;
  String? proverb;
  String? key;
  String? meaning;
  String? type;

  ProverbModel({
    this.id,
    this.proverb,
    this.key,
    this.meaning,
    this.type,
  });
  ProverbModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    proverb = map['sozum'];
    key = map['anahtar'];
    meaning = map['anlami'];
    type = map['turu2'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'id': id, 'sozum': proverb, 'anahtar': key, 'anlami': meaning, 'turu2': type};
    return map;
  }

  String getProverb() {
    return turkish.toUpperCase(proverb![0]) + proverb!.substring(1);
  }

  List<String> getMeanings() {
    return this.meaning!.split("\n");
  }

  static List<ProverbModel>? dataProverb;
  static Future<void> getProverbs() async {
    DataBaseHeplerProverb dataBaseHepler = DataBaseHeplerProverb();
    dataProverb = await dataBaseHepler.getProverbs();
  }

  static Future<void> saveProverbs(String src) async {
    var jsonData = json.decode(src);
    List<ProverbModel> proverbList = [];
    for (var item in jsonData) {
      proverbList.add(ProverbModel.fromMap(item));
    }
    DataBaseHeplerProverb dataBaseHepler = DataBaseHeplerProverb();
    await dataBaseHepler.saveData(proverbList);
  }
}
