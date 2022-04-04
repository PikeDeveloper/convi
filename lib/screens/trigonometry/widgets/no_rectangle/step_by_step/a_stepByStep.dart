import 'dart:math';
import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:calculadorafisica/widgets_y_utilits/fomul.dart';
import 'package:calculadorafisica/widgets_y_utilits/styled_text.dart';
import 'package:calculadorafisica/widgets_y_utilits/utilitis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ecuation_separator.dart';

class AStepByStepNoRectangle extends StatelessWidget {
  const AStepByStepNoRectangle({Key key}) : super(key: key);
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

    if (trigonometryProvider.inputs.contains(' b:') &&
        trigonometryProvider.inputs.contains(' al:') &&
        trigonometryProvider.inputs.contains(' be:')) {
      return _option_1(trigonometryProvider.sideB, trigonometryProvider.alpha,
          trigonometryProvider.beta, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" c:") &&
        trigonometryProvider.inputs.contains(' al:') &&
        trigonometryProvider.inputs.contains(" γ:")) {
      return _option_2(trigonometryProvider.sideC, trigonometryProvider.alpha,
          trigonometryProvider.gamma, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" b:") &&
        trigonometryProvider.inputs.contains(" c:") &&
        trigonometryProvider.inputs.contains(' al:')) {
      return _option_3(trigonometryProvider.sideB, trigonometryProvider.sideC,
          trigonometryProvider.alpha, _fontSize);
    }

    return StyledText("No solution");
  }

  Widget _option_1(double _b, double _alpha, double _beta, double _fontSize) {
    //
    // double b = deci(_b, decimals); // trim last decimals
    double alpha_r = (_alpha * pi) / 180; // convert to radians
    double beta_r = (_beta * pi) / 180; // convert to radians
    //
    double _sinAlfa = deci(sin(alpha_r), angleDdecimals);
    double _sinBeta = deci(sin(beta_r), angleDdecimals);
    double _bXsinAlpha = deci(_b * _sinAlfa, decimals);
    double _bXsinAlphaDivSinBeta = deci(_bXsinAlpha / _sinBeta, decimals);
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Formula(
            r'\textcolor{gray}{a = \frac{' +
                _b.toString() +
                '*sin(' +
                _alpha.toString() +
                ')' +
                '  } {sin(' +
                _beta.toString() +
                ')' +
                '}}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{a = \frac{' +
                _b.toString() +
                '*' +
                _sinAlfa.toString() +
                '' +
                '  } {' +
                _sinBeta.toString() +
                '' +
                '}}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{a = \frac{' +
                _bXsinAlpha.toString() +
                '' +
                '  } {' +
                _sinBeta.toString() +
                '' +
                '}}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{a = ' +
                _bXsinAlphaDivSinBeta.toString() +
                '' +
                ' }',
            _fontSize),
      ],
    );
  }

  Widget _option_2(double _c, double _alpha, double _gamma, double _fontSize) {
    //
    // double c = deci(_c, decimals); // trim last decimals
    double alpha_r = (_alpha * pi) / 180; // convert to radians
    double gamma_r = (_gamma * pi) / 180; // convert to radians
    //
    double _sinAlfa = deci(sin(alpha_r), angleDdecimals);
    double _sinGamma = deci(sin(gamma_r), angleDdecimals);
    double _cXsinAlpha = deci(_c * _sinAlfa, decimals);
    double _cXsinAlphaDivSinGamma = deci(_cXsinAlpha / _sinGamma, decimals);
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Formula(
            r'\textcolor{gray}{a = \frac{' +
                _c.toString() +
                '*sin(' +
                _alpha.toString() +
                ')' +
                '  } {sin(' +
                _gamma.toString() +
                ')' +
                '}}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{a = \frac{' +
                _c.toString() +
                '*' +
                _sinAlfa.toString() +
                '' +
                '  } {' +
                _sinGamma.toString() +
                '' +
                '}}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{a = \frac{' +
                _cXsinAlpha.toString() +
                '' +
                '  } {' +
                _sinGamma.toString() +
                '' +
                '}}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{a = ' +
                _cXsinAlphaDivSinGamma.toString() +
                '' +
                ' }',
            _fontSize),
      ],
    );
  }

  Widget _option_3(double _b, double _c, double _alpha, double _fontSize) {
    //
    // double b = deci(_b, decimals); // trim last decimals
    // double c = deci(_c, decimals); // trim last decimals
    double alpha_r = (_alpha * pi) / 180; // convert to radians

    double _b2 = deci(_b * _b, decimals);
    double _c2 = deci(_c * _c, decimals);
    double _cosAlpha = deci(cos(alpha_r), angleDdecimals);
    double _b2PlusC2 = deci(_b2 + _c2, decimals);
    double _twoXbXcXcosAlpha = deci(2 * _b * _c * _cosAlpha, decimals);
    double _b2PlusC2MenusTwoXbXcXcosAlpha =
        deci(_b2PlusC2 - _twoXbXcXcosAlpha, decimals);
    double _sideA = deci(sqrt(_b2PlusC2MenusTwoXbXcXcosAlpha), decimals);

    if (_b2PlusC2MenusTwoXbXcXcosAlpha < 0) {
      return StyledText("No solution");
    }

    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Formula(
            r'\textcolor{gray}{a = '
            r' \sqrt {b^2+c^2 -2*b*c*cos(α)} }',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{a = '
                    r' \sqrt {(' +
                _b.toString() +
                ')^2+(' +
                _c.toString() +
                ')^2 - 2*' +
                _b.toString() +
                ' *' +
                _c.toString() +
                '*cos(' +
                _alpha.toString() +
                ')} }',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{a = '
                    r' \sqrt {(' +
                _b.toString() +
                ')^2+(' +
                _c.toString() +
                ')^2 - 2*' +
                _b.toString() +
                ' *' +
                _c.toString() +
                '*' +
                _cosAlpha.toString() +
                '} }',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{a = '
                    r' \sqrt {' +
                _b2.toString() +
                '+' +
                _c2.toString() +
                ' - 2*' +
                _b.toString() +
                ' *' +
                _c.toString() +
                '*' +
                _cosAlpha.toString() +
                '} }',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{a = '
                    r' \sqrt {' +
                _b2.toString() +
                '+' +
                _c2.toString() +
                ' - ' +
                _twoXbXcXcosAlpha.toString() +
                ' } }',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{a = '
                    r' \sqrt {' +
                _b2PlusC2MenusTwoXbXcXcosAlpha.toString() +
                ' } }',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{a = '
                    r' ' +
                _sideA.toString() +
                '  }',
            _fontSize),
      ],
    );
  }
}
