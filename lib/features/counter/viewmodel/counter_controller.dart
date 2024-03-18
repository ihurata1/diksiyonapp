import 'package:get/get.dart';

class CounterController extends GetxController {
  int counter = 0;
  RxInt counterObs = 0.obs;

  increment() {
    counter++;
    update();
  }

  String get getCounterValue => counterObs.value.toString();

  incrementObs() => counterObs++;
}
