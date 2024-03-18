import 'package:boilerplate/features/quiz/viewmodel/quiz_controller.dart';
import 'package:get/get.dart';

class QuizBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizController>(() => QuizController());
  }
}
