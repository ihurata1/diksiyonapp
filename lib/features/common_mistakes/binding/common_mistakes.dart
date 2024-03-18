import 'package:boilerplate/features/common_mistakes/viewmodel/common_mistakes_controller.dart';
import 'package:get/get.dart';

class CommonMistakesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommonMistakesController>(() => CommonMistakesController());
  }
}
