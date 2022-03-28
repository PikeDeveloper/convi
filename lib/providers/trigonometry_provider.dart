import 'package:flutter/material.dart';

class TrigonometryProvider with ChangeNotifier {
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

  List<String> _sides = [' a:', ' b:', ' c:'];
  List<String> get sides => _sides;
  set sides(List<String> sides) {
    _sides = sides;
    notifyListeners();
  }

  //--------------------Pitagoras:

  double _catetoA = 0;
  double get catetoA => _catetoA;
  set catetoA(double catetoA) {
    _catetoA = catetoA;
    notifyListeners();
  }

  //--------------
  double _catetoB = 0;
  double get catetoB => _catetoB;
  set catetoB(double catetoB) {
    _catetoB = catetoB;
    notifyListeners();
  }

  //--------------
  double _hipotenusa = 0;
  double get hipotenusa => _hipotenusa;
  set hipotenusa(double hipotenusa) {
    _hipotenusa = hipotenusa;
    notifyListeners();
  }

  //--------------
  String _input_1 = " a:";
  String get input_1 => _input_1;
  set input_1(String input_1) {
    _input_1 = input_1;
    notifyListeners();
  }

  //--------------
  String _input_2 = " b:";
  String get input_2 => _input_2;
  set input_2(String input_2) {
    _input_2 = input_2;
    notifyListeners();
  }
}
