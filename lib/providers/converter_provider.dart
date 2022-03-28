import 'package:calculadorafisica/widgets_y_utilits/calc_helper.dart';
import 'package:flutter/material.dart';

class ConverterProvider with ChangeNotifier {
  String _magnitude = 'Temperature';

  String get magnitude => _magnitude;

  set magnitude(String magnitude) {
    // set inpuUnit and outputUnit according to de magnitude
    switch (magnitude) {
      case 'Temperature':
        _inputUnit = '°K';
        _outputUnit = '°K';
        _currentScreen = 0;
        _result = 0;
        _conversionFactor = 1;
        break;
      case 'Mass':
        _inputUnit = 'gram (g)';
        _outputUnit = 'gram (g)';
        _currentScreen = 1;
        _result = 0;
        _conversionFactor = 1;
        break;
      case 'Length':
        _inputUnit = 'Meter (m)';
        _outputUnit = 'Meter (m)';
        _currentScreen = 2;
        _result = 0;
        _conversionFactor = 1;
        break;
      case 'Speed':
        _inputUnit = 'Km/h';
        _outputUnit = 'Km/h';
        _currentScreen = 3;
        _result = 0;
        _conversionFactor = 1;
        break;
      case 'Volumen':
        _inputUnit = 'Liter (L)';
        _outputUnit = 'Liter (L)';
        _currentScreen = 4;
        _result = 0;
        _conversionFactor = 1;
        break;
      case 'Energy':
        _inputUnit = 'joules (J)';
        _outputUnit = 'joules (J)';
        _currentScreen = 5;
        _result = 0;
        _conversionFactor = 1;
        break;
      case 'Angle':
        _inputUnit = 'Degrees (°)';
        _outputUnit = 'Degrees (°)';
        _currentScreen = 6;
        _conversionFactor = 1;
        _result = 0;
        break;
      case 'Pressure':
        _inputUnit = 'bar';
        _outputUnit = 'bar';
        _currentScreen = 7;
        _result = 0;
        _conversionFactor = 1;
        break;
      case 'Radiation':
        _inputUnit = 'Becquerel (Bq)';
        _outputUnit = 'Becquerel (Bq)';
        _currentScreen = 8;
        _result = 0;
        _conversionFactor = 1;
        break;
      case 'Power':
        _inputUnit = 'Watt';
        _outputUnit = 'Watt';
        _currentScreen = 9;
        _result = 0;
        _conversionFactor = 1;
        break;
      case 'Force':
        _inputUnit = 'Newton';
        _outputUnit = 'Newton';
        _currentScreen = 10;
        _result = 0;
        _conversionFactor = 1;
        break;
      case 'Sound':
        _inputUnit = 'Bell (B)';
        _outputUnit = 'Bell (B)';
        _currentScreen = 11;
        _result = 0;
        _conversionFactor = 1;
        break;
      case 'Area':
        _inputUnit = 'm²';
        _outputUnit = 'm²';
        _currentScreen = 12;
        _result = 0;
        _conversionFactor = 1;
        break;
      case 'Density':
        _inputUnit = 'Kg/m³';
        _outputUnit = 'Kg/m³';
        _currentScreen = 13;
        _result = 0;
        _conversionFactor = 1;
        break;
      case 'Fuel consumption':
        _inputUnit = 'Km/Liter';
        _outputUnit = 'Km/Liter';
        _currentScreen = 14;
        _result = 0;
        _conversionFactor = 1;
        break;
      case 'Time':
        _inputUnit = 'Second (s)';
        _outputUnit = 'Second (s)';
        _currentScreen = 15;
        _result = 0;
        _conversionFactor = 1;
        break;
      default:
        result = 0;
    }
    //set magnitude:
    _magnitude = magnitude;
    notifyListeners();
  } //----------------------***************************

  String _outputUnit = '°K';

  String get outputUnit => _outputUnit;

  set outputUnit(String outputUnit) {
    _outputUnit = outputUnit;
    _calc();
    notifyListeners();
  } //----------------------***************************

  int _currentScreen = 0;

