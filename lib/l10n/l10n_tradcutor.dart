import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('es'),
    const Locale('hi'),
    const Locale('it'),
    const Locale('ja'),
    const Locale('pt'),
    const Locale('ru'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return 'us';
      case 'es':
        return 'es';
      case 'hi':
        return 'hi';
      case 'it':
        return 'it';
      case 'ja':
        return 'ja';
      case 'pt':
        return 'pt';
      case 'ru':
        return 'ru';
      default:
        return 'en';
    }
  }
}
