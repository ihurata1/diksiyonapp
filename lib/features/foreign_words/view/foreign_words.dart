import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:boilerplate/features/foreign_words/model/foreign.dart';
import 'package:boilerplate/features/foreign_words/view/widgets/tile.dart';
import 'package:boilerplate/features/foreign_words/viewmodel/foreign_words_controller.dart';
import 'package:boilerplate/helpers/data_search_helper/data_search_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForeignWordsScreen extends GetView<ForeignWordsController> {
  ForeignWordsScreen({super.key}) {
    controller.addScrollListener();
  }

  Widget get _body {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: controller.scrollController.value,
              itemCount: controller.length.value,
              itemBuilder: (BuildContext context, int index) {
                return ListTileForeign(
                  foreign: ForeignModel.dataForeign![index],
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
        title: Text("Karıştırılan Kelimeler"),
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
