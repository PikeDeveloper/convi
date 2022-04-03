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

  List<String> _sidesAndAngle = [' a:', ' b:', ' c:', ' α:', ' β:', ' γ:'];
  List<String> get sidesAndAngle => _sidesAndAngle;
  set sidesAndAngle(List<String> sidesAndAngle) {
    _sidesAndAngle = sidesAndAngle;
    notifyListeners();
  }

  List<String> _angles = [' α:', ' β:', ' γ:'];
  List<String> get angles => _angles;
  set angles(List<String> angles) {
    _angles = angles;
    notifyListeners();
  }

  //-----------------------------------------Pitagoras:

  double _legA = 0;
  double get legA => _legA;
  set legA(double legA) {
    _legA = legA;
    notifyListeners();
  }

  //--------------
  double _legB = 0;
  double get legB => _legB;
  set legB(double legB) {
    _legB = legB;
    notifyListeners();
  }

  //--------------
  double _legC = 0;
  double get legC => _legC;
  set legC(double legC) {
    _legC = legC;
    notifyListeners();
  }

  //--------------
  String _inputPitagoras_1 = " a:";
  String get inputPitagoras_1 => _inputPitagoras_1;
  set inputPitagoras_1(String inputPitagoras_1) {
    _inputPitagoras_1 = inputPitagoras_1;
    notifyListeners();
  }

  //--------------
  String _inputPitagoras_2 = " b:";
  String get inputPitagoras_2 => _inputPitagoras_2;
  set inputPitagoras_2(String inputPitagoras_2) {
    _inputPitagoras_2 = inputPitagoras_2;
    notifyListeners();
  }

//-------------------------------------------------no rectangle

  List<String> _inputs = [' a:', ' β:', ' c:'];
  List<String> get inputs => _inputs;
  set inputs(List<String> inputs) {
    _inputs = inputs;
    notifyListeners();
  }

  String _input_1 = " a:";
  String get input_1 => _input_1;
  set input_1(String input_1) {
    _input_1 = input_1;
    _inputs[0] = input_1;
    notifyListeners();
  }

  //--------------
  String _input_2 = " β:";
  String get input_2 => _input_2;
  set input_2(String input_2) {
    _input_2 = input_2;
    _inputs[1] = input_2;
    notifyListeners();
  }

  //--------------
  String _input_3 = " c:";
  String get input_3 => _input_3;
  set input_3(String input_3) {
    _input_3 = input_3;
    _inputs[2] = input_3;
    notifyListeners();
  }

  //--------------
  double _sideA = 1;
  double get sideA => _sideA;
  set sideA(double sideA) {
    _sideA = sideA;
    notifyListeners();
  }

  //--------------
  double _alpha = 0;
  double get alpha => _alpha;
  set alpha(double alpha) {
    _alpha = alpha;
    notifyListeners();
  }

  //--------------
  double _sideB = 1;
  double get sideB => _sideB;
  set sideB(double sideB) {
    _sideB = sideB;
    notifyListeners();
  }

  //--------------
  double _beta = 0;
  double get beta => _beta;
  set beta(double beta) {
    _beta = beta;
    notifyListeners();
  }

  //--------------
  double _sideC = 1;
  double get sideC => _sideC;
  set sideC(double sideC) {
    _sideC = sideC;
    notifyListeners();
  }

  //--------------
  double _gamma = 0;
  double get gamma => _gamma;
  set gamma(double gamma) {
    _gamma = gamma;
    notifyListeners();
  }

  //--------------
  String _unknown = ' c:';
  String get unknown => _unknown;
  set unknown(String unknown) {
    _unknown = unknown;
    notifyListeners();
  }
}
