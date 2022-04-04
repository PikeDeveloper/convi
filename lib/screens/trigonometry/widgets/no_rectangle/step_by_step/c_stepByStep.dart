import 'dart:math';
import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:calculadorafisica/widgets_y_utilits/fomul.dart';
import 'package:calculadorafisica/widgets_y_utilits/styled_text.dart';
import 'package:calculadorafisica/widgets_y_utilits/utilitis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ecuation_separator.dart';

class CStepByStepNoRectangle extends StatelessWidget {
  const CStepByStepNoRectangle({Key key}) : super(key: key);
  final int decimals = 2;
  final int angleDdecimals = 4;

  @override
  Widget build(BuildContext context) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    final screenSize = MediaQuery.of(context).size;

    final _fontSize = screenSize.width > 700
        ? Constants.globalBigFontSize
        : screenSize.width < 400
            ? Constants.globalSmallFontSize
            : Constants.globalFontSize;

    if (trigonometryProvider.inputs.contains(' a:') &&
        trigonometryProvider.inputs.contains(' γ:') &&
        trigonometryProvider.inputs.contains(' al:')) {
      return _option_1(trigonometryProvider.sideA, trigonometryProvider.gamma,
          trigonometryProvider.alpha, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" b:") &&
        trigonometryProvider.inputs.contains(' γ:') &&
        trigonometryProvider.inputs.contains(" be:")) {
      return _option_2(trigonometryProvider.sideB, trigonometryProvider.gamma,
          trigonometryProvider.beta, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" a:") &&
        trigonometryProvider.inputs.contains(" b:") &&
        trigonometryProvider.inputs.contains(' γ:')) {
      return _option_3(trigonometryProvider.sideA, trigonometryProvider.sideB,
          trigonometryProvider.gamma, _fontSize);
    }

    return StyledText("No solution");
  }

  Widget _option_1(double _a, double _gamma, double _alpha, double _fontSize) {
    //
    double gamma_r = (_gamma * pi) / 180; // convert to radians
    double alpha_r = (_alpha * pi) / 180; // convert to radians
    //
    double _sinAlfa = deci(sin(alpha_r), angleDdecimals);
    double _sinGamma = deci(sin(gamma_r), angleDdecimals);
    double _aXsinGamma = deci(_a * _sinGamma, decimals);
    double _aXsinGammaDivSinAlpha = deci(_aXsinGamma / _sinAlfa, decimals);
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Formula(
            r'\textcolor{gray}{c = \frac{' +
                _a.toString() +
                '*sin(' +
                _gamma.toString() +
                ')' +
                '  } {sin(' +
                _alpha.toString() +
                ')' +
                '}}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{c = \frac{' +
                _a.toString() +
                '*' +
                _sinGamma.toString() +
                '' +
                '  } {' +
                _sinAlfa.toString() +
                '' +
                '}}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{c = \frac{' +
                _aXsinGamma.toString() +
                '' +
                '  } {' +
                _sinAlfa.toString() +
                '' +
                '}}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{c = ' +
                _aXsinGammaDivSinAlpha.toString() +
                '' +
                ' }',
            _fontSize),
      ],
    );
  }

  Widget _option_2(double _b, double _gamma, double _beta, double _fontSize) {
    //
    double beta_r = (_beta * pi) / 180; // convert to radians
    double gamma_r = (_gamma * pi) / 180; // convert to radians
    //
    double _sinBeta = deci(sin(beta_r), angleDdecimals);
    double _sinGamma = deci(sin(gamma_r), angleDdecimals);
    double _bXsinGamma = deci(_b * _sinGamma, decimals);
    double _bXsinGammaDivSinBeta = deci(_bXsinGamma / _sinBeta, decimals);
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Formula(
            r'\textcolor{gray}{c = \frac{' +
                _b.toString() +
                '*sin(' +
                _gamma.toString() +
                ')' +
                '  } {sin(' +
                _beta.toString() +
                ')' +
                '}}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{c = \frac{' +
                _b.toString() +
                '*' +
                _sinGamma.toString() +
                '' +
                '  } {' +
                _sinBeta.toString() +
                '' +
                '}}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{c = \frac{' +
                _bXsinGamma.toString() +
                '' +
                '  } {' +
                _sinBeta.toString() +
                '' +
                '}}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{c = ' +
                _bXsinGammaDivSinBeta.toString() +
                '' +
                ' }',
            _fontSize),
      ],
    );
  }

  Widget _option_3(double _a, double _b, double _gamma, double _fontSize) {
    //
    double _gamma_r = (_gamma * pi) / 180; // convert to radians
    double _a2 = deci(_a * _a, decimals);
    double _b2 = deci(_b * _b, decimals);
    double _cosGamma = deci(cos(_gamma_r), angleDdecimals);
    double _a2PlusB2 = deci(_a2 + _b2, decimals);
    double _twoXaXbXcosGamma = deci(2 * _a * _b * _cosGamma, decimals);
    double _a2PlusB2MenusTwoXaXbXcosGamma =
        deci(_a2PlusB2 - _twoXaXbXcosGamma, decimals);
    double _sideC = deci(sqrt(_a2PlusB2MenusTwoXaXbXcosGamma), decimals);

    if (_a2PlusB2MenusTwoXaXbXcosGamma < 0) {
      return StyledText("No solution");
    }
    //
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Formula(
            r'\textcolor{gray}{c = '
            r' \sqrt {a^2+b^2 -2*a*b*cos(γ)} }',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{c = '
                    r' \sqrt {(' +
                _a.toString() +
                ')^2+(' +
                _b.toString() +
                ')^2 - 2*' +
                _a.toString() +
                ' *' +
                _b.toString() +
                '*cos(' +
                _gamma.toString() +
                ')} }',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{c = '
                    r' \sqrt {(' +
                _a.toString() +
                ')^2+(' +
                _b.toString() +
                ')^2 - 2*' +
                _a.toString() +
                ' *' +
                _b.toString() +
                '*' +
                _cosGamma.toString() +
                '} }',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{c = '
                    r' \sqrt {' +
                _a2.toString() +
                '+' +
                _b2.toString() +
                ' - 2*' +
                _a.toString() +
                ' *' +
                _b.toString() +
                '*' +
                _cosGamma.toString() +
                '} }',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{c = '
                    r' \sqrt {' +
                _a2.toString() +
                '+' +
                _b2.toString() +
                ' - ' +
                _twoXaXbXcosGamma.toString() +
                ' } }',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{c = '
                    r' \sqrt {' +
                _a2PlusB2MenusTwoXaXbXcosGamma.toString() +
                ' } }',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{c = '
                    r' ' +
                _sideC.toString() +
                '  }',
            _fontSize),
      ],
    );
  }
}
