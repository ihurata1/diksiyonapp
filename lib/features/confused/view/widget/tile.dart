import 'package:boilerplate/constants/matchingColors.dart';
import 'package:flutter/material.dart';

class ListTileConfused extends StatelessWidget {
  final VoidCallback? onPress;
  final String wrongWord, rightWord;

  const ListTileConfused({Key? key, this.onPress, required this.wrongWord, required this.rightWord}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        elevation: 12,
        color: MatchingColors.dark2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Row(
            children: [
              _wordWidget(
                text: wrongWord,
                color: MatchingColors.red,
                isLeft: true,
              ),
              const Icon(
                Icons.swap_horiz,
                color: MatchingColors.yellow,
                size: 30,
              ),
              _wordWidget(
                text: rightWord,
                color: MatchingColors.green,
                isLeft: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _wordWidget({required String text, required Color color, bool isLeft = true}) {
    return Expanded(
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        elevation: 3,
        color: MatchingColors.dark3,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: MatchingColors.light),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
