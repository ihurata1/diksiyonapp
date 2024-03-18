import 'package:boilerplate/constants/matchingColors.dart';
import 'package:flutter/material.dart';

class ListTileWrongRight extends StatelessWidget {
  final VoidCallback? onPress;
  final String wrongWord, rightWord;

  const ListTileWrongRight({Key? key, this.onPress, required this.wrongWord, required this.rightWord}) : super(key: key);
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
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: Colors.redAccent,
                  size: 30,
                ),
                isLeft: true,
              ),
              _wordWidget(
                text: rightWord,
                color: MatchingColors.green,
                icon: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.greenAccent,
                  size: 30,
                ),
                isLeft: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _wordWidget({required String text, required Color color, required Icon icon, bool isLeft = true}) {
    return Expanded(
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        elevation: 3,
        color: MatchingColors.dark3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              isLeft ? icon : Container(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: (isLeft ? 30 : 0), left: (isLeft ? 0 : 30)),
                  child: Text(
                    text,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: MatchingColors.light),
                  ),
                ),
              ),
              isLeft ? Container() : icon,
            ],
          ),
        ),
      ),
    );
  }
}
