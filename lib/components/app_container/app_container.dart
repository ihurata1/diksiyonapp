// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  AppContainer({
    super.key,
    required this.child,
    this.appBar,
    this.canPop = true,
  });

  final Widget child;
  PreferredSizeWidget? appBar;
  bool? canPop;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop!,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: appBar,
          body: child,
        ),
      ),
    );
  }
}
