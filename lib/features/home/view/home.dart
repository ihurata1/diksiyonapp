// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:boilerplate/features/home/model/menu_item.dart';
import 'package:boilerplate/helpers/device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: _body,
    );
  }

  Widget get _body {
    return GridView.count(
      padding: EdgeInsets.all(DeviceInfo.height(2)),
      crossAxisCount: 2,
      mainAxisSpacing: DeviceInfo.width(4),
      crossAxisSpacing: DeviceInfo.width(4),
      childAspectRatio: 4 / 3,
      children: _getMenuItemList,
    );
  }

  List<Widget> get _getMenuItemList {
    List<MenuItemModel> _list = MenuItemList.list;
    return List.generate(_list.length, (index) => _menuItem(_list[index].title, _list[index].icon, _list[index].route, _list[index].bgColor));
  }

  Widget _menuItem(title, icon, route, color) {
    return GestureDetector(
      onTap: () => {Get.toNamed(route)},
      child: Container(
        padding: EdgeInsets.all(DeviceInfo.width(4)),
        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black), color: color),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(height: DeviceInfo.height(1)),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
