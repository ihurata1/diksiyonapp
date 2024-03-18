import 'package:boilerplate/constants/matchingColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Styles {
  Styles._();
/*  
  //03. Dark & Earthy
  static const Color background = Color(0xff46211a);
  static const Color third = Color(0xff693d3d);
  static const Color second = Color(0xffba5536);
  static const Color first = Color(0xffa43820);*/

  /*// 05. Cool Blues
  static const Color background = Color(0xff003b46);
  static const Color third = Color(0xff07575b);
  static const Color second = Color(0xff66a5ad);
  static const Color first = Color(0xffc4dfe6);*/

  // 30. Berry Blues
  static const TextStyle defaultStyle = TextStyle(
    color: MatchingColors.light,
  );
  static const TextStyle contentHeaderStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: MatchingColors.light,
  );

  static const TextStyle contentStyle = TextStyle(
    color: MatchingColors.light,
    fontSize: 18,
  );

  static const TextStyle weakStyle = TextStyle(
    color: MatchingColors.dark3,
    fontStyle: FontStyle.italic,
    fontSize: 13,
  );

  static const TextStyle headerStyle = TextStyle(
    color: MatchingColors.light,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static TextStyle italicLightStyle = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w300,
    color: MatchingColors.light,
  );
  static TextStyle italicDarkStyle = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w300,
    color: MatchingColors.dark1,
  );

  static TextStyle dictionaryWordListStyle = TextStyle(
    fontSize: 18,
    color: MatchingColors.dark1,
    fontWeight: FontWeight.bold,
  );
}
