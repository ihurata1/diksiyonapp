import 'package:vibration/vibration.dart';

class VibrationHelper {
  static hapticFeedBack() {
    Vibration.vibrate(duration: 20, amplitude: 255);
  }

  static longVibrate() {
    Vibration.vibrate(duration: 300);
  }
}
