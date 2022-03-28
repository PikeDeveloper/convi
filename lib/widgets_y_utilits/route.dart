import 'package:calculadorafisica/screens/home_screen.dart';
import 'package:calculadorafisica/screens/converter/converter.dart';
import 'package:flutter/material.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    ConverterScreen.route: (BuildContext context) => const ConverterScreen(),
    HomeScreen.route: (BuildContext context) => const HomeScreen(),
  };
}
