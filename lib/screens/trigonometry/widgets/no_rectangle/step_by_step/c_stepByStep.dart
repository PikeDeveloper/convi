import 'dart:math';
import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:calculadorafisica/widgets_y_utilits/fomul.dart';
import 'package:calculadorafisica/widgets_y_utilits/styled_text.dart';
import 'package:calculadorafisica/widgets_y_utilits/utilitis.dart';
import 'package:calculadorafisica/widgets_y_utilits/warning_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../main.dart';
import '../../ecuation_separator.dart';
import '../../result.dart';

class CStepByStepNoRectangle extends StatelessWidget {
  CStepByStepNoRectangle({Key key}) : super(key: key);
  int decimals = prefs.decimals;
  int angleDdecimals = prefs.angleDecimals;

  @override
  Widget build(BuildContext context) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    final screenSize = MediaQuery.of(context).size;

    final _fontSize = screenSize.width > 700
        ? Constants.fontsizeEcuationBig
        : screenSize.width < 400
            ? Constants.fontsizeEcuationSmall
            : Constants.fontsizeEcuation;

    if (trigonometryProvider.inputs.contains(' a:') &&
        trigonometryProvider.inputs.contains(' gamma:') &&
        trigonometryProvider.inputs.contains(' alpha:')) {
      return _option_1(context, trigonometryProvider.sideA,
          trigonometryProvider.gamma, trigonometryProvider.alpha, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" b:") &&
        trigonometryProvider.inputs.contains(' gamma:') &&
        trigonometryProvider.inputs.contains(" beta:")) {
      return _option_2(context, trigonometryProvider.sideB,
          trigonometryProvider.gamma, trigonometryProvider.beta, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" a:") &&
        trigonometryProvider.inputs.contains(" b:") &&
        trigonometryProvider.inputs.contains(' gamma:')) {
      return _option_3(context, trigonometryProvider.sideA,
          trigonometryProvider.sideB, trigonometryProvider.gamma, _fontSize);
    }

    return WarningText(
        "to calculate c it is necessary:\n\noption 1:  a, gamma, alpha\n\noption 2:  b, gamma, beta\n\noption 3:  a, b, gamma");
  }

  Widget _option_1(BuildContext context, double _a, double _gamma,
      double _alpha, double _fontSize) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);

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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Result(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText("c: "),
              StyledText(_aXsinGammaDivSinAlpha.toString()),
            ],
          ),
        ),
        if (trigonometryProvider.showStepByStep) ...[
          Formula(
              r'\textcolor{gray}{c = \frac{a*sin(gamma)' +
                  '  } {sin(alpha)' +
                  '}}',
              _fontSize),
          EcuationSeparator(),
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
        ]
      ],
    );
  }

  Widget _option_2(BuildContext context, double _b, double _gamma, double _beta,
      double _fontSize) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);

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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Result(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText("c: "),
              StyledText(_bXsinGammaDivSinBeta.toString()),
            ],
          ),
        ),
        if (trigonometryProvider.showStepByStep) ...[
          Formula(
              r'\textcolor{gray}{c = \frac{b*sin(gamma)' +
                  '  } {sin(beta)' +
                  '}}',
              _fontSize),
          EcuationSeparator(),
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
        ]
      ],
    );
  }

  Widget _option_3(BuildContext context, double _a, double _b, double _gamma,
      double _fontSize) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);

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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Result(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText("c: "),
              StyledText(_sideC.toString()),
            ],
          ),
        ),
        if (trigonometryProvider.showStepByStep) ...[
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
        ]
      ],
    );
  }
}
