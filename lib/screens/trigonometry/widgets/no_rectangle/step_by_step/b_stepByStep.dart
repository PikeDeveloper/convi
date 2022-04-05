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

class BStepByStepNoRectangle extends StatelessWidget {
  BStepByStepNoRectangle({Key key}) : super(key: key);
  int decimals = Constants.decimals;
  int angleDdecimals = Constants.angleDecimals;

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
        trigonometryProvider.inputs.contains(' beta:') &&
        trigonometryProvider.inputs.contains(' alpha:')) {
      return _option_1(context, trigonometryProvider.sideA,
          trigonometryProvider.beta, trigonometryProvider.alpha, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" c:") &&
        trigonometryProvider.inputs.contains(' beta:') &&
        trigonometryProvider.inputs.contains(' gamma:')) {
      return _option_2(context, trigonometryProvider.sideC,
          trigonometryProvider.beta, trigonometryProvider.gamma, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" a:") &&
        trigonometryProvider.inputs.contains(" c:") &&
        trigonometryProvider.inputs.contains(' beta:')) {
      return _option_3(context, trigonometryProvider.sideA,
          trigonometryProvider.sideC, trigonometryProvider.beta, _fontSize);
    }

    return WarningText(
        "to calculate b it is necessary:\n\noption 1:  a, beta, alpha\n\noption 2:  c, beta, gamma\n\noption 3:  a, c, beta");
  }

  Widget _option_1(BuildContext context, double _a, double _beta, double _alpha,
      double _fontSize) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);

    //
    double alpha_r = (_alpha * pi) / 180; // convert to radians
    double beta_r = (_beta * pi) / 180; // convert to radians
    //
    double _sinAlfa = deci(sin(alpha_r), angleDdecimals);
    double _sinBeta = deci(sin(beta_r), angleDdecimals);
    double _aXsinBeta = deci(_a * _sinBeta, decimals);
    double _aXsinBetaDivSinAlpha = deci(_aXsinBeta / _sinAlfa, decimals);
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Result(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText("b: "),
              StyledText(_aXsinBetaDivSinAlpha.toString()),
            ],
          ),
        ),
        if (trigonometryProvider.showStepByStep) ...[
          Formula(
              r'\textcolor{gray}{b = \frac{a*sin(beta)' +
                  '  } {sin(alpha)' +
                  '}}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{b = \frac{' +
                  _a.toString() +
                  '*sin(' +
                  _beta.toString() +
                  ')' +
                  '  } {sin(' +
                  _alpha.toString() +
                  ')' +
                  '}}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{b = \frac{' +
                  _a.toString() +
                  '*' +
                  _sinBeta.toString() +
                  '' +
                  '  } {' +
                  _sinAlfa.toString() +
                  '' +
                  '}}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{b = \frac{' +
                  _aXsinBeta.toString() +
                  '' +
                  '  } {' +
                  _sinAlfa.toString() +
                  '' +
                  '}}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{b = ' +
                  _aXsinBetaDivSinAlpha.toString() +
                  '' +
                  ' }',
              _fontSize),
        ]
      ],
    );
  }

  Widget _option_2(BuildContext context, double _c, double _beta, double _gamma,
      double _fontSize) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);

    //
    double beta_r = (_beta * pi) / 180; // convert to radians
    double gamma_r = (_gamma * pi) / 180; // convert to radians
    //
    double _sinBeta = deci(sin(beta_r), angleDdecimals);
    double _sinGamma = deci(sin(gamma_r), angleDdecimals);
    double _cXsinBeta = deci(_c * _sinBeta, decimals);
    double _cXsinBetaDivSinGamma = deci(_cXsinBeta / _sinGamma, decimals);
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Result(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText("b: "),
              StyledText(_cXsinBetaDivSinGamma.toString()),
            ],
          ),
        ),
        if (trigonometryProvider.showStepByStep) ...[
          Formula(
              r'\textcolor{gray}{b = \frac{c*sin(beta)' +
                  '  } {sin(gamma)' +
                  '}}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{b = \frac{' +
                  _c.toString() +
                  '*sin(' +
                  _beta.toString() +
                  ')' +
                  '  } {sin(' +
                  _gamma.toString() +
                  ')' +
                  '}}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{b = \frac{' +
                  _c.toString() +
                  '*' +
                  _sinBeta.toString() +
                  '' +
                  '  } {' +
                  _sinGamma.toString() +
                  '' +
                  '}}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{b = \frac{' +
                  _cXsinBeta.toString() +
                  '' +
                  '  } {' +
                  _sinGamma.toString() +
                  '' +
                  '}}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{b = ' +
                  _cXsinBetaDivSinGamma.toString() +
                  '' +
                  ' }',
              _fontSize),
        ]
      ],
    );
  }

  Widget _option_3(BuildContext context, double _a, double _c, double _beta,
      double _fontSize) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);

    //
    double _beta_r = (_beta * pi) / 180; // convert to radians

    double _a2 = deci(_a * _a, decimals);
    double _c2 = deci(_c * _c, decimals);
    double _cosABeta = deci(cos(_beta_r), angleDdecimals);
    double _a2PlusC2 = deci(_a2 + _c2, decimals);
    double _twoXaXcXcosBeta = deci(2 * _a * _c * _cosABeta, decimals);
    double _a2PlusC2MenusTwoXaXcXcosBeta =
        deci(_a2PlusC2 - _twoXaXcXcosBeta, decimals);
    double _sideB = deci(sqrt(_a2PlusC2MenusTwoXaXcXcosBeta), decimals);

    if (_a2PlusC2MenusTwoXaXcXcosBeta < 0) {
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
              StyledText("b: "),
              StyledText(_sideB.toString()),
            ],
          ),
        ),
        if (trigonometryProvider.showStepByStep) ...[
          Formula(
              r'\textcolor{gray}{b = '
              r' \sqrt {a^2+c^2 -2*a*c*cos(β)} }',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{b = '
                      r' \sqrt {(' +
                  _a.toString() +
                  ')^2+(' +
                  _c.toString() +
                  ')^2 - 2*' +
                  _a.toString() +
                  ' *' +
                  _c.toString() +
                  '*cos(' +
                  _beta.toString() +
                  ')} }',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{b = '
                      r' \sqrt {(' +
                  _a.toString() +
                  ')^2+(' +
                  _c.toString() +
                  ')^2 - 2*' +
                  _a.toString() +
                  ' *' +
                  _c.toString() +
                  '*' +
                  _cosABeta.toString() +
                  '} }',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{b = '
                      r' \sqrt {' +
                  _a2.toString() +
                  '+' +
                  _c2.toString() +
                  ' - 2*' +
                  _a.toString() +
                  ' *' +
                  _c.toString() +
                  '*' +
                  _cosABeta.toString() +
                  '} }',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{b = '
                      r' \sqrt {' +
                  _a2.toString() +
                  '+' +
                  _c2.toString() +
                  ' - ' +
                  _twoXaXcXcosBeta.toString() +
                  ' } }',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{b = '
                      r' \sqrt {' +
                  _a2PlusC2MenusTwoXaXcXcosBeta.toString() +
                  ' } }',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{b = '
                      r' ' +
                  _sideB.toString() +
                  '  }',
              _fontSize),
        ]
      ],
    );
  }
}
