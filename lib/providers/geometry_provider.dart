import 'package:flutter/material.dart';

class GeometryProvider with ChangeNotifier {
  int _currentScreen = 0;
  int get currentScreen => _currentScreen;
  set currentScreen(int currentScreen) {
    _currentScreen = currentScreen;
    notifyListeners();
  }

  double _result = 0;
  double get result => _result;
  set result(double result) {
    _result = result;
    notifyListeners();
  }

  double _side = 0;
  double get side => _side;
  set side(double side) {
    _side = side;
    notifyListeners();
  }

  double _height = 0;
  double get height => _height;
  set height(double height) {
    _height = height;
    notifyListeners();
  }

  double _wide = 0;
  double get wide => _wide;
  set wide(double wide) {
    _wide = wide;
    notifyListeners();
  }

  double _radio = 0;
  double get radio => _radio;
  set radio(double radio) {
    _radio = radio;
    notifyListeners();
  }

  double _bigRadius = 0;
  double get bigRadius => _bigRadius;
  set bigRadius(double bigRadius) {
    _bigRadius = bigRadius;
    notifyListeners();
  }

  double _smallRadio = 0;
  double get smallRadio => _smallRadio;
  set smallRadio(double smallRadio) {
    _smallRadio = smallRadio;
    notifyListeners();
  }

  bool _showStepByStep = true;
  bool get showStepByStep => _showStepByStep;
  set showStepByStep(bool showStepByStep) {
    _showStepByStep = showStepByStep;
    notifyListeners();
  }
}
