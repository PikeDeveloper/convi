//
// I use 0.10101010101 like error code

import 'dart:math';

class CalcHelper {
  static double temperatura(
      double _inputValue, String inputUnit, String outputUnit) {
    double _kelvinDouble;
    double _celciusDouble;
    double _fahrenheitDouble;
    double result = 0;
    switch (inputUnit) {
      case "°C":
        _celciusDouble = _inputValue;
        _kelvinDouble = _inputValue + 273.15;
        _fahrenheitDouble = ((9 * _inputValue) / 5) + 32;

        break;
      case "°F":
        _fahrenheitDouble = _inputValue;
        _kelvinDouble = ((5 * (_inputValue - 32)) / 9) + 273.15;
        _celciusDouble = ((5 * (_inputValue - 32)) / 9);

        break;
      case "°K":
        _kelvinDouble = _inputValue;
        _celciusDouble = _inputValue - 273.15;
        _fahrenheitDouble = ((9 * (_inputValue - 273.15)) / 5) + 32;

        break;
      default:
        // set every value on error code 0.10101010101
        _kelvinDouble = 0.10101010101;
        _celciusDouble = 0.10101010101;
        _fahrenheitDouble = 0.10101010101;
    }

    switch (outputUnit) {
      case "°C":
        result = _celciusDouble;
        break;
      case "°F":
        result = _fahrenheitDouble;
        break;
      case "°K":
        result = _kelvinDouble;
        break;
      default:
        result = 0;
    }

    return result;
  }

  //****************************************Mass */

  static double mass(double _inputValue, String inputUnit, String outputUnit) {
    double _kilogramoDouble;
    double _gramoDouble;
    double _onzaDouble;
    double _libraDouble;
    double _toneladaMetricaDouble;
    double _toneladaCortaDouble;
    double _toneladaLargaDouble;

    double result = 0;

    switch (inputUnit) {
      case 'gram (g)':
        _gramoDouble = _inputValue;
        _kilogramoDouble = _inputValue * (1 / 1000);
        _onzaDouble = _kilogramoDouble * 35.273961949;
        _libraDouble = _kilogramoDouble * (1 / 0.45359237);
        _toneladaMetricaDouble = _kilogramoDouble * (1 / 1000);
        _toneladaCortaDouble = _kilogramoDouble * (1 / 907.184739999999);
        _toneladaLargaDouble = _kilogramoDouble * (1 / 1016.05);

        break;
      case 'Kg':
        _kilogramoDouble = _inputValue;
        _gramoDouble = _inputValue * 1000;
        _onzaDouble = _kilogramoDouble * 35.273961949;
        _libraDouble = _kilogramoDouble * (1 / 0.45359237);
        _toneladaMetricaDouble = _kilogramoDouble * (1 / 1000);
        _toneladaCortaDouble = _kilogramoDouble * (1 / 907.184739999999);
        _toneladaLargaDouble = _kilogramoDouble * (1 / 1016.05);

        break;
      case 'oz (oz)':
        _kilogramoDouble = _inputValue * 0.028349523125;
        _gramoDouble = _kilogramoDouble * 1000;
        _onzaDouble = _inputValue;
        _libraDouble = _inputValue * (1 / 16);
        _toneladaMetricaDouble = _kilogramoDouble * (1 / 1000);
        _toneladaCortaDouble = _inputValue * (1 / 32000);
        _toneladaLargaDouble = _inputValue * (1 / 35840);

        break;
      case 'Pound (lb)':
        _kilogramoDouble = _inputValue * 0.45359237;
        _gramoDouble = _kilogramoDouble * 1000;
        _onzaDouble = _inputValue * 16;
        _libraDouble = _inputValue;
        _toneladaMetricaDouble = _kilogramoDouble * (1 / 1000);
        _toneladaCortaDouble = _inputValue * (1 / 2000);
        _toneladaLargaDouble = _inputValue * (1 / 2240);

        break;
      case 'Metric ton (t)':
        _kilogramoDouble = _inputValue * 1000;
        _gramoDouble = _kilogramoDouble * 1000;
        _onzaDouble = _kilogramoDouble * 35.273961949;
        _libraDouble = _kilogramoDouble * (1 / 0.45359237);
        _toneladaMetricaDouble = _inputValue;
        _toneladaCortaDouble = _kilogramoDouble * (1 / 907.184739999999);
        _toneladaLargaDouble = _kilogramoDouble * (1 / 1016.05);

        break;
      case 'Short ton (tn)':
        _kilogramoDouble = _inputValue * 907.185;
        _gramoDouble = _kilogramoDouble * 1000;
        _onzaDouble = _inputValue * 32000;
        _libraDouble = _inputValue * 2000;
        _toneladaMetricaDouble = _kilogramoDouble * (1 / 1000);
        _toneladaCortaDouble = _inputValue;
        _toneladaLargaDouble = _inputValue * (1 / 1.12);

        break;
      case 'Long ton':
        _kilogramoDouble = _inputValue * 1016.05;
        _gramoDouble = _kilogramoDouble * 1000;
        _onzaDouble = _inputValue * 35840;
        _libraDouble = _inputValue * 2240;
        _toneladaMetricaDouble = _kilogramoDouble * (1 / 1000);
        _toneladaCortaDouble = _inputValue * 1.12;
        _toneladaLargaDouble = _inputValue;
        break;

      default:
        // set every value on error code 0.10101010101
        _kilogramoDouble = 0.10101010101;
        _gramoDouble = 0.10101010101;
        _onzaDouble = 0.10101010101;
        _libraDouble = 0.10101010101;
        _toneladaMetricaDouble = 0.10101010101;
        _toneladaCortaDouble = 0.10101010101;
        _toneladaLargaDouble = 0.10101010101;
    }
    switch (outputUnit) {
      case 'gram (g)':
        result = _gramoDouble;
        break;
      case 'Kg':
        result = _kilogramoDouble;
        break;
      case 'oz (oz)':
        result = _onzaDouble;
        break;
      case 'Pound (lb)':
        result = _libraDouble;
        break;
      case 'Metric ton (t)':
        result = _toneladaMetricaDouble;
        break;
      case 'Short ton (tn)':
        result = _toneladaCortaDouble;
        break;
      case 'Long ton':
        result = _toneladaLargaDouble;
        break;
      default:
        result = 0;
    }
    return result;
  }

  //****************************************Mass */

