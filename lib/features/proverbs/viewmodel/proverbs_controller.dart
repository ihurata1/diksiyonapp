// ignore_for_file: unused_import

import 'package:boilerplate/constants/matchingColors.dart';
import 'package:boilerplate/features/common_mistakes/view/widget/tile.dart';
import 'package:boilerplate/features/confused/model/confused.dart';
import 'package:boilerplate/features/confused/view/widget/tile.dart';
import 'package:boilerplate/features/foreign_words/view/widgets/tile.dart';
import 'package:boilerplate/features/proverbs/model/proverb.dart';
import 'package:boilerplate/features/proverbs/view/widget/content.dart';
import 'package:boilerplate/features/proverbs/view/widget/tile.dart';
import 'package:boilerplate/features/quiz/model/syyd.dart';
import 'package:boilerplate/functions/string_operator.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProverbsController extends GetxController {
  Rx<ScrollController> scrollController = ScrollController().obs;
  RxInt length = 100.obs;
  RxList<ProverbModel> searchedProverbs = ProverbModel.dataProverb!.obs;
  RxList<int> ids = [0].obs;
  RxInt searchSuggestionsLength = 20.obs;
  RxList<ProverbModel> searchList = [].cast<ProverbModel>().obs;
  RxString searchText = "".obs;

  void addScrollListener() {
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels >= scrollController.value.position.maxScrollExtent) {
        fetch();
      }
    });
  }

  find(query) {
    List<ProverbModel> searchedProverb = ProverbModel.dataProverb!
        .where(
          (p) => StringOperator.convertToSearchable(p.proverb!).contains(StringOperator.convertToSearchable(query)),
        )
        .take(100)
        .toList();
    return ListView.builder(
      itemCount: searchedProverb.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTileProverb(
          proverb: searchedProverb[index],
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
    );
  }

  fetch() {
    if (length.value + 100 <= ProverbModel.dataProverb!.length) {
      length.value += 100;
    } else {
      length.value = ProverbModel.dataProverb!.length;
    }
  }
}
