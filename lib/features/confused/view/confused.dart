import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:boilerplate/features/confused/model/confused.dart';
import 'package:boilerplate/features/confused/view/widget/tile.dart';
import 'package:boilerplate/features/confused/viewmodel/confused_controller.dart';
import 'package:boilerplate/helpers/data_search_helper/data_search_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfusedScreen extends GetView<ConfusedController> {
  const ConfusedScreen({super.key});

  Widget get _body {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: controller.scrollController.value,
              itemCount: controller.length.value,
              itemBuilder: (BuildContext context, int index) {
                return ListTileConfused(
                  rightWord: ConfusedModel.dataConfused![index].dogru!,
                  wrongWord: ConfusedModel.dataConfused![index].yanlis!,
                  onPress: () {
                    //TODO Show related meaning of words
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      appBar: AppBar(
        title: const Text("Karıştırılan Kelimeler"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearchHelper(controller.find));
            },
          )
        ],
      ),
      child: _body,
    );
  }
}