  static double length(
      double _inputValue, String inputUnit, String outputUnit) {
    double _kilometroDouble = 1;
    double _metroDouble = 1;
    double _centimetroDouble = 1;
    double _millaDouble = 1;
    double _yardaDouble = 1;
    double _pieDouble = 1;
    double _pulgadaDouble = 1;
    double _millaNauticaDouble = 1;
    double _udAstronomicaDouble = 1;
    double _anoLuzDouble = 1;

    double result = 0;

    switch (inputUnit) {
      case 'Km':
        _kilometroDouble = _inputValue;
        _metroDouble = _kilometroDouble * 1000;
        _centimetroDouble = _metroDouble * 100;
        _millaDouble = _kilometroDouble * (1 / 1.609344);
        _yardaDouble = _metroDouble * 1.0936132983377078272;
        _pieDouble = _metroDouble * 3.2808398950131232768;
        _pulgadaDouble = _metroDouble * 39.37007874015748096;
        _millaNauticaDouble = _kilometroDouble * (1 / 1.852);
        _udAstronomicaDouble = _metroDouble / 149597870700;
        _anoLuzDouble = _kilometroDouble / 9460730472580.8;
        break;
      case 'Meter (m)':
        _kilometroDouble = _inputValue / 1000;
        _metroDouble = _inputValue;
        _centimetroDouble = _metroDouble * 100;
        _millaDouble = _kilometroDouble * (1 / 1.609344);
        _yardaDouble = _metroDouble * 1.0936132983377078272;
        _pieDouble = _metroDouble * 3.2808398950131232768;
        _pulgadaDouble = _metroDouble * 39.37007874015748096;
        _millaNauticaDouble = _kilometroDouble * (1 / 1.852);
        _udAstronomicaDouble = _metroDouble / 149597870700;
        _anoLuzDouble = _kilometroDouble / 9460730472580.8;
        break;
      case 'cm':
        _kilometroDouble = _inputValue / 100000;
        _metroDouble = _inputValue / 100;
        _centimetroDouble = _inputValue;
        _millaDouble = _kilometroDouble * (1 / 1.609344);
        _yardaDouble = _metroDouble * 1.0936132983377078272;
        _pieDouble = _metroDouble * 3.2808398950131232768;
        _pulgadaDouble = _metroDouble * 39.37007874015748096;
        _millaNauticaDouble = _kilometroDouble * (1 / 1.852);
        _udAstronomicaDouble = _metroDouble / 149597870700;
        _anoLuzDouble = _kilometroDouble / 9460730472580.8;
        break;
      case 'Mille (mi)':
        _kilometroDouble = _inputValue * 1.609344;
        _metroDouble = _kilometroDouble * 1000;
        _centimetroDouble = _metroDouble * 100;
        _millaDouble = _inputValue;
        _yardaDouble = _inputValue * 1760;
        _pieDouble = _inputValue * 5280;
        _pulgadaDouble = _inputValue * 63360;
        _millaNauticaDouble = _kilometroDouble * (1 / 1.852);
        _udAstronomicaDouble = _metroDouble / 149597870700;
        _anoLuzDouble = _kilometroDouble / 9460730472580.8;
        break;
      case 'Yard (yd)':
        _kilometroDouble = _inputValue * (1 / 1093.6132983377078272);
        _metroDouble = _kilometroDouble * 1000;
        _centimetroDouble = _metroDouble * 100;
        _millaDouble = _inputValue * (1 / 1760);
        _yardaDouble = _inputValue;
        _pieDouble = _inputValue * 3;
        _pulgadaDouble = _inputValue * 36;
        _millaNauticaDouble = _kilometroDouble * (1 / 1.852);
        _udAstronomicaDouble = _metroDouble / 149597870700;
        _anoLuzDouble = _kilometroDouble / 9460730472580.8;
        break;
      case 'Foot (ft)':
        _metroDouble = _inputValue / 3.2808398950131232768;
        _kilometroDouble = _metroDouble * 1000;
        _centimetroDouble = _metroDouble * 100;
        _millaDouble = _inputValue / 5280;
        _yardaDouble = _inputValue / 3;
        _pieDouble = _inputValue;
        _pulgadaDouble = _inputValue * 12;
        _millaNauticaDouble = _kilometroDouble / 1.852;
        _udAstronomicaDouble = _metroDouble / 149597870700;
        _anoLuzDouble = _kilometroDouble / 9460730472580.8;
        break;
      case 'inch':
        _metroDouble = _inputValue / 39.37007874015748096;
        _kilometroDouble = _metroDouble * 1000;
        _centimetroDouble = _metroDouble * 100;
        _millaDouble = _inputValue / 63360;
        _yardaDouble = _inputValue / 36;
        _pieDouble = _inputValue / 12;
        _pulgadaDouble = _inputValue;
        _millaNauticaDouble = _kilometroDouble / 1.852;
        _udAstronomicaDouble = _metroDouble / 149597870700;
        _anoLuzDouble = _kilometroDouble / 9460730472580.8;
        break;
      case 'Nautical mile':
        _kilometroDouble = _inputValue * 1.852;
        _metroDouble = _kilometroDouble * 1000;
        _centimetroDouble = _metroDouble * 100;
        _millaDouble = _kilometroDouble * (1 / 1.609344);
        _yardaDouble = _metroDouble * 1.0936132983377078272;
        _pieDouble = _metroDouble * 3.2808398950131232768;
        _pulgadaDouble = _metroDouble * 39.37007874015748096;
        _millaNauticaDouble = _inputValue;
        _udAstronomicaDouble = _metroDouble / 149597870700;
        _anoLuzDouble = _kilometroDouble / 9460730472580.8;
        break;
      case 'au':
        _metroDouble = _inputValue * 149597870700;
        _kilometroDouble = _metroDouble / 1000;
        _centimetroDouble = _metroDouble * 100;
        _millaDouble = _kilometroDouble * (1 / 1.609344);
        _yardaDouble = _metroDouble * 1.0936132983377078272;
        _pieDouble = _metroDouble * 3.2808398950131232768;
        _pulgadaDouble = _metroDouble * 39.37007874015748096;
        _millaNauticaDouble = _kilometroDouble / 1.852;
        _udAstronomicaDouble = _inputValue;
        _anoLuzDouble = _kilometroDouble / 9460730472580.8;
        break;
      case 'Light-year':
        _kilometroDouble = _inputValue * 9460730472580.8;
        _metroDouble = _kilometroDouble * 1000;
        _centimetroDouble = _metroDouble * 100;
        _millaDouble = _kilometroDouble * (1 / 1.609344);
        _yardaDouble = _metroDouble * 1.0936132983377078272;
        _pieDouble = _metroDouble * 3.2808398950131232768;
        _pulgadaDouble = _metroDouble * 39.37007874015748096;
        _millaNauticaDouble = _kilometroDouble * (1 / 1.852);
        _udAstronomicaDouble = _metroDouble / 149597870700;
        _anoLuzDouble = _inputValue;
        break;
      default:
        // set every value on error code 0.10101010101
        _kilometroDouble = 0.10101010101;
        _metroDouble = 0.10101010101;
        _centimetroDouble = 0.10101010101;
        _millaDouble = 0.10101010101;
        _yardaDouble = 0.10101010101;
        _pieDouble = 0.10101010101;
        _pulgadaDouble = 0.10101010101;
        _millaNauticaDouble = 0.10101010101;
        _udAstronomicaDouble = 0.10101010101;
        _anoLuzDouble = 0.10101010101;
    }
    switch (outputUnit) {
      case 'Km':
        result = _kilometroDouble;
        break;
      case 'Meter (m)':
        result = _metroDouble;
        break;
      case 'cm':
        result = _centimetroDouble;
        break;
      case 'Mille (mi)':
        result = _millaDouble;
        break;
      case 'Yard (yd)':
        result = _yardaDouble;
        break;
      case 'Foot (ft)':
        result = _pieDouble;
        break;
      case 'inch':
        result = _pulgadaDouble;
        break;
      case 'Nautical mile':
        result = _millaNauticaDouble;
        break;
      case 'au':
        result = _udAstronomicaDouble;
        break;
      case 'Light-year':
        result = _anoLuzDouble;
        break;
      default:
        result = 0;
    }
    return result;
  }

  //****************************************Speed */

  static double speed(double _inputValue, String inputUnit, String outputUnit) {
    double _millaPorHoraDouble = 1;
    double _kilometroPorHoraDouble = 1;
    double _piePorSegundoDouble = 1;
    double _metroPorSegundoDouble = 1;
    double _nudoDouble = 1;

    double result = 0;

    switch (inputUnit) {
      case 'mph':
        _millaPorHoraDouble = _inputValue;
        _piePorSegundoDouble = _inputValue * 1.4666666666666665984;
        _metroPorSegundoDouble = _inputValue * 0.44704;
        _kilometroPorHoraDouble = _inputValue * 1.609344;
        _nudoDouble = _inputValue / 1.1507794470293485568;
        break;
      case 'Km/h':
        _millaPorHoraDouble = _inputValue / 1.609344;
        _piePorSegundoDouble = _inputValue / 1.097278;
        _metroPorSegundoDouble = _inputValue / 3.6;
        _kilometroPorHoraDouble = _inputValue;
        _nudoDouble = _inputValue / 1.852;
        break;
      case 'ft/s':
        _millaPorHoraDouble = _inputValue / 1.4666666666666665984;
        _piePorSegundoDouble = _inputValue;
        _metroPorSegundoDouble = _inputValue * 0.3048;
        _kilometroPorHoraDouble = _inputValue * 1.097278;
        _nudoDouble = _inputValue * 0.59248380180776140800;
        break;
      case 'm/s':
        _millaPorHoraDouble = _inputValue / 0.44704;
        _piePorSegundoDouble = _inputValue / 0.3048;
        _metroPorSegundoDouble = _inputValue;
        _kilometroPorHoraDouble = _inputValue * 3.6;
        _nudoDouble = _inputValue / 0.514444444;
        break;
      case 'knots (kn)':
        _millaPorHoraDouble = _inputValue * 1.1507794470293485568;
        _piePorSegundoDouble = _inputValue / 0.59248380180776140800;
        _metroPorSegundoDouble = _inputValue * 0.514444444;
        _kilometroPorHoraDouble = _inputValue * 1.852;
        _nudoDouble = _inputValue;
        break;
      default:
        // set every value on error code 0.10101010101
        _millaPorHoraDouble = 0.10101010101;
        _kilometroPorHoraDouble = 0.10101010101;
        _piePorSegundoDouble = 0.10101010101;
        _metroPorSegundoDouble = 0.10101010101;
        _nudoDouble = 0.10101010101;
    }
    switch (outputUnit) {
      case 'mph':
        result = _millaPorHoraDouble;
        break;
      case 'Km/h':
        result = _kilometroPorHoraDouble;
        break;
      case 'ft/s':
        result = _piePorSegundoDouble;
        break;
      case 'm/s':
        result = _metroPorSegundoDouble;
        break;
      case 'knots (kn)':
        result = _nudoDouble;
        break;

      default:
        result = 0;
    }
    return result;
  }

  //****************************************Volumen */

