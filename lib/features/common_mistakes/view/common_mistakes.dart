import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:boilerplate/features/common_mistakes/view/widget/tile.dart';
import 'package:boilerplate/features/common_mistakes/viewmodel/common_mistakes_controller.dart';
import 'package:boilerplate/features/foreign_words/view/widgets/tile.dart';
import 'package:boilerplate/features/quiz/model/syyd.dart';
import 'package:boilerplate/helpers/data_search_helper/data_search_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonMistakesScreen extends GetView<CommonMistakesController> {
  const CommonMistakesScreen({super.key});

  Widget get _body {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: controller.scrollController.value,
              itemCount: controller.length.value,
              itemBuilder: (BuildContext context, int index) {
                return ListTileWrongRight(
                  rightWord: SyydModel.dataSyyd![index].dogruKelime!,
                  wrongWord: SyydModel.dataSyyd![index].yanlisKelime!,
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
        title: const Text("Sık Yapılan Yanlışlar"),
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
