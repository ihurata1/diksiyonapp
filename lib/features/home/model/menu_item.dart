// ignore_for_file: unused_field

import 'package:boilerplate/route/app_routes.dart';
import 'package:flutter/material.dart';

class MenuItemModel {
  final String title;
  final IconData icon;
  final String route;
  final Color bgColor;
  MenuItemModel({required this.title, required this.icon, required this.route, required this.bgColor});
}

class MenuItemList {
  static final List<MenuItemModel> list = [
    MenuItemModel(title: "Quiz", icon: Icons.check_circle_outline, route: AppRoutes.quiz, bgColor: Colors.yellow),
    MenuItemModel(title: "Yabancı Kelimeler", icon: Icons.language, route: AppRoutes.foreignWords, bgColor: Colors.blue),
    MenuItemModel(title: "Sık Yapılan Yanlışlar", icon: Icons.remove_circle_outline, route: AppRoutes.commonMistakes, bgColor: Colors.green),
    MenuItemModel(title: "Karıştırılan Kelimeler", icon: Icons.swap_horiz, route: AppRoutes.confused, bgColor: Colors.red),
    MenuItemModel(title: "Atasözleri", icon: Icons.text_snippet_outlined, route: AppRoutes.proverbs, bgColor: Colors.lightGreen),
    MenuItemModel(title: "Nefes Egzersizi", icon: Icons.favorite_border, route: AppRoutes.breathe, bgColor: Colors.lightBlue),
    MenuItemModel(title: "Adam Asmanca", icon: Icons.outlet_rounded, route: AppRoutes.hangman, bgColor: Colors.pink.shade300),
  ];
}
