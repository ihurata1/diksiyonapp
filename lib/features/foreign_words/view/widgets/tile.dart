// ignore_for_file: prefer_const_constructors

import 'package:boilerplate/constants/matchingColors.dart';
import 'package:boilerplate/features/foreign_words/model/foreign.dart';
import 'package:flutter/material.dart';

class ListTileForeign extends StatelessWidget {
  static var flags = {
    "Fransızca": "fr",
    "Almanca": "de",
    "Rusça": "ru",
    "Yunanca": "gr",
    "İtalyanca": "it",
    "İngilizce": "gb",
  };
  final VoidCallback? onPress;
  final ForeignModel foreign;

  const ListTileForeign({
    Key? key,
    this.onPress,
    required this.foreign,
  }) : super(key: key);
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
                text: foreign.word!,
                color: MatchingColors.red,
                icon: SizedBox(
                  width: 30,
                  child: flags.containsKey(foreign.country)
                      ? Opacity(
                          opacity: 0.75,
                          child: Text(
                            flags[foreign.country]!,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          //child: Image.asset(
                          //  'icons/flags/png/${flags[foreign.country]!}.png',
                          //  package: 'country_icons',
                          //),
                        )
                      : Icon(
                          Icons.assistant_photo,
                          color: MatchingColors.light2,
                          size: 30,
                        ),
                ),
                isLeft: true,
              ),
              _wordWidget(
                text: foreign.turkish!,
                color: MatchingColors.green,
                icon: SizedBox(
                  width: 30,
                  child: Opacity(
                    opacity: 0.75,
                    child: Text(
                      "tr",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    //child: Image.asset(
                    //  'icons/flags/png/tr.png',
                    //  package: 'country_icons',
                    //),
                  ),
                ),
                isLeft: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _wordWidget({required String text, required Color color, required Widget icon, bool isLeft = true}) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
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
                    style: TextStyle(color: MatchingColors.light),
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
