import 'package:boilerplate/features/hangman/viewmodel/hangman_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class HangmanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HangmanController>(() => HangmanController());
  }
}
