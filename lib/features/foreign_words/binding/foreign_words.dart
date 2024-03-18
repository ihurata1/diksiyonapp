import 'package:boilerplate/features/foreign_words/viewmodel/foreign_words_controller.dart';
import 'package:get/get.dart';

class ForeignWordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForeignWordsController>(() => ForeignWordsController());
  }
}
