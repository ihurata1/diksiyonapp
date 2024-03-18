import 'package:boilerplate/features/breathe/viewmodel/breathe_controller.dart';
import 'package:get/get.dart';

class BreatheBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreatheController>(() => BreatheController());
  }
}
