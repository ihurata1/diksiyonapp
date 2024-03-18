import 'dart:ui';

import 'package:boilerplate/helpers/device_info/device_info.dart';
import 'package:boilerplate/helpers/vibration_helper/vibration_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BreatheController extends GetxController {
  RxList<int> waitDurations = [5, 5, 5, 5].obs;
  RxDouble bigSize = 0.9.obs;
  RxDouble smallSize = 0.5.obs;
  RxDouble minSize = 0.43.obs;
  RxDouble circleBorder = 5.0.obs;
  RxDouble size = 0.0.obs;
  RxString message = "Hazır".obs;
  RxInt status = (-2).obs;
  Rx<Color> color = Colors.blue.obs;

  changeSize() {
    if (status.value == 0) {
      VibrationHelper.hapticFeedBack();
      message.value = "Nefes Al";
      color.value = Colors.indigo;
      size.value = DeviceInfo.width(70);
      status.value = 1;
      circleBorder.value = 20;
    } else if (status.value == 1) {
      VibrationHelper.hapticFeedBack();
      message.value = "Tut";
      color.value = Colors.lightBlue;
      size.value = DeviceInfo.width(70) * bigSize.value;
      status.value = 2;
      circleBorder.value = 40;
    } else if (status.value == 2) {
      VibrationHelper.hapticFeedBack();
      color.value = Colors.indigo;
      message.value = "Nefes Ver";
      size.value = DeviceInfo.width(70) * smallSize.value;
      status.value = 3;
      circleBorder.value = 5;
    } else if (status.value == 3) {
      VibrationHelper.hapticFeedBack();
      message.value = "Tut";
      color.value = Colors.lightBlue;
      size.value = DeviceInfo.width(70) * minSize.value; //(MediaQuery.of(context).size.width - 30)
      status.value = 0;
      circleBorder.value = 2;
    }
  }

  int get duration {
    if (status.value < 0) return waitDurations[0];
    if (status.value - 1 >= 0) return waitDurations[status.value - 1];
    return waitDurations[waitDurations.length - 1];
  }
}
