// ignore_for_file: unused_import

import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:boilerplate/constants/matchingColors.dart';
import 'package:boilerplate/features/confused/model/confused.dart';
import 'package:boilerplate/features/confused/view/widget/tile.dart';
import 'package:boilerplate/features/proverbs/model/proverb.dart';
import 'package:boilerplate/features/proverbs/view/widget/content.dart';
import 'package:boilerplate/features/proverbs/view/widget/tile.dart';
import 'package:boilerplate/features/proverbs/viewmodel/proverbs_controller.dart';
import 'package:boilerplate/helpers/data_search_helper/data_search_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProverbsScreen extends GetView<ProverbsController> {
  const ProverbsScreen({super.key});

  Widget get _body {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: controller.scrollController.value,
              itemCount: controller.length.value,
              itemBuilder: (BuildContext context, int index) {
                return ListTileProverb(
                  proverb: ProverbModel.dataProverb![index],
                  onPress: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            opaque: false,
                            barrierColor: MatchingColors.dark1.withOpacity(0.7),
                            barrierDismissible: true,
                            fullscreenDialog: true,
                            pageBuilder: (context, _, __) => ProverbContentPage(ProverbModel.dataProverb![index])));
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
        title: const Text("Atasözleri"),
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