  static double volumen(
      double _inputValue, String inputUnit, String outputUnit) {
    double _metroCubicoDouble = 1;
    double _litroDouble = 1;
    double _mililitroDouble = 1;
    double _ccDouble = 1;
    double _pulgadaCubicaDouble = 1;
    double _pieCubicoDouble = 1;
    double _eeuuBarrilDouble = 1;
    double _eeuuGalonDouble = 1;
    double _eeuuCuartoDouble = 1;
    double _eeuuPintaDouble = 1;
    double _eeuuTazaDouble = 1;
    double _eeuuCucharadaDouble = 1;
    double _eeuuCucharitaDouble = 1;
    double _eeuuOnzaFluidaDouble = 1;
    double _imperialBarrilDouble = 1;
    double _imperialGalonDouble = 1;
    double _imperialCuartoDouble = 1;
    double _imperialPintaDouble = 1;
    double _imperialTazaDouble = 1;
    double _imperialCucharadaDouble = 1;
    double _imperialCucharitaDouble = 1;
    double _imperialOnzaFluidaDouble = 1;

    double result = 0;

    switch (inputUnit) {
      case 'm³':
        _litroDouble = _inputValue * 1000;
        _metroCubicoDouble = _inputValue;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = _litroDouble / 0.016387064;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = _litroDouble / 158.987294928;
        _eeuuGalonDouble = _eeuuBarrilDouble * 42;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _litroDouble / 159.11315;
        _imperialGalonDouble = _imperialBarrilDouble * 35;
        _imperialCuartoDouble = _imperialGalonDouble * 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;
      case 'Liter (L)':
        _litroDouble = _inputValue;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = _litroDouble / 0.016387064;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = _litroDouble / 158.987294928;
        _eeuuGalonDouble = _eeuuBarrilDouble * 42;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _litroDouble / 159.11315;
        _imperialGalonDouble = _imperialBarrilDouble * 35;
        _imperialCuartoDouble = _imperialGalonDouble * 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;

        break;
      case 'ml':
        _litroDouble = _inputValue / 1000;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _inputValue;
        _pulgadaCubicaDouble = _litroDouble / 0.016387064;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = _litroDouble / 158.987294928;
        _eeuuGalonDouble = _eeuuBarrilDouble * 42;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _litroDouble / 159.11315;
        _imperialGalonDouble = _imperialBarrilDouble * 35;
        _imperialCuartoDouble = _imperialGalonDouble * 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;
      case 'cc':
        _litroDouble = _inputValue / 1000;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _inputValue;
        _pulgadaCubicaDouble = _litroDouble / 0.016387064;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = _litroDouble / 158.987294928;
        _eeuuGalonDouble = _eeuuBarrilDouble * 42;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _litroDouble / 159.11315;
        _imperialGalonDouble = _imperialBarrilDouble * 35;
        _imperialCuartoDouble = _imperialGalonDouble * 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;
      case 'Cubic inch (in³)':
        _litroDouble = _inputValue * 0.016387064;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _inputValue;
        _pulgadaCubicaDouble = _inputValue;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = _litroDouble / 158.987294928;
        _eeuuGalonDouble = _eeuuBarrilDouble * 42;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _litroDouble / 159.11315;
        _imperialGalonDouble = _imperialBarrilDouble * 35;
        _imperialCuartoDouble = _imperialGalonDouble * 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;
      case 'Cubic foot (ft³)':
        _litroDouble = _inputValue * 1728 * 0.016387064;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _inputValue;
        _pulgadaCubicaDouble = _inputValue * 1728;
        _pieCubicoDouble = _inputValue;
        _eeuuBarrilDouble = _litroDouble / 158.987294928;
        _eeuuGalonDouble = _eeuuBarrilDouble * 42;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _litroDouble / 159.11315;
        _imperialGalonDouble = _imperialBarrilDouble * 35;
        _imperialCuartoDouble = _imperialGalonDouble * 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;
      case 'US Barrel':
        _litroDouble = _inputValue * 158.987294928;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = _litroDouble / 0.016387064;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = _inputValue;
        _eeuuGalonDouble = _eeuuBarrilDouble * 42;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _litroDouble / 159.11315;
        _imperialGalonDouble = _imperialBarrilDouble * 35;
        _imperialCuartoDouble = _imperialGalonDouble * 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;
      case 'US Gallon':
        _litroDouble = _inputValue * 3.785411784;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = _inputValue * 231;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = _inputValue / 42;
        _eeuuGalonDouble = _inputValue;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _litroDouble / 159.11315;
        _imperialGalonDouble = _imperialBarrilDouble * 35;
        _imperialCuartoDouble = _imperialGalonDouble * 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;

      case 'US quarts':
        _litroDouble = (_inputValue / 4) * 3.785411784;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = (_inputValue / 4) * 231;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = (_inputValue / 4) / 42;
        _eeuuGalonDouble = _inputValue / 4;
        _eeuuCuartoDouble = _inputValue;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _litroDouble / 159.11315;
        _imperialGalonDouble = _imperialBarrilDouble * 35;
        _imperialCuartoDouble = _imperialGalonDouble * 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;

      case 'US Pint':
        _litroDouble = (_inputValue / 8) * 3.785411784;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = (_inputValue / 8) * 231;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = (_inputValue / 8) / 42;
        _eeuuGalonDouble = _inputValue / 8;
        _eeuuCuartoDouble = _inputValue / 2;
        _eeuuPintaDouble = _inputValue;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _litroDouble / 159.11315;
        _imperialGalonDouble = _imperialBarrilDouble * 35;
        _imperialCuartoDouble = _imperialGalonDouble * 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;

      case 'US Cup':
        _litroDouble = (_inputValue * 236.5) / 1000;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = _litroDouble / 0.016387064;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = _litroDouble / 158.987294928;
        _eeuuGalonDouble = _eeuuBarrilDouble * 42;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _inputValue;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _litroDouble / 159.11315;
        _imperialGalonDouble = _imperialBarrilDouble * 35;
        _imperialCuartoDouble = _imperialGalonDouble * 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;
      case 'US Fluid ozs':
        _litroDouble = (_inputValue / 128) * 3.785411784;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = (_inputValue / 128) * 231;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = (_inputValue / 128) / 42;
        _eeuuGalonDouble = _inputValue / 128;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = (_inputValue / 16);
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _inputValue;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _litroDouble / 159.11315;
        _imperialGalonDouble = _imperialBarrilDouble * 35;
        _imperialCuartoDouble = _imperialGalonDouble * 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;
      case 'US tbsp':
        _litroDouble = (_inputValue / 256) * 3.785411784;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = (_inputValue / 256) * 231;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = (_inputValue / 256) / 42;
        _eeuuGalonDouble = _inputValue / 256;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = (_inputValue / 32);
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _inputValue / 2;
        _eeuuCucharadaDouble = _inputValue;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _litroDouble / 159.11315;
        _imperialGalonDouble = _imperialBarrilDouble * 35;
        _imperialCuartoDouble = _imperialGalonDouble * 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;
      case 'US tsp':
        _litroDouble = (_inputValue / 256) * 3.785411784;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = (_inputValue / 256) * 231;

        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = (_inputValue / 256) / 42;
        _eeuuGalonDouble = _inputValue / 256;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = (_inputValue / 32);
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _inputValue / 6;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _inputValue;
        _imperialBarrilDouble = _litroDouble / 159.11315;
        _imperialGalonDouble = _imperialBarrilDouble * 35;
        _imperialCuartoDouble = _imperialGalonDouble * 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;

      case 'Imperial barrel':
        _litroDouble = _inputValue * 159.11315;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = _litroDouble / 0.016387064;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = _litroDouble / 158.987294928;
        _eeuuGalonDouble = _eeuuBarrilDouble * 42;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _inputValue;
        _imperialGalonDouble = _imperialBarrilDouble * 35;
        _imperialCuartoDouble = _imperialGalonDouble * 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;
      case 'Imperial gallon':
        _litroDouble = (_inputValue / 35) * 159.11315;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = _litroDouble / 0.016387064;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = _litroDouble / 158.987294928;
        _eeuuGalonDouble = _eeuuBarrilDouble * 42;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _inputValue / 35;
        _imperialGalonDouble = _inputValue;
        _imperialCuartoDouble = _imperialGalonDouble * 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;
      case 'Imperial quarts':
        _litroDouble = (_inputValue / 140) * 159.11315;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = _litroDouble / 0.016387064;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = _litroDouble / 158.987294928;
        _eeuuGalonDouble = _eeuuBarrilDouble * 42;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _inputValue / 140;
        _imperialGalonDouble = _inputValue / 4;
        _imperialCuartoDouble = _inputValue;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;
      case 'Imperial pint':
        _litroDouble = (_inputValue / 280) * 159.11315;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = _litroDouble / 0.016387064;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = _litroDouble / 158.987294928;
        _eeuuGalonDouble = _eeuuBarrilDouble * 42;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _inputValue / 280;
        _imperialGalonDouble = _inputValue / 8;
        _imperialCuartoDouble = _imperialGalonDouble / 4;
        _imperialPintaDouble = _inputValue;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;

      case 'Imperial cup':
        _litroDouble = (_inputValue / 560) * 159.11315;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = _litroDouble / 0.016387064;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = _litroDouble / 158.987294928;
        _eeuuGalonDouble = _eeuuBarrilDouble * 42;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _inputValue / 560;
        _imperialGalonDouble = _inputValue / 16;
        _imperialCuartoDouble = _imperialGalonDouble / 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _inputValue;
        _imperialOnzaFluidaDouble = _imperialGalonDouble * 160;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;

      case 'Imperial fluid oz':
        _litroDouble = (_inputValue / 5600) * 159.11315;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = _litroDouble / 0.016387064;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = _litroDouble / 158.987294928;
        _eeuuGalonDouble = _eeuuBarrilDouble * 42;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _inputValue / 5600;
        _imperialGalonDouble = _inputValue / 160;
        _imperialCuartoDouble = _imperialGalonDouble / 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _inputValue;
        _imperialCucharadaDouble = _imperialOnzaFluidaDouble * 1.6;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;

      case 'Imperial tbsp':
        _litroDouble = (_inputValue / 8960) * 159.11315;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = _litroDouble / 0.016387064;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = _litroDouble / 158.987294928;
        _eeuuGalonDouble = _eeuuBarrilDouble * 42;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _inputValue / 8960;
        _imperialGalonDouble = _inputValue / 256;
        _imperialCuartoDouble = _imperialGalonDouble / 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _inputValue / 1.6;
        _imperialCucharadaDouble = _inputValue;
        _imperialCucharitaDouble = _imperialCucharadaDouble * 3;
        break;

      case 'Imperial tsp':
        _litroDouble = (_inputValue / 26880) * 159.11315;
        _metroCubicoDouble = _litroDouble / 1000;
        _mililitroDouble = _litroDouble * 1000;
        _pulgadaCubicaDouble = _litroDouble / 0.016387064;
        _pieCubicoDouble = _pulgadaCubicaDouble / 1728;
        _eeuuBarrilDouble = _litroDouble / 158.987294928;
        _eeuuGalonDouble = _eeuuBarrilDouble * 42;
        _eeuuCuartoDouble = _eeuuGalonDouble * 4;
        _eeuuPintaDouble = _eeuuGalonDouble * 8;
        _eeuuTazaDouble = _mililitroDouble / 236.5;
        _eeuuOnzaFluidaDouble = _eeuuGalonDouble * 128;
        _eeuuCucharadaDouble = _eeuuOnzaFluidaDouble * 2;
        _eeuuCucharitaDouble = _eeuuCucharadaDouble * 3;
        _imperialBarrilDouble = _inputValue / 26880;
        _imperialGalonDouble = _inputValue / 768;
        _imperialCuartoDouble = _imperialGalonDouble / 4;
        _imperialPintaDouble = _imperialGalonDouble * 8;
        _imperialTazaDouble = _imperialGalonDouble * 16;
        _imperialOnzaFluidaDouble = _inputValue / 1.6;
        _imperialCucharadaDouble = _inputValue / 3;
        _imperialCucharitaDouble = _inputValue;
        break;

      default:
        // set every value on error code 0.10101010101
        _metroCubicoDouble = 0.10101010101;
        _litroDouble = 0.10101010101;
        _mililitroDouble = 0.10101010101;
        _ccDouble = 0.10101010101;
        _pulgadaCubicaDouble = 0.10101010101;
        _pieCubicoDouble = 0.10101010101;
        _eeuuBarrilDouble = 0.10101010101;
        _eeuuGalonDouble = 0.10101010101;
        _eeuuCuartoDouble = 0.10101010101;
        _eeuuPintaDouble = 0.10101010101;
        _eeuuTazaDouble = 0.10101010101;
        _eeuuCucharadaDouble = 0.10101010101;
        _eeuuCucharitaDouble = 0.10101010101;
        _eeuuOnzaFluidaDouble = 0.10101010101;
        _imperialBarrilDouble = 0.10101010101;
        _imperialGalonDouble = 0.10101010101;
        _imperialCuartoDouble = 0.10101010101;
        _imperialPintaDouble = 0.10101010101;
        _imperialTazaDouble = 0.10101010101;
        _imperialCucharadaDouble = 0.10101010101;
        _imperialCucharitaDouble = 0.10101010101;
        _imperialOnzaFluidaDouble = 0.10101010101;
    }

    switch (outputUnit) {
      case 'm³':
        result = _metroCubicoDouble;
        break;
      case 'Liter (L)':
        result = _litroDouble;
        break;
      case 'ml':
        result = _mililitroDouble;
        break;
      case 'cc':
        result = _mililitroDouble;
        break;
      case 'Cubic inch (in³)':
        result = _pulgadaCubicaDouble;
        break;
      case 'Cubic foot (ft³)':
        result = _pieCubicoDouble;
        break;
      case 'US Barrel':
        result = _eeuuBarrilDouble;
        break;
      case 'US Gallon':
        result = _eeuuGalonDouble;
        break;
      case 'US quarts':
        result = _eeuuCuartoDouble;
        break;
      case 'US Pint':
        result = _eeuuPintaDouble;
        break;
      case 'US Cup':
        result = _eeuuTazaDouble;
        break;
      case 'US Fluid ozs':
        result = _eeuuOnzaFluidaDouble;
        break;
      case 'US tbsp':
        result = _eeuuCucharadaDouble;
        break;
      case 'US tsp':
        result = _eeuuCucharitaDouble;
        break;
      case 'Imperial barrel':
        result = _imperialBarrilDouble;
        break;
      case 'Imperial gallon':
        result = _imperialGalonDouble;
        break;
      case 'Imperial quarts':
        result = _imperialCuartoDouble;
        break;
      case 'Imperial pint':
        result = _imperialPintaDouble;
        break;
      case 'Imperial cup':
        result = _imperialTazaDouble;
        break;
      case 'Imperial fluid oz':
        result = _imperialOnzaFluidaDouble;
        break;
      case 'Imperial tbsp':
        result = _imperialCucharadaDouble;
        break;
      case 'Imperial tsp':
        result = _imperialCucharitaDouble;
        break;
      default:
        result = 0;
    }
    return result;
  }

