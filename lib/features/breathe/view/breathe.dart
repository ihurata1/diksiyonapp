import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:boilerplate/features/breathe/viewmodel/breathe_controller.dart';
import 'package:boilerplate/helpers/device_info/device_info.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BreatheScreen extends GetView<BreatheController> {
  const BreatheScreen({super.key});

  Widget get _body {
    return Obx(
      () => GestureDetector(
        onTap: () {
          if (controller.status.value == -2) {
            controller.status.value = 0;
            controller.changeSize();
          }
        },
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: controller.circleBorder.value, color: controller.color.value),
                ),
                duration: (Duration(seconds: controller.duration)),
                width: controller.size.value == 0 ? controller.size.value = DeviceInfo.width(70) * controller.minSize.value : controller.size.value,
                height: controller.size.value == 0 ? controller.size.value = DeviceInfo.width(70) * controller.minSize.value : controller.size.value,
                onEnd: () {
                  controller.changeSize();
                },
              ),
              Text(
                controller.message.value,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: _body,
    );
  }
}
