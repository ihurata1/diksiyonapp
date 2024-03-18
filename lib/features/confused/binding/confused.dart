import 'package:boilerplate/features/confused/viewmodel/confused_controller.dart';
import 'package:get/get.dart';

class ConfusedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfusedController>(() => ConfusedController());
  }
}
