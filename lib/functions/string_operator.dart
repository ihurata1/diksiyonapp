import 'dart:convert';

import 'package:flutter/foundation.dart';

class StringOperator {
  static var _map = {
    "Ğ": "G",
    "Ü": "U",
    "Ş": "S",
    "İ": "I",
    "Ç": "C",
    "Ö": "O",
    "Â": "A",
  };
  static String convertToEnglish(String src) {
    return src.replaceAllMapped(new RegExp("[^A-Z0-9]"), (match) => "${_map.containsKey(match[0]) ? _map[match[0]] : ''}");
  }

  static String convertToSearchable(String src) {
    return convertToEnglish(src.toUpperCase());
  }
}
