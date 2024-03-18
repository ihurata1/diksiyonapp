import 'package:boilerplate/features/proverbs/viewmodel/proverbs_controller.dart';
import 'package:get/get.dart';

class ProverbsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProverbsController>(() => ProverbsController());
  }
}
