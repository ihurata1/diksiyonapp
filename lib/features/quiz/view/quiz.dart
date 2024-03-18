// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:boilerplate/constants/matchingColors.dart';
import 'package:boilerplate/features/quiz/model/question.dart';
import 'package:boilerplate/features/quiz/viewmodel/quiz_controller.dart';
import 'package:boilerplate/helpers/device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizScreen extends GetView<QuizController> {
  List<Question> questionList;
  QuizScreen({required this.questionList, super.key}) {
    controller.setQuestionList(questionList);
    controller.startQuiz();
  }

  getChoicesAndBottom() {
    List<Widget> children = [];
    for (var i = 0; i < controller.choices.length; i++) {
      children.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 15),
        child: Obx(
          () => GestureDetector(
            onTap: controller.isActive.value ? () => controller.onChoiceButtonPressed(controller.choices[i]) : () {},
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: controller.isActive.value
                      ? controller.buttonsColor.value
                      : questionList[controller.currentIndex.value].choices![controller.choices[i]]!
                          ? Colors.green
                          : controller.selectedChoice.value == controller.choices[i]
                              ? Colors.red
                              : controller.buttonsColor.value,
                ),
                padding: EdgeInsets.all(20),
                height: 100,
                width: 100,
                child: Text(
                  controller.choices[i].split(", ")[0],
                  style: TextStyle(color: MatchingColors.dark1),
                )),
          ),
        ),
      ));
    }
    children.add(
      Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Row(
          children: controller.scoreTable,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ),
    );
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      canPop: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              controller.timer.value.cancel();
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.only(top: DeviceInfo.height(2), left: DeviceInfo.width(2)),
              alignment: Alignment.topLeft,
              height: 100,
              width: 100,
              child: Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () {
                    if (controller.progressColorOriginal.value == controller.progressColorCurrent.value) {
                      return Center(child: Text(controller.seconds.value.ceil().toString()));
                    } else {
                      return Center(
                        child: Icon(
                          controller.progressColorCurrent.value == Colors.green ? controller.rightIcon.value : controller.wrongIcon.value,
                          size: 40,
                          color: controller.progressColorCurrent.value,
                        ),
                      );
                    }
                  },
                ),
                Expanded(
                  child: Text(questionList[controller.currentIndex.value].question!, style: TextStyle(color: Colors.black)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Obx(
                      () => Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: getChoicesAndBottom(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
