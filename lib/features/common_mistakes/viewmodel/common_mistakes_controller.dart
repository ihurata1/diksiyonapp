import 'package:boilerplate/features/common_mistakes/view/widget/tile.dart';
import 'package:boilerplate/features/foreign_words/view/widgets/tile.dart';
import 'package:boilerplate/features/quiz/model/syyd.dart';
import 'package:boilerplate/functions/string_operator.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CommonMistakesController extends GetxController {
  Rx<ScrollController> scrollController = ScrollController().obs;
  RxInt length = 100.obs;
  RxList<SyydModel> searchedSyyd = SyydModel.dataSyyd!.obs;

  void addScrollListener() {
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels >= scrollController.value.position.maxScrollExtent) {
        fetch();
      }
    });
  }

  find(query) {
    List<SyydModel> searchedSyyd = SyydModel.dataSyyd!
        .where((p) =>
            StringOperator.convertToSearchable(p.dogruKelime!).contains(StringOperator.convertToSearchable(query)) ||
            StringOperator.convertToSearchable(p.yanlisKelime!).contains(StringOperator.convertToSearchable(query)))
        .take(100)
        .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTileWrongRight(
        rightWord: searchedSyyd[index].dogruKelime!,
        wrongWord: searchedSyyd[index].yanlisKelime!,
      ),
      itemCount: searchedSyyd.length,
    );
  }

  fetch() {
    if (length.value + 100 <= SyydModel.dataSyyd!.length) {
      length.value += 100;
    } else {
      length.value = SyydModel.dataSyyd!.length;
    }
  }
}
