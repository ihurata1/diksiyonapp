import 'package:boilerplate/constants/data/proverbs.dart';
import 'package:boilerplate/constants/data/confused.dart';
import 'package:boilerplate/constants/data/foreign.dart';
import 'package:boilerplate/constants/data/syyd.dart';
import 'package:boilerplate/features/confused/model/confused.dart';
import 'package:boilerplate/features/foreign_words/model/foreign.dart';
import 'package:boilerplate/features/proverbs/model/proverb.dart';
import 'package:boilerplate/features/quiz/model/syyd.dart';
import 'package:flutter/material.dart';

class AppHelper {
  static initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      await _downloadAndSaveData(); //TODO: Add check if database has data no need to download
    } catch (e) {
      print(e);
    }
    await _getDataFromDatabase();
  }
}

Future<void> _getDataFromDatabase() async {
  await SyydModel.getSyyds();
  await ForeignModel.getForeigns();
  await ConfusedModel.getConfuseds();
  await ProverbModel.getProverbs();
}

Future<void> _downloadAndSaveData() async {
  //http://bitirme.eskapi.me/getversions
  //if (needToBeUpdated[0] == true)
  var responseSyyd = syydBody;
  await SyydModel.saveSyyds(responseSyyd);
  //SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.setInt("categoryProduct", newVersionNumbers[0]);

  var responseAtasozu = atasozleriBody;
  await ProverbModel.saveProverbs(responseAtasozu);
  //
  var responseConfused = confusedBody;
  await ConfusedModel.saveConfuseds(responseConfused);
  //
  var responseForeign = foreignBody;
  await ForeignModel.saveForeigns(responseForeign);
}