  //****************************************Energy */

  static double energy(
      double _inputValue, String inputUnit, String outputUnit) {
    double _julioDouble;
    double _kiloJulioDouble;
    double _btuDouble;
    double _vatioHoraDouble;
    double _kiloVatioHoraDouble;
    double _pieLibraDouble;

    double result = 0;

    switch (inputUnit) {
      case 'joules (J)':
        _julioDouble = _inputValue;
        _kiloJulioDouble = _julioDouble / 1000;
        _vatioHoraDouble = _julioDouble / 3600;
        _kiloVatioHoraDouble = _vatioHoraDouble / 1000;
        _btuDouble = _julioDouble / 1055.06;
        _pieLibraDouble = _julioDouble / 1.3558179483314004;
        break;

      case 'KJ':
        _julioDouble = _inputValue * 1000;
        _kiloJulioDouble = _inputValue;
        _vatioHoraDouble = _julioDouble / 3600;
        _kiloVatioHoraDouble = _vatioHoraDouble / 1000;
        _btuDouble = _julioDouble / 1055.06;
        _pieLibraDouble = _julioDouble / 1.3558179483314004;
        break;

      case 'Wh':
        _julioDouble = _inputValue * 3600;
        _kiloJulioDouble = _julioDouble / 1000;
        _vatioHoraDouble = _inputValue;
        _kiloVatioHoraDouble = _vatioHoraDouble / 1000;
        _btuDouble = _julioDouble / 1055.06;
        _pieLibraDouble = _julioDouble / 1.3558179483314004;
        break;

      case 'KWh':
        _julioDouble = _inputValue * 3600 * 1000;
        _kiloJulioDouble = _julioDouble / 1000;
        _vatioHoraDouble = _julioDouble / 3600;
        _kiloVatioHoraDouble = _inputValue;
        _btuDouble = _julioDouble / 1055.06;
        _pieLibraDouble = _julioDouble / 1.3558179483314004;
        break;

      case 'BTU':
        _julioDouble = _inputValue * 1055.06;
        _kiloJulioDouble = _julioDouble / 1000;
        _vatioHoraDouble = _julioDouble / 3600;
        _kiloVatioHoraDouble = _vatioHoraDouble / 1000;
        _btuDouble = _inputValue;
        _pieLibraDouble = _julioDouble / 1.3558179483314004;
        break;

      case 'Foot-pound':
        _julioDouble = _inputValue * 1.3558179483314004;
        _kiloJulioDouble = _julioDouble / 1000;
        _vatioHoraDouble = _julioDouble / 3600;
        _kiloVatioHoraDouble = _vatioHoraDouble / 1000;
        _btuDouble = _julioDouble / 1055.06;
        _pieLibraDouble = _inputValue;
        break;

      default:
        // set every value on error code 0.10101010101
        _julioDouble = 0.10101010101;
        _kiloJulioDouble = 0.10101010101;
        _vatioHoraDouble = 0.10101010101;
        _kiloVatioHoraDouble = 0.10101010101;
        _btuDouble = 0.10101010101;
        _pieLibraDouble = 0.10101010101;
    }
    switch (outputUnit) {
      case 'joules (J)':
        result = _julioDouble;
        break;
      case 'KJ':
        result = _kiloJulioDouble;
        break;
      case 'Wh':
        result = _vatioHoraDouble;
        break;
      case 'KWh':
        result = _kiloVatioHoraDouble;
        break;
      case 'BTU':
        result = _btuDouble;
        break;
      case 'Foot-pound':
        result = _pieLibraDouble;
        break;
      default:
        result = 0;
    }
    return result;
  }