  int get currentScreen => _currentScreen;
  set currentScreen(int currentScreen) {
    _currentScreen = currentScreen;
    _calc();
    notifyListeners();
  } //----------------------***************************

  String _inputUnit = '°K';

  String get inputUnit => _inputUnit;

  set inputUnit(String inputUnit) {
    _inputUnit = inputUnit;
    _calc();
    notifyListeners();
  } //----------------------***************************

  double _inputValue = 1;

  double get inputValue => _inputValue;

  set inputValue(double inputValue) {
    _inputValue = inputValue;
    _calc();
    notifyListeners();
  }
  //----------------------***************************

  double _result = 0;

  double get result => _result;

  set result(double result) {
    _result = result;
    notifyListeners();
  }

  //----------------------***************************

  double _conversionFactor = 0;

  double get conversionFactor => _conversionFactor;

  set conversionFactor(double conversionFactor) {
    _conversionFactor = conversionFactor;
    notifyListeners();
  }

  //--------------------------------Calculations--------

  void _calc() {
    switch (magnitude) {
      case 'Temperature':
        _result = CalcHelper.temperatura(inputValue, inputUnit, outputUnit);
        break;
      case 'Mass':
        _result = CalcHelper.mass(inputValue, inputUnit, outputUnit);
        _conversionFactor = CalcHelper.mass(1, inputUnit, outputUnit);
        break;
      case 'Length':
        _result = CalcHelper.length(inputValue, inputUnit, outputUnit);
        _conversionFactor = CalcHelper.length(1, inputUnit, outputUnit);
        break;
      case 'Speed':
        _result = CalcHelper.speed(inputValue, inputUnit, outputUnit);
        _conversionFactor = CalcHelper.speed(1, inputUnit, outputUnit);
        break;
      case 'Volumen':
        _result = CalcHelper.volumen(inputValue, inputUnit, outputUnit);
        _conversionFactor = CalcHelper.volumen(1, inputUnit, outputUnit);
        break;
      case 'Energy':
        _result = CalcHelper.energy(inputValue, inputUnit, outputUnit);
        _conversionFactor = CalcHelper.energy(1, inputUnit, outputUnit);
        break;
      case 'Angle':
        _result = CalcHelper.angle(inputValue, inputUnit, outputUnit);
        _conversionFactor = CalcHelper.angle(1, inputUnit, outputUnit);
        break;
      case 'Pressure':
        _result = CalcHelper.pressure(inputValue, inputUnit, outputUnit);
        _conversionFactor = CalcHelper.pressure(1, inputUnit, outputUnit);
        break;
      case 'Radiation':
        _result = CalcHelper.radiation(inputValue, inputUnit, outputUnit);
        _conversionFactor = CalcHelper.radiation(1, inputUnit, outputUnit);
        break;
      case 'Power':
        _result = CalcHelper.power(inputValue, inputUnit, outputUnit);
        _conversionFactor = CalcHelper.power(1, inputUnit, outputUnit);
        break;
      case 'Force':
        _result = CalcHelper.force(inputValue, inputUnit, outputUnit);
        _conversionFactor = CalcHelper.force(1, inputUnit, outputUnit);
        break;
      case 'Sound':
        _result = CalcHelper.sound(inputValue, inputUnit, outputUnit);
        _conversionFactor = CalcHelper.sound(1, inputUnit, outputUnit);
        break;
      case 'Area':
        _result = CalcHelper.area(inputValue, inputUnit, outputUnit);
        _conversionFactor = CalcHelper.area(1, inputUnit, outputUnit);
        break;
      case 'Density':
        _result = CalcHelper.density(inputValue, inputUnit, outputUnit);
        _conversionFactor = CalcHelper.density(1, inputUnit, outputUnit);
        break;
      case 'Fuel consumption':
        _result = CalcHelper.fuelConsumption(inputValue, inputUnit, outputUnit);
        _conversionFactor =
            CalcHelper.fuelConsumption(1, inputUnit, outputUnit);
        break;
      case 'Time':
        _result = CalcHelper.time(inputValue, inputUnit, outputUnit);
        _conversionFactor = CalcHelper.time(1, inputUnit, outputUnit);
        break;
      default:
        _result = 0;
    }
  }
}
