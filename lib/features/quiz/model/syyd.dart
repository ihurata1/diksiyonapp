import 'dart:convert';

import 'package:boilerplate/database/database_helper_syyd.dart';

class SyydModel {
  String? yanlisKelime;
  String? dogruKelime;
  int? id;

  SyydModel({this.yanlisKelime, this.dogruKelime, this.id});
  SyydModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    yanlisKelime = map['yanliskelime'];
    dogruKelime = map['dogrukelime'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'id': id, 'yanliskelime': yanlisKelime, 'dogrukelime': dogruKelime};
    return map;
  }

  static List<SyydModel>? dataSyyd;
  static Future<void> getSyyds() async {
    DataBaseHeplerSyyd dataBaseHepler = DataBaseHeplerSyyd();
    dataSyyd = await dataBaseHepler.getSyyds();
  }

  static Future<void> saveSyyds(String src) async {
    var jsonData = json.decode(src);
    List<SyydModel> syydsJson = [];
    for (var item in jsonData) {
      syydsJson.add(SyydModel.fromMap(item));
    }
    DataBaseHeplerSyyd dataBaseHepler = DataBaseHeplerSyyd();
    await dataBaseHepler.saveData(syydsJson);
  }
}