  //****************************************Angle */

  static double angle(double _inputValue, String inputUnit, String outputUnit) {
    double _radianesDouble;
    double _gradosDouble;
    double _gradianDouble;
    double result = 0;

    switch (inputUnit) {
      case 'Degrees (°)':
        _gradosDouble = _inputValue;
        _radianesDouble = _gradosDouble * (pi / 180);
        _gradianDouble = _gradosDouble * (400 / 360);
        break;

      case 'Radian (rad)':
        _gradosDouble = _inputValue * (180 / pi);
        _radianesDouble = _inputValue;
        _gradianDouble = _gradosDouble * (400 / 360);
        break;

      case 'Gradian (grad)':
        _gradosDouble = _inputValue / (400 / 360);
        _radianesDouble = _gradosDouble * (pi / 180);
        _gradianDouble = _inputValue;
        break;

      default:
        // set every value on error code 0.10101010101
        _radianesDouble = 0.10101010101;
        _gradosDouble = 0.10101010101;
        _gradianDouble = 0.10101010101;
    }
    switch (outputUnit) {
      case 'Degrees (°)':
        result = _gradosDouble;
        break;
      case 'Radian (rad)':
        result = _radianesDouble;
        break;
      case 'Gradian (grad)':
        result = _gradianDouble;
        break;
      default:
        result = 0;
    }
    return result;
  }

  //****************************************Pressure */

  static double pressure(
      double _inputValue, String inputUnit, String outputUnit) {
    double _barDouble = 1;
    double _pascalDouble = 1;
    double _kiloPascalDouble = 1;
    double _megaPascalDouble = 1;
    double _torrDouble = 1;
    double _psiDouble = 1;
    double _atmosferaDouble = 1;
    double _kilogramoPorCentimetroDouble = 1;
    double result = 0;

    switch (inputUnit) {
      case 'bar':
        _barDouble = _inputValue;
        _pascalDouble = _inputValue * 100000;
        _kiloPascalDouble = _pascalDouble / 1000;
        _megaPascalDouble = _pascalDouble / 1000000;
        _torrDouble = _inputValue / 0.001333223684;
        _psiDouble = _inputValue / 0.06894757293;
        _atmosferaDouble = _inputValue / 1.01325;
        _kilogramoPorCentimetroDouble = _inputValue * 1.01971621;
        break;

      case 'Pascal (Pa)':
        _barDouble = _inputValue / 100000;
        _pascalDouble = _inputValue;
        _kiloPascalDouble = _pascalDouble / 1000;
        _megaPascalDouble = _pascalDouble / 1000000;
        _torrDouble = _inputValue / 133.3223684;
        _psiDouble = _inputValue / 6894.76;
        _atmosferaDouble = _inputValue / 101325;
        _kilogramoPorCentimetroDouble = _inputValue * 0.0000101971621;
        break;
      case 'kPa':
        _barDouble = _inputValue / 100;
        _pascalDouble = _inputValue * 1000;
        _kiloPascalDouble = _inputValue;
        _megaPascalDouble = _pascalDouble / 1000000;
        _torrDouble = _inputValue / 0.1333223684;
        _psiDouble = _inputValue / 6.89476;
        _atmosferaDouble = _inputValue / 101.325;
        _kilogramoPorCentimetroDouble = _inputValue * 0.0101971621;
        break;
      case 'MPa':
        _barDouble = _inputValue / 0.1;
        _pascalDouble = _inputValue / 1000000;
        _kiloPascalDouble = _pascalDouble / 1000;
        _megaPascalDouble = _inputValue;
        _torrDouble = _inputValue / 0.0001333223684;
        _psiDouble = _inputValue / 0.00689476;
        _atmosferaDouble = _inputValue / 0.101325;
        _kilogramoPorCentimetroDouble = _inputValue * 10.1971621;
        break;
      case 'Torr':
        _barDouble = _inputValue * 0.001333223684;
        _pascalDouble = _inputValue * 133.3223684;
        _kiloPascalDouble = _pascalDouble / 1000;
        _megaPascalDouble = _pascalDouble / 1000000;
        _torrDouble = _inputValue;
        _psiDouble = _inputValue / 51.714932578410446848;
        _atmosferaDouble = _inputValue / 760;
        _kilogramoPorCentimetroDouble = _inputValue * 0.00135950604;
        break;
      case 'psi':
        _barDouble = _inputValue * 0.06894757293;
        _pascalDouble = _inputValue * 6894.76;
        _kiloPascalDouble = _pascalDouble / 1000;
        _megaPascalDouble = _pascalDouble / 1000000;
        _torrDouble = _inputValue * 51.714932578410446848;
        _psiDouble = _inputValue;
        _atmosferaDouble = _inputValue / 14.695948775872305152;
        _kilogramoPorCentimetroDouble = _inputValue * 0.0703069855;
        break;
      case 'atm':
        _barDouble = _inputValue * 1.01325;
        _pascalDouble = _inputValue * 101325;
        _kiloPascalDouble = _pascalDouble / 1000;
        _megaPascalDouble = _pascalDouble / 1000000;
        _torrDouble = _inputValue * 760;
        _psiDouble = _inputValue * 14.695948775872305152;
        _atmosferaDouble = _inputValue;
        _kilogramoPorCentimetroDouble = _inputValue * 1.03322745;
        break;
      case 'Kg/cm²':
        _barDouble = _inputValue / 1.01971621;
        _pascalDouble = _inputValue / 0.0000101971621;
        _kiloPascalDouble = _pascalDouble / 1000;
        _megaPascalDouble = _pascalDouble / 1000000;
        _torrDouble = _inputValue / 0.00135950604;
        _psiDouble = _inputValue / 0.0703069855;
        _atmosferaDouble = _inputValue / 1.03322745;
        _kilogramoPorCentimetroDouble = _inputValue;
        break;
      default:
        // set every value on error code 0.10101010101
        _barDouble = 0.10101010101;
        _pascalDouble = 0.10101010101;
        _kiloPascalDouble = 0.10101010101;
        _megaPascalDouble = 0.10101010101;
        _torrDouble = 0.10101010101;
        _psiDouble = 0.10101010101;
        _atmosferaDouble = 0.10101010101;
        _kilogramoPorCentimetroDouble = 0.10101010101;
    }
    switch (outputUnit) {
      case 'bar':
        result = _barDouble;
        break;
      case 'Pascal (Pa)':
        result = _pascalDouble;
        break;
      case 'kPa':
        result = _kiloPascalDouble;
        break;
      case 'MPa':
        result = _megaPascalDouble;
        break;
      case 'Torr':
        result = _torrDouble;
        break;
      case 'psi':
        result = _psiDouble;
        break;
      case 'atm':
        result = _atmosferaDouble;
        break;
      case 'Kg/cm²':
        result = _kilogramoPorCentimetroDouble;
        break;
      default:
        result = 0;
    }
    return result;
  }

  //****************************************Radioation */

  static double radiation(
      double _inputValue, String inputUnit, String outputUnit) {
    double _becquerelDouble = 1;
    double _curieDouble = 1;
    double _rutherfordDouble = 1;
    double result = 0;

    switch (inputUnit) {
      case 'Becquerel (Bq)':
        _becquerelDouble = _inputValue;
        _curieDouble = _becquerelDouble / 37000000000;
        _rutherfordDouble = _curieDouble * 37000;
        break;

      case 'Curie (Ci)':
        _becquerelDouble = _inputValue * 37000000000;
        _curieDouble = _inputValue;
        _rutherfordDouble = _curieDouble * 37000;
        break;

      case 'Rutherford (Rd)':
        _becquerelDouble = _inputValue * 1000000;
        _curieDouble = _inputValue / 37000;
        _rutherfordDouble = _inputValue;
        break;

      default:
        // set every value on error code 0.10101010101
        _becquerelDouble = 0.10101010101;
        _curieDouble = 0.10101010101;
        _rutherfordDouble = 0.10101010101;
    }
    switch (outputUnit) {
      case 'Becquerel (Bq)':
        result = _becquerelDouble;
        break;
      case 'Curie (Ci)':
        result = _curieDouble;
        break;
      case 'Rutherford (Rd)':
        result = _rutherfordDouble;
        break;

      default:
        result = 0;
    }
    return result;
  }

