// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:boilerplate/constants/matchingColors.dart';
import 'package:boilerplate/features/hangman/viewmodel/hangman_controller.dart';
import 'package:boilerplate/helpers/device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HangmanScreen extends GetView<HangmanController> {
  HangmanScreen({super.key}) {
    controller.init();
  }

  Widget _drawSentence({isGameOver = false}) {
    List<Widget> list = [];

    for (int i = 0; i < controller.currentProverb.value.split(" ").length; i++) {
      list.add(
        _drawWord(
          i: i,
          isGameOver: isGameOver,
        ),
      );
    }

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 30,
      runSpacing: 5,
      children: list,
    );
  }

  Widget _drawWord({required int i, isGameOver = false}) {
    List<Widget> list = [];

    for (int j = 0; j < controller.currentProverb.value.split(" ")[i].length; j++) {
      list.add(_drawLines(
        i: i,
        j: j,
        isGameOver: isGameOver,
      ));
    }
    return Wrap(
      children: list,
    );
  }

  Widget _drawLines({required int i, required int j, isGameOver = false}) {
    print(controller.originalProverb.value);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          Obx(
            () => Text(
              controller.currentProverb.value.split(" ")[i][j] == "*" ? (isGameOver ? controller.originalProverb.value.split(" ")[i][j] : "") : controller.currentProverb.value.split(" ")[i][j],
              style: TextStyle(fontSize: 20, color: (controller.currentProverb.value.split(" ")[i][j] == "*" && isGameOver) ? Colors.red : MatchingColors.light),
            ),
          ),
          Container(
            color: MatchingColors.light,
            height: 2,
            width: 20,
          ),
        ],
      ),
    );
  }

  List<Widget> alphabet() {
    List<Widget> array = [];
    for (int i = 0; i < controller.alphabet.value.length; i++) {
      array.add(Obx(() => _getKeyButton(controller.alphabet.value[i])));
    }
    return array;
  }

  Widget _getKeyButton(String letter) {
    Color color;
    double width = 2.5;
    VoidCallback function = () {};
    //WRONG ANSWER BUTTON
    if (controller.wronAnswers.contains(letter)) {
      color = Colors.red;
      width = 5;
    }
    //RIGHT ANSWER BUTTON
    else if (controller.rightAnswers.contains(letter)) {
      color = Colors.green;
      width = 5;
    }

    //REGULAR ANSWER BUTTON
    else {
      color = MatchingColors.dark3;
      function = () {
        print("Girdi");
        controller.resolve(letter);
      };
    }

    return GestureDetector(
      onTap: function,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(width: width, color: color),
        ),
        duration: (Duration(milliseconds: 300)),
        width: 5,
        alignment: Alignment.center,
        child: Text(
          letter,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget get _body {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 6,
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.all(8.0),
                child: controller.imageList[controller.picIndex.value],
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Hero(
              tag: "hangman",
              child: Material(
                type: MaterialType.transparency,
                child: FittedBox(
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  child: SizedBox(
                    width: DeviceInfo.width(100),
                    child: _drawSentence(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              crossAxisCount: 9,
              shrinkWrap: true,
              children: alphabet(),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: _body,
    );
  }
}
