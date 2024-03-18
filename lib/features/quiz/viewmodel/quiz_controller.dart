// ignore_for_file: unused_element, invalid_use_of_protected_member, prefer_const_constructors

import 'dart:async';

import 'package:boilerplate/constants/matchingColors.dart';
import 'package:boilerplate/features/quiz/model/question.dart';
import 'package:boilerplate/features/quiz/view/quiz_result.dart';
import 'package:boilerplate/helpers/vibration_helper/vibration_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  RxBool isActive = false.obs;
  RxDouble seconds = 0.0.obs;
  Rx<Timer> timer = Timer(Duration(seconds: 0), () {}).obs;
  RxString selectedChoice = "".obs;
  RxList<Widget> scoreTable = [].cast<Widget>().obs;
  RxList<Question> questions = [].cast<Question>().obs;
  RxInt currentIndex = 0.obs;
  Rx<IconData> wrongIcon = Icons.remove_circle_outline.obs;
  Rx<IconData> rightIcon = Icons.check_circle_outline.obs;

  Rx<Color> buttonsColor = MatchingColors.light.obs;
  Rx<Color> progressColorCurrent = Colors.black.obs;
  Rx<Color> progressColorOriginal = Colors.white.obs;
  RxList<String> choices = [""].obs;

  int trueCount = 0;

  setQuestionList(List<Question> questionsList) {
    questions.value = questionsList;
  }

  void toggleActiveness() => isActive.value = !isActive.value;

  void setIsActiveFalse() => isActive.value = false;

  void setIsActiveTrue() => isActive.value = true;

  void startTimer() {
    if (timer.value != Timer(Duration(seconds: 0), () {})) timer.value.cancel();
    timer.value = Timer.periodic(const Duration(milliseconds: 20), onTimerTick);
  }

  startQuiz() {
    if (timer.value != Timer(Duration(seconds: 0), () {})) {
      timer.value.cancel();
    }
    seconds.value = 10.0;
    progressColorCurrent.value = progressColorOriginal.value;
    startTimer();
    currentIndex.value = -1;
    questions.shuffle();
    scoreTable.clear();
    for (var i = 0; i < questions.length; i++) {
      scoreTable.add(
        Icon(
          Icons.check_circle_outline,
          color: Colors.black,
        ),
      );
    }
    nextQuestion();
    isActive.value = true;
  }

  onTimerTick(Timer timer) {
    if (seconds.value - 0.02 >= 0) {
      seconds.value -= 0.02;
    } else {
      timer.cancel();
      isActive.value = false;
      selectedChoice.value = "";
      //wrongAnswer();
      print("Vibrated");
      if (currentIndex.value < questions.length - 1) Timer(Duration(seconds: 2), revealAnswer);
    }
  }

  shuffleChoices(List<Question> questions) {
    choices.value = questions[currentIndex.value].choices!.keys.toList();
    choices.shuffle();
  }

  revealAnswer() {
    nextQuestion();
    startTimer();
  }

  nextQuestion() {
    progressColorCurrent.value = progressColorOriginal.value;
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      shuffleChoices(questions);
      seconds.value = 10.0;
      isActive.value = true;
    } else {
      timer.value.cancel();
      for (Icon item in scoreTable.value.cast<Icon>()) {
        if (item.icon == Icons.check_circle_outline) {
          trueCount++;
        }
      }
      Get.off(() => QuizResultScreen(totalQuestionCount: questions.length, trueAnswerCount: trueCount));
    }
  }

  rightAnswer() {
    progressColorCurrent.value = Colors.green;
    scoreTable[currentIndex.value] = Icon(
      rightIcon.value,
      color: Colors.green,
    );
  }

  wrongAnswer() {
    VibrationHelper.longVibrate();
    progressColorCurrent.value = Colors.red;
    scoreTable[currentIndex.value] = Icon(
      wrongIcon.value,
      color: Colors.red,
    );
  }

  onChoiceButtonPressed(String key) {
    timer.value.cancel();
    isActive.value = false;
    selectedChoice.value = key;
    if (questions[currentIndex.value].choices![key]!) {
      rightAnswer();
    } else {
      wrongAnswer();
    }
    Timer(Duration(seconds: 2), revealAnswer);
  }
}
