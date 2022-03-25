import 'package:calculadorafisica/portada.dart';
import 'package:flutter/material.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    Portada.route: (BuildContext context) => const Portada(),
  };
}
