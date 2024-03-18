import 'dart:math';

import 'package:boilerplate/features/home/view/home.dart';
import 'package:boilerplate/features/proverbs/model/proverb.dart';
import 'package:boilerplate/helpers/vibration_helper/vibration_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:turkish/turkish.dart';

class HangmanController extends GetxController {
  RxList<Image> imageList = [
    Image.asset("assets/hangman/0.png"),
    Image.asset("assets/hangman/1.png"),
    Image.asset("assets/hangman/2.png"),
    Image.asset("assets/hangman/3.png"),
    Image.asset("assets/hangman/4.png"),
    Image.asset("assets/hangman/5.png"),
    Image.asset("assets/hangman/6.png"),
  ].cast<Image>().obs;
  Rx<ProverbModel> proverb = ProverbModel().obs;
  RxString originalProverb = "".obs;
  RxString currentProverb = "".obs;
  RxString wronAnswers = "".obs;
  RxString rightAnswers = "".obs;
  RxString alphabet = "ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ".obs;
  RxInt picIndex = 0.obs;
  RxString temp = "".obs;
  RxList<Widget> letterList = [].cast<Widget>().obs;
  RxList<Widget> wordList = [].cast<Widget>().obs;

  addWordsIntoList(Widget word) {
    wordList.add(word);
  }

  addLettersIntoList(Widget sentence) {
    letterList.add(sentence);
  }

  emptyWordsList() {
    wordList.clear();
  }

  emptyLettersList() {
    letterList.clear();
  }

  List<Widget> get wordsList {
    return wordList;
  }

  List<Widget> get lettersList {
    return letterList;
  }

  init() {
    List<ProverbModel> searchedProverbs = ProverbModel.dataProverb!.where((p) => (!((p.proverb)!.contains("(") || (p.proverb)!.contains("'") || (p.proverb)!.contains("-")))).toList();
    proverb.value = searchedProverbs[Random().nextInt(searchedProverbs.length)];
    originalProverb.value = turkish.toUpperCase(proverb.value.proverb!.replaceAll(RegExp("[!\?\.,\*\<\>\&\+]"), ""));
    currentProverb.value = "";
    wronAnswers.value = "";
    rightAnswers.value = "";
    for (int i = 0; i < originalProverb.value.length; i++) {
      if (originalProverb.value[i] != " ") {
        currentProverb.value += "*";
      } else {
        currentProverb.value += " ";
      }
    }
  }

  bool nextPicture() {
    if (picIndex.value < 5) {
      picIndex.value++;
      return true;
    }
    if (picIndex.value == 5) {
      picIndex.value++;
      return false;
    }
    return false;
  }

  wrongAnswer(String answer) {
    VibrationHelper.longVibrate();
    wronAnswers.value += answer;
    if (!nextPicture()) {
      endOfGame(false);
    }
  }

  rightAnswer(String answer) {
    for (int i = 0; i < originalProverb.value.length; i++) {
      if (originalProverb.value[i] == answer) {
        temp.value += originalProverb.value[i];
      } else {
        temp.value += currentProverb.value[i];
      }
    }
    currentProverb.value = temp.value;
    temp.value = "";
    rightAnswers.value += answer;
    if (currentProverb.value == originalProverb.value) {
      endOfGame(true);
    }
  }

  resolve(String answer) {
    if (originalProverb.value.contains(answer)) {
      rightAnswer(answer);
    } else {
      wrongAnswer(answer);
    }
  }

  endOfGame(bool isWin) {
    if (isWin) {
      Get.off(() => HomeScreen());
    } else {
      Get.off(() => HomeScreen());
    }
  }
}
