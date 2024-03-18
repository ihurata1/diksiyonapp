// ignore_for_file: must_be_immutable

import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:boilerplate/features/counter/viewmodel/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterScreen extends GetView<CounterController> {
  CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<CounterController>(
              builder: (value) {
                return Text(
                  value.getCounterValue,
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            SizedBox(height: 20.0),
            GestureDetector(onTap: () => controller.incrementObs(), child: Container(height: 25, width: 50, color: Colors.green, child: Icon(Icons.plus_one))),
          ],
        ),
      ),
    );
  }
}