  //****************************************Power */

  static double power(double _inputValue, String inputUnit, String outputUnit) {
    double _vatioDouble;
    double _kiloVatioDouble;
    double _megaVatioDouble;
    double _hpDouble;
    double _btuPorSegundoDouble;
    double _btuPorMinutoDouble;
    double _libraPiePorMinDouble;
    double _libraPiePorSegundoDouble;
    double result = 0;

    switch (inputUnit) {
      case 'Watt':
        _vatioDouble = _inputValue;
        _kiloVatioDouble = _vatioDouble / 1000;
        _megaVatioDouble = _vatioDouble / 1000000;
        _hpDouble = _vatioDouble / 745.699871582270;
        _btuPorSegundoDouble = _vatioDouble / 1055.05585262;
        _btuPorMinutoDouble = _btuPorSegundoDouble * 60;
        _libraPiePorMinDouble = _hpDouble * 33000;
        _libraPiePorSegundoDouble = _hpDouble * 550;
        break;

      case 'Kilowatt':
        _vatioDouble = _inputValue * 1000;
        _kiloVatioDouble = _inputValue;
        _megaVatioDouble = _vatioDouble / 1000000;
        _hpDouble = _vatioDouble / 745.699871582270;
        _btuPorSegundoDouble = _vatioDouble / 1055.05585262;
        _btuPorMinutoDouble = _btuPorSegundoDouble * 60;
        _libraPiePorMinDouble = _hpDouble * 33000;
        _libraPiePorSegundoDouble = _hpDouble * 550;
        break;

      case 'Megawatt':
        _vatioDouble = _inputValue * 1000000;
        _kiloVatioDouble = _vatioDouble / 1000;
        _megaVatioDouble = _inputValue;
        _hpDouble = _vatioDouble / 745.699871582270;
        _btuPorSegundoDouble = _vatioDouble / 1055.05585262;
        _btuPorMinutoDouble = _btuPorSegundoDouble * 60;
        _libraPiePorMinDouble = _hpDouble * 33000;
        _libraPiePorSegundoDouble = _hpDouble * 550;
        break;

      case 'HP':
        _vatioDouble = _inputValue * 745.699871582270;
        _kiloVatioDouble = _vatioDouble / 1000;
        _megaVatioDouble = _vatioDouble / 1000000;
        _hpDouble = _inputValue;
        _btuPorSegundoDouble = _vatioDouble / 1055.05585262;
        _btuPorMinutoDouble = _btuPorSegundoDouble * 60;
        _libraPiePorMinDouble = _hpDouble * 33000;
        _libraPiePorSegundoDouble = _hpDouble * 550;
        break;

      case 'BTU/min':
        _vatioDouble = _inputValue * 1055.05585262 * 60;
        _kiloVatioDouble = _vatioDouble / 1000;
        _megaVatioDouble = _vatioDouble / 1000000;
        _hpDouble = _vatioDouble / 745.699871582270;
        _btuPorMinutoDouble = _inputValue;
        _btuPorSegundoDouble = _vatioDouble / 1055.05585262;
        _libraPiePorMinDouble = _hpDouble * 33000;
        _libraPiePorSegundoDouble = _hpDouble * 550;
        break;

      case 'BTU/s':
        _vatioDouble = _inputValue * 1055.05585262;
        _kiloVatioDouble = _vatioDouble / 1000;
        _megaVatioDouble = _vatioDouble / 1000000;
        _hpDouble = _vatioDouble / 745.699871582270;
        _btuPorSegundoDouble = _inputValue;
        _btuPorMinutoDouble = _btuPorSegundoDouble * 60;
        _libraPiePorMinDouble = _hpDouble * 33000;
        _libraPiePorSegundoDouble = _hpDouble * 550;
        break;

      case 'lb-ft/min':
        _vatioDouble = _inputValue * (745.699871582270 / 33000);
        _kiloVatioDouble = _vatioDouble / 1000;
        _megaVatioDouble = _vatioDouble / 1000000;
        _btuPorSegundoDouble = _vatioDouble / 1055.05585262;
        _btuPorMinutoDouble = _btuPorSegundoDouble * 60;
        _libraPiePorMinDouble = _inputValue;
        _hpDouble = _libraPiePorMinDouble / 33000;
        _libraPiePorSegundoDouble = _hpDouble * 550;
        break;

      case 'lb-ft/s':
        _vatioDouble = _inputValue * (745.699871582270 / 550);
        _kiloVatioDouble = _vatioDouble / 1000;
        _megaVatioDouble = _vatioDouble / 1000000;
        _btuPorSegundoDouble = _vatioDouble / 1055.05585262;
        _btuPorMinutoDouble = _btuPorSegundoDouble * 60;
        _libraPiePorSegundoDouble = _inputValue;
        _libraPiePorMinDouble = _libraPiePorSegundoDouble * 60;
        _hpDouble = _libraPiePorMinDouble / 33000;
        break;

      default:
        // set every value on error code 0.10101010101
        _vatioDouble = 0.10101010101;
        _kiloVatioDouble = 0.10101010101;
        _megaVatioDouble = 0.10101010101;
        _btuPorSegundoDouble = 0.10101010101;
        _btuPorMinutoDouble = 0.10101010101;
        _libraPiePorSegundoDouble = 0.10101010101;
        _libraPiePorMinDouble = 0.10101010101;
        _hpDouble = 0.10101010101;
    }
    switch (outputUnit) {
      case 'Watt':
        result = _vatioDouble;
        break;
      case 'Kilowatt':
        result = _kiloVatioDouble;
        break;
      case 'Megawatt':
        result = _megaVatioDouble;
        break;
      case 'HP':
        result = _hpDouble;
        break;
      case 'BTU/min':
        result = _btuPorMinutoDouble;
        break;
      case 'BTU/s':
        result = _btuPorSegundoDouble;
        break;
      case 'lb-ft/min':
        result = _libraPiePorMinDouble;
        break;
      case 'lb-ft/s':
        result = _libraPiePorSegundoDouble;
        break;
      default:
        result = 0;
    }
    return result;
  }

  // ****************************************Force */

  static double force(double _inputValue, String inputUnit, String outputUnit) {
    double _newtonDouble = 1;
    double _dinaDouble = 1;
    double _libraDouble = 1;
    double result = 0;

    switch (inputUnit) {
      case 'Newton':
        _newtonDouble = _inputValue;
        _libraDouble = _newtonDouble / 4.448222;
        _dinaDouble = _newtonDouble * 100000;
        break;

      case 'lbf':
        _newtonDouble = _inputValue * 4.448222;
        _libraDouble = _inputValue;
        _dinaDouble = _newtonDouble * 100000;
        break;

      case 'dyn':
        _newtonDouble = _inputValue / 100000;
        _libraDouble = _newtonDouble / 4.448222;
        _dinaDouble = _inputValue;
        break;

      default:
        // set every value on error code 0.10101010101
        _newtonDouble = 0.10101010101;
        _libraDouble = 0.10101010101;
        _dinaDouble = 0.10101010101;
    }
    switch (outputUnit) {
      case 'Newton':
        result = _newtonDouble;
        break;
      case 'lbf':
        result = _libraDouble;
        break;
      case 'dyn':
        result = _dinaDouble;
        break;
      default:
        result = 0;
    }
    return result;
  }

  //  //****************************************Sound */

  static double sound(double _inputValue, String inputUnit, String outputUnit) {
    double _belldouble;
    double _decibellDouble;
    double _neperDouble;
    double result = 0;

    switch (inputUnit) {
      case 'Bell (B)':
        _belldouble = _inputValue;
        _decibellDouble = _belldouble * 10;
        _neperDouble = _belldouble / 0.86858896;
        break;

      case 'decibel (dB)':
        _belldouble = _inputValue / 10;
        _decibellDouble = _inputValue;
        _neperDouble = _belldouble / 0.86858896;
        break;

      case 'neper (Np)':
        _belldouble = _inputValue * 0.86858896;
        _decibellDouble = _belldouble * 10;
        _neperDouble = _inputValue;
        break;
      default:
        // set every value on error code 0.10101010101
        _belldouble = 0.10101010101;
        _decibellDouble = 0.10101010101;
        _neperDouble = 0.10101010101;
    }
    switch (outputUnit) {
      case 'Bell (B)':
        result = _belldouble;
        break;
      case 'decibel (dB)':
        result = _decibellDouble;
        break;
      case 'neper (Np)':
        result = _neperDouble;
        break;

      default:
        result = 0;
    }
    return result;
  }

