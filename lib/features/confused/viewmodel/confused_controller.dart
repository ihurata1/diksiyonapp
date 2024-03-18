import 'package:boilerplate/features/confused/model/confused.dart';
import 'package:boilerplate/features/confused/view/widget/tile.dart';
import 'package:boilerplate/features/quiz/model/syyd.dart';
import 'package:boilerplate/functions/string_operator.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ConfusedController extends GetxController {
  Rx<ScrollController> scrollController = ScrollController().obs;
  RxInt length = 100.obs;
  RxList<ConfusedModel> searchedConfused = ConfusedModel.dataConfused!.obs;

  void addScrollListener() {
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels >= scrollController.value.position.maxScrollExtent) {
        fetch();
      }
    });
  }

  find(query) {
    List<ConfusedModel> searchedConfused = ConfusedModel.dataConfused!
        .where((p) =>
            StringOperator.convertToSearchable(p.dogru!).contains(StringOperator.convertToSearchable(query)) ||
            StringOperator.convertToSearchable(p.yanlis!).contains(StringOperator.convertToSearchable(query)))
        .take(100)
        .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTileConfused(
        rightWord: searchedConfused[index].dogru!,
        wrongWord: searchedConfused[index].yanlis!,
      ),
      itemCount: searchedConfused.length,
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
