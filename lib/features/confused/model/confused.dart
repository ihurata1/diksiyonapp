import 'dart:convert';

import 'package:boilerplate/database/database_helper_confused.dart';

class ConfusedModel {
  String? yanlis;
  String? dogru;
  int? id;

  ConfusedModel({this.yanlis, this.dogru, this.id});

  ConfusedModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    yanlis = map['yanlis'];
    dogru = map['dogru'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'id': id, 'yanlis': yanlis, 'dogru': dogru};
    return map;
  }

  static List<ConfusedModel>? dataConfused;
  static Future<void> getConfuseds() async {
    DataBaseHeplerConfused dataBaseHepler = new DataBaseHeplerConfused();
    dataConfused = await dataBaseHepler.getConfuseds();
  }

  static Future<void> saveConfuseds(String src) async {
    var jsonData = json.decode(src);
    List<ConfusedModel> confusedsJson = [];
    for (var item in jsonData) {
      confusedsJson.add(ConfusedModel.fromMap(item));
    }
    DataBaseHeplerConfused dataBaseHepler = new DataBaseHeplerConfused();
    await dataBaseHepler.saveData(confusedsJson);
  }
}