  //****************************************Area*/

  static double area(double _inputValue, String inputUnit, String outputUnit) {
    double _kilometroCuadradoDouble = 1;
    double _metroCuadradoDouble = 1;
    double _millaCuadradaDouble = 1;
    double _pieCuadradoDouble = 1;
    double _acreDouble = 1;
    double _pulgadaCuadradaDouble = 1;
    double _hectareaDouble = 1;
    double _yardaCuadradaDouble = 1;
    double result = 0;

    switch (inputUnit) {
      case 'Km²':
        _kilometroCuadradoDouble = _inputValue;
        _hectareaDouble = _kilometroCuadradoDouble * 100;
        _metroCuadradoDouble = _kilometroCuadradoDouble * 1000000;
        _millaCuadradaDouble = _kilometroCuadradoDouble / 2.589988110336;
        _acreDouble = _millaCuadradaDouble * 640;
        _yardaCuadradaDouble = _acreDouble * 4840;
        _pieCuadradoDouble = _yardaCuadradaDouble * 9;
        _pulgadaCuadradaDouble = _pieCuadradoDouble * 144;
        break;
      case 'm²':
        _kilometroCuadradoDouble = _inputValue / 1000000;
        _hectareaDouble = _kilometroCuadradoDouble * 100;
        _metroCuadradoDouble = _inputValue;
        _millaCuadradaDouble = _kilometroCuadradoDouble / 2.589988110336;
        _acreDouble = _millaCuadradaDouble * 640;
        _yardaCuadradaDouble = _acreDouble * 4840;
        _pieCuadradoDouble = _yardaCuadradaDouble * 9;
        _pulgadaCuadradaDouble = _pieCuadradoDouble * 144;
        break;
      case 'Hectare(ha)':
        _kilometroCuadradoDouble = _inputValue / 100;
        _hectareaDouble = _inputValue;
        _metroCuadradoDouble = _kilometroCuadradoDouble * 1000000;
        _millaCuadradaDouble = _kilometroCuadradoDouble / 2.589988110336;
        _acreDouble = _millaCuadradaDouble * 640;
        _yardaCuadradaDouble = _acreDouble * 4840;
        _pieCuadradoDouble = _yardaCuadradaDouble * 9;
        _pulgadaCuadradaDouble = _pieCuadradoDouble * 144;
        break;
      case 'Acre':
        _millaCuadradaDouble = _inputValue / 640;
        _acreDouble = _inputValue;
        _yardaCuadradaDouble = _acreDouble * 4840;
        _pieCuadradoDouble = _yardaCuadradaDouble * 9;
        _pulgadaCuadradaDouble = _pieCuadradoDouble * 144;
        _kilometroCuadradoDouble = _inputValue * (2.589988110336 / 640);
        _hectareaDouble = _kilometroCuadradoDouble * 100;
        _metroCuadradoDouble = _kilometroCuadradoDouble * 1000000;
        break;
      case 'mi²':
        _millaCuadradaDouble = _inputValue;
        _acreDouble = _millaCuadradaDouble * 640;
        _yardaCuadradaDouble = _acreDouble * 4840;
        _pieCuadradoDouble = _yardaCuadradaDouble * 9;
        _pulgadaCuadradaDouble = _pieCuadradoDouble * 144;
        _kilometroCuadradoDouble = _millaCuadradaDouble * 2.589988110336;
        _hectareaDouble = _kilometroCuadradoDouble * 100;
        _metroCuadradoDouble = _kilometroCuadradoDouble * 1000000;
        break;
      case 'yd²':
        _acreDouble = _inputValue / 4840;
        _millaCuadradaDouble = _acreDouble / 640;
        _yardaCuadradaDouble = _inputValue;
        _pieCuadradoDouble = _yardaCuadradaDouble * 9;
        _pulgadaCuadradaDouble = _pieCuadradoDouble * 144;
        _kilometroCuadradoDouble = _acreDouble * (2.589988110336 / 640);
        _hectareaDouble = _kilometroCuadradoDouble * 100;
        _metroCuadradoDouble = _kilometroCuadradoDouble * 1000000;
        break;
      case 'ft²':
        _acreDouble = _inputValue / 43560;
        _millaCuadradaDouble = _acreDouble / 640;
        _yardaCuadradaDouble = _acreDouble * 4840;
        _pieCuadradoDouble = _inputValue;
        _pulgadaCuadradaDouble = _pieCuadradoDouble * 144;
        _kilometroCuadradoDouble = _acreDouble * (2.589988110336 / 640);
        _hectareaDouble = _kilometroCuadradoDouble * 100;
        _metroCuadradoDouble = _kilometroCuadradoDouble * 1000000;
        break;
      case 'in²':
        _acreDouble = _inputValue / 6272640;
        _yardaCuadradaDouble = _inputValue / 1296;
        _millaCuadradaDouble = _acreDouble / 640;
        _pieCuadradoDouble = _inputValue / 144;
        _pulgadaCuadradaDouble = _inputValue;
        _kilometroCuadradoDouble = _acreDouble * (2.589988110336 / 640);
        _hectareaDouble = _kilometroCuadradoDouble * 100;
        _metroCuadradoDouble = _kilometroCuadradoDouble * 1000000;
        break;

      default:
        // set every value on error code 0.10101010101
        _acreDouble = _inputValue / 6272640;
        _yardaCuadradaDouble = _inputValue / 1296;
        _millaCuadradaDouble = _acreDouble / 640;
        _pieCuadradoDouble = _inputValue / 144;
        _pulgadaCuadradaDouble = _inputValue;
        _kilometroCuadradoDouble = _acreDouble * (2.589988110336 / 640);
        _hectareaDouble = _kilometroCuadradoDouble * 100;
        _metroCuadradoDouble = _kilometroCuadradoDouble * 1000000;
    }
    switch (outputUnit) {
      case 'Km²':
        result = _kilometroCuadradoDouble;
        break;
      case 'm²':
        result = _metroCuadradoDouble;
        break;
      case 'Hectare(ha)':
        result = _hectareaDouble;
        break;
      case 'Acre':
        result = _acreDouble;
        break;
      case 'mi²':
        result = _millaCuadradaDouble;
        break;
      case 'yd²':
        result = _yardaCuadradaDouble;
        break;
      case 'ft²':
        result = _pieCuadradoDouble;
        break;
      case 'in²':
        result = _pulgadaCuadradaDouble;
        break;
      default:
        result = 0;
    }
    return result;
  }

  //****************************************Density */

  static double density(
      double _inputValue, String inputUnit, String outputUnit) {
    double _kgm3Double = 1;
    double _gcm3Double = 1;
    double _lbft3Double = 1;
    double _lbin3Double = 1;
    double result = 0;

    switch (inputUnit) {
      case 'Kg/m³':
        _kgm3Double = _inputValue;
        _gcm3Double = _kgm3Double / 1000;
        _lbft3Double = _inputValue * (2.2046226218487757 / 35.31466672148859);
        _lbin3Double = _inputValue * (2.2046226218487757 / 61023.74409473228);
        break;

      case 'g/cm³':
        _kgm3Double = _inputValue * 1000;
        _gcm3Double = _inputValue;
        _lbft3Double = _inputValue * (0.0022046 / 0.00003531466672148859);
        _lbin3Double = _inputValue * (0.0022046 / 0.06102374409473229);
        break;

      case 'lb/ft³':
        _kgm3Double = _inputValue * (0.45359237 / 0.028316846592);
        _gcm3Double = _kgm3Double / 1000;
        _lbft3Double = _inputValue;
        _lbin3Double = _inputValue * (1 / 1728);
        break;

      case 'lb/in³':
        _kgm3Double = _inputValue * (0.45359237 / 0.000016387064);
        _gcm3Double = _kgm3Double / 1000;
        _lbft3Double = _inputValue * 1728;
        _lbin3Double = _inputValue;
        break;

      default:
        // set every value on error code 0.10101010101
        _kgm3Double = 0.10101010101;
        _gcm3Double = 0.10101010101;
        _lbft3Double = 0.10101010101;
        _lbin3Double = 0.10101010101;
    }
    switch (outputUnit) {
      case 'Kg/m³':
        result = _kgm3Double;
        break;
      case 'g/cm³':
        result = _gcm3Double;
        break;
      case 'lb/ft³':
        result = _lbft3Double;
        break;
      case 'lb/in³':
        result = _lbin3Double;
        break;
      default:
        result = 0;
    }
    return result;
  }

  //**************************************** */

