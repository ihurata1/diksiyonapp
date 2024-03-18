import 'package:boilerplate/constants/matchingColors.dart';
import 'package:boilerplate/features/proverbs/model/proverb.dart';
import 'package:flutter/material.dart';

class ListTileProverb extends StatelessWidget {
  final VoidCallback? onPress;
  final ProverbModel? proverb;

  const ListTileProverb({
    this.onPress,
    this.proverb,
  });
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
                text: proverb!.proverb ?? "BOŞ",
                subtitle: proverb!.type ?? "BOŞ",
                color: MatchingColors.light,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _wordWidget({
    String? text,
    String? subtitle,
    Color? color,
  }) {
    return Expanded(
      child: Hero(
        tag: proverb!.id!,
        child: Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
          elevation: 3,
          color: MatchingColors.dark3,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      text![0].toUpperCase(),
                      style: TextStyle(color: MatchingColors.blue),
                    ),
                  ),
                  const VerticalDivider(
                    color: MatchingColors.light2,
                  ),
                  Expanded(
                    child: Text(
                      text,
                      maxLines: 10,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: MatchingColors.light),
                    ),
                  ),
                  Text(
                    proverb!.type!,
                    maxLines: 10,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: MatchingColors.light2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
