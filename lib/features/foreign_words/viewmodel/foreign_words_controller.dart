import 'dart:ffi';

import 'package:boilerplate/features/foreign_words/model/foreign.dart';
import 'package:boilerplate/features/foreign_words/view/widgets/tile.dart';
import 'package:boilerplate/functions/string_operator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForeignWordsController extends GetxController {
  Rx<ScrollController> scrollController = ScrollController().obs;
  RxInt length = 100.obs;
  RxList<ForeignModel> searchedForeigns = ForeignModel.dataForeign!.obs;

  void addScrollListener() {
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels >= scrollController.value.position.maxScrollExtent) {
        fetch();
      }
    });
  }

  find(query) {
    List<ForeignModel> searchedForeigns = ForeignModel.dataForeign!
        .where((p) =>
            StringOperator.convertToSearchable(p.turkish!).contains(StringOperator.convertToSearchable(query)) ||
            StringOperator.convertToSearchable(p.word!).contains(StringOperator.convertToSearchable(query)))
        .take(100)
        .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTileForeign(
        foreign: searchedForeigns[index],
      ),
      itemCount: searchedForeigns.length,
    );
  }

  fetch() {
    if (length.value + 100 <= ForeignModel.dataForeign!.length) {
      length.value += 100;
    } else {
      length.value = ForeignModel.dataForeign!.length;
    }
  }
}
