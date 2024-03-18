import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizResultScreen extends GetView {
  final int trueAnswerCount;
  final int totalQuestionCount;
  const QuizResultScreen({super.key, required this.totalQuestionCount, required this.trueAnswerCount});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Center(child: Text("Total Score: $trueAnswerCount/$totalQuestionCount")),
    );
  }
}