  static double fuelConsumption(
      double _inputValue, String inputUnit, String outputUnit) {
    double _kilometroLitroDouble = 1;
    double _litro100kilometrosDouble = 1;
    double _eEUUMillasGalonDouble = 1;
    double _britanicoMillasGalonDouble = 1;
    double result = 0;

    switch (inputUnit) {
      case 'Km/Liter':
        _kilometroLitroDouble = _inputValue;
        _litro100kilometrosDouble = 100 / _kilometroLitroDouble;
        _eEUUMillasGalonDouble =
            _kilometroLitroDouble * (3.785411784 / 1.609344);
        _britanicoMillasGalonDouble =
            _kilometroLitroDouble * (4.54609 / 1.609344);
        break;

      case 'Liter/100Km':
        _kilometroLitroDouble = 100 / _inputValue;
        _litro100kilometrosDouble = _inputValue;
        _eEUUMillasGalonDouble =
            _kilometroLitroDouble * (3.785411784 / 1.609344);
        _britanicoMillasGalonDouble =
            _kilometroLitroDouble * (4.54609 / 1.609344);
        break;

      case 'mi/US gallon':
        _kilometroLitroDouble = _inputValue / (3.785411784 / 1.609344);
        _litro100kilometrosDouble = 100 / _kilometroLitroDouble;
        _eEUUMillasGalonDouble = _inputValue;
        _britanicoMillasGalonDouble =
            _kilometroLitroDouble * (4.54609 / 1.609344);
        break;

      case 'mi/Imperial gal':
        _kilometroLitroDouble = _inputValue / (4.54609 / 1.609344);
        _litro100kilometrosDouble = 100 / _kilometroLitroDouble;
        _eEUUMillasGalonDouble =
            _kilometroLitroDouble * (3.785411784 / 1.609344);
        _britanicoMillasGalonDouble = _inputValue;
        break;

      default:
        // set every value on error code 0.10101010101
        _kilometroLitroDouble = 0.10101010101;
        _litro100kilometrosDouble = 0.10101010101;
        _eEUUMillasGalonDouble = 0.10101010101;
        _britanicoMillasGalonDouble = 0.10101010101;
    }
    switch (outputUnit) {
      case 'Km/Liter':
        result = _kilometroLitroDouble;
        break;
      case 'Liter/100Km':
        result = _litro100kilometrosDouble;
        break;
      case 'mi/US gallon':
        result = _eEUUMillasGalonDouble;
        break;
      case 'mi/Imperial gal':
        result = _britanicoMillasGalonDouble;
        break;
      default:
        result = 0;
    }
    return result;
  }

  //****************************************Time */

  static double time(double _inputValue, String inputUnit, String outputUnit) {
    double _segundoDouble = 1;
    double _minutoDouble = 1;
    double _horaDouble = 1;
    double _diaDouble = 1;
    double _semanaDouble = 1;
    double _mesDouble = 1;
    double _anoDouble = 1;
    double _sigloDouble = 1;
    double _milenioDouble = 1;
    double result = 0;

    switch (inputUnit) {
      case 'Second (s)':
        _segundoDouble = _inputValue;
        _minutoDouble = _inputValue / 60;
        _horaDouble = _inputValue / 3600;
        _diaDouble = _inputValue / 86400;
        _semanaDouble = _inputValue / 604800;
        _mesDouble = _minutoDouble / 43800;
        _anoDouble = _mesDouble / 12;
        _sigloDouble = _anoDouble / 100;
        _milenioDouble = _anoDouble / 1000;

        break;
      case 'Minute':
        _segundoDouble = _inputValue * 60;
        _minutoDouble = _inputValue;
        _horaDouble = _minutoDouble / 60;
        _diaDouble = _horaDouble / 24;
        _semanaDouble = _diaDouble / 7;
        _mesDouble = _minutoDouble / 43800;
        _anoDouble = _mesDouble / 12;
        _sigloDouble = _anoDouble / 100;
        _milenioDouble = _sigloDouble / 10;
        break;
      case 'Hour (hr)':
        _segundoDouble = _inputValue * 3600;
        _minutoDouble = _inputValue * 60;
        _horaDouble = _inputValue;
        _diaDouble = _horaDouble / 24;
        _semanaDouble = _diaDouble / 7;
        _mesDouble = _minutoDouble / 43800;
        _anoDouble = _mesDouble / 12;
        _sigloDouble = _anoDouble / 100;
        _milenioDouble = _sigloDouble / 10;
        break;
      case 'Day':
        _segundoDouble = _inputValue * 86400;
        _minutoDouble = _segundoDouble / 60;
        _horaDouble = _minutoDouble / 60;
        _diaDouble = _inputValue;
        _semanaDouble = _diaDouble / 7;
        _mesDouble = _minutoDouble / 43800;
        _anoDouble = _mesDouble / 12;
        _sigloDouble = _anoDouble / 100;
        _milenioDouble = _sigloDouble / 10;
        break;
      case 'Week':
        _segundoDouble = _inputValue * 604800;
        _minutoDouble = _segundoDouble / 60;
        _horaDouble = _minutoDouble / 60;
        _diaDouble = _inputValue * 7;
        _semanaDouble = _inputValue;
        _mesDouble = _minutoDouble / 43800;
        _anoDouble = _mesDouble / 12;
        _sigloDouble = _anoDouble / 100;
        _milenioDouble = _sigloDouble / 10;
        break;
      case 'Month':
        _segundoDouble = _inputValue * (43800 * 60);
        _minutoDouble = _inputValue * 43800;
        _horaDouble = _minutoDouble / 60;
        _diaDouble = _horaDouble / 24;
        _semanaDouble = _diaDouble / 7;
        _mesDouble = _inputValue;
        _anoDouble = _mesDouble / 12;
        _sigloDouble = _anoDouble / 100;
        _milenioDouble = _sigloDouble / 10;
        break;
      case 'Year':
        _segundoDouble = _inputValue * (525600 * 60);
        _minutoDouble = _inputValue * 525600;
        _horaDouble = _minutoDouble / 60;
        _diaDouble = _horaDouble / 24;
        _semanaDouble = _diaDouble / 7;
        _mesDouble = _inputValue * 12;
        _anoDouble = _inputValue;
        _sigloDouble = _anoDouble / 100;
        _milenioDouble = _sigloDouble / 10;
        break;
      case 'Century':
        _segundoDouble = _inputValue * (52560000 * 60);
        _minutoDouble = _inputValue * 52560000;
        _horaDouble = _minutoDouble * 876000;
        _diaDouble = _horaDouble / 24;
        _semanaDouble = _diaDouble / 7;
        _mesDouble = _inputValue * 100 * 12;
        _anoDouble = _inputValue * 100;
        _sigloDouble = _inputValue;
        _milenioDouble = _sigloDouble / 10;
        break;
      case 'Millennium':
        _segundoDouble = _inputValue * (525600000 * 60);
        _minutoDouble = _inputValue * 525600000;
        _horaDouble = _minutoDouble * 8760000;
        _diaDouble = _horaDouble / 24;
        _semanaDouble = _diaDouble / 7;
        _mesDouble = _inputValue * 1000 * 12;
        _anoDouble = _inputValue * 1000;
        _sigloDouble = _inputValue * 10;
        _milenioDouble = _inputValue;
        break;

      default:
        // set every value on error code 0.10101010101
        _segundoDouble = 0.10101010101;
        _minutoDouble = 0.10101010101;
        _horaDouble = 0.10101010101;
        _diaDouble = 0.10101010101;
        _semanaDouble = 0.10101010101;
        _mesDouble = 0.10101010101;
        _anoDouble = 0.10101010101;
        _sigloDouble = 0.10101010101;
        _milenioDouble = 0.10101010101;
    }
    switch (outputUnit) {
      case 'Second (s)':
        result = _segundoDouble;
        break;
      case 'Minute':
        result = _minutoDouble;
        break;
      case 'Hour (hr)':
        result = _horaDouble;
        break;
      case 'Day':
        result = _diaDouble;
        break;
      case 'Week':
        result = _semanaDouble;
        break;
      case 'Month':
        result = _mesDouble;
        break;
      case 'Year':
        result = _anoDouble;
        break;
      case 'Century':
        result = _sigloDouble;
        break;
      case 'Millennium':
        result = _milenioDouble;
        break;
      default:
        result = 0;
    }
    return result;
  }

  /* static String digitReducer(double number) {
    String numberReduced = "1";
//-----Remove all trailing zeros regardless of length:
    numberReduced =
        number.toString().replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
    print(number);
    return numberReduced;
  }*/
}


  //    //**************************************** */

  // static double fprce(double _inputValue, String inputUnit, String outputUnit) {

  //   double result = 0;

  //   switch (inputUnit) {

  //     default:
  //       // set every value on error code 0.10101010101

  //   }
  //   switch (outputUnit) {
  //     case '':
  //       result = ();
  //       break;
  //     default:
  //       result = 0;
  //   }
  //   return result;
  // }

