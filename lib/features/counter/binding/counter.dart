import 'package:boilerplate/features/counter/viewmodel/counter_controller.dart';
import 'package:get/get.dart';

class CounterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterController>(() => CounterController());
  }
}
