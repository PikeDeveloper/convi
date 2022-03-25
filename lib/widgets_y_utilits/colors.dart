import 'package:flutter/material.dart';

class MyColors {
  static const scaffoldBackgroundColor = Color(0xFFf7f7f7);
  static const primary = Color(0xFF000000);
  static const dropDownColor = Color(0xFFFFFFFF);
  static const blue = Color(0xFF003c92);
  static const blue67 = Color(0xFF012E67);
  static const greenAndroid = Color(0xFFa4c639);
  static const blue9B = Color(0xFF00609B);
  static const blueCF = Color(0xFF3193CF);
  static const grayAD = Color(0xFFB1ADAD);

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
