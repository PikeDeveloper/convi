import 'dart:math';
import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/screens/trigonometry/widgets/result.dart';
import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:calculadorafisica/widgets_y_utilits/fomul.dart';
import 'package:calculadorafisica/widgets_y_utilits/styled_text.dart';
import 'package:calculadorafisica/widgets_y_utilits/utilitis.dart';
import 'package:calculadorafisica/widgets_y_utilits/warning_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ecuation_separator.dart';

class AStepByStepNoRectangle extends StatelessWidget {
  AStepByStepNoRectangle({Key key}) : super(key: key);
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

    if (trigonometryProvider.inputs.contains(' b:') &&
        trigonometryProvider.inputs.contains(' alpha:') &&
        trigonometryProvider.inputs.contains(' beta:')) {
      return _option_1(context, trigonometryProvider.sideB,
          trigonometryProvider.alpha, trigonometryProvider.beta, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" c:") &&
        trigonometryProvider.inputs.contains(' alpha:') &&
        trigonometryProvider.inputs.contains(' gamma:')) {
      return _option_2(context, trigonometryProvider.sideC,
          trigonometryProvider.alpha, trigonometryProvider.gamma, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" b:") &&
        trigonometryProvider.inputs.contains(" c:") &&
        trigonometryProvider.inputs.contains(' alpha:')) {
      return _option_3(context, trigonometryProvider.sideB,
          trigonometryProvider.sideC, trigonometryProvider.alpha, _fontSize);
    }

    return WarningText(
        "to calculate a it is necessary:\n\noption 1: b, alpha, beta\n\noption 2: c, alpha, gamma\n\noption 3: b, c, alpha");
  }

  Widget _option_1(BuildContext context, double _b, double _alpha, double _beta,
      double _fontSize) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    //
    double alpha_r = (_alpha * pi) / 180; // convert to radians
    double beta_r = (_beta * pi) / 180; // convert to radians
    //
    double _sinAlfa = deci(sin(alpha_r), angleDdecimals);
    double _sinBeta = deci(sin(beta_r), angleDdecimals);
    double _bXsinAlpha = deci(_b * _sinAlfa, decimals);
    double _bXsinAlphaDivSinBeta = deci(_bXsinAlpha / _sinBeta, decimals);
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Result(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText("a: "),
              StyledText(_bXsinAlphaDivSinBeta.toString()),
            ],
          ),
        ),
        if (trigonometryProvider.showStepByStep) ...[
          Formula(
              r'\textcolor{gray}{a = \frac{b*sin (alpha)' +
                  '  } {sin (beta)' +
                  '}}',
              _fontSize),
          EcuationSeparator(),
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
        ]
      ],
    );
  }

  Widget _option_2(BuildContext context, double _c, double _alpha,
      double _gamma, double _fontSize) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);

    //

    double alpha_r = (_alpha * pi) / 180; // convert to radians
    double gamma_r = (_gamma * pi) / 180; // convert to radians
    //
    double _sinAlfa = deci(sin(alpha_r), angleDdecimals);
    double _sinGamma = deci(sin(gamma_r), angleDdecimals);
    double _cXsinAlpha = deci(_c * _sinAlfa, decimals);
    double _cXsinAlphaDivSinGamma = deci(_cXsinAlpha / _sinGamma, decimals);
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Result(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText("a: "),
              StyledText(_cXsinAlphaDivSinGamma.toString()),
            ],
          ),
        ),
        if (trigonometryProvider.showStepByStep) ...[
          Formula(
              r'\textcolor{gray}{a = \frac{c*sin(alpha)' +
                  '  } {sin(gamma)' +
                  '}}',
              _fontSize),
          EcuationSeparator(),
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
        ]
      ],
    );
  }

  Widget _option_3(BuildContext context, double _b, double _c, double _alpha,
      double _fontSize) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);

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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // AnswerSelecterNoRectable(),
        Result(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText("a: "),
              StyledText(_sideA.toString()),
            ],
          ),
        ),
        if (trigonometryProvider.showStepByStep) ...[
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
        ]
      ],
    );
  }
}
