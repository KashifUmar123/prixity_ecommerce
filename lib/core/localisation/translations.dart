import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  static Map<String, String> english = {};

  static Future<void> loadTranslations() async {
    String data = await rootBundle.loadString("assets/locales/en.json");
    english = Map<String, String>.from(json.decode(data));
  }

  static List<Locale> locales = [
    const Locale("en", "US"),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': english,
      };
}
