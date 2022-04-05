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

class BetaStepByStepNoRectangle extends StatelessWidget {
  BetaStepByStepNoRectangle({Key key}) : super(key: key);
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

    if (trigonometryProvider.inputs.contains(' b:') &&
        trigonometryProvider.inputs.contains(' alpha:') &&
        trigonometryProvider.inputs.contains(' a:')) {
      return _option_1(context, trigonometryProvider.sideB,
          trigonometryProvider.alpha, trigonometryProvider.sideA, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" b:") &&
        trigonometryProvider.inputs.contains(' gamma:') &&
        trigonometryProvider.inputs.contains(" c:")) {
      return _option_2(context, trigonometryProvider.sideB,
          trigonometryProvider.gamma, trigonometryProvider.sideC, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" a:") &&
        trigonometryProvider.inputs.contains(" c:") &&
        trigonometryProvider.inputs.contains(' b:')) {
      return _option_3(context, trigonometryProvider.sideA,
          trigonometryProvider.sideC, trigonometryProvider.sideB, _fontSize);
    }

    return WarningText(
        "to calculate beta it is necessary:\n\noption 1:  b, alpha, a\n\noption 2:  b, gamma, c\n\noption 3:  a, b, c");
  }

  Widget _option_1(BuildContext context, double _b, double _alpha, double _a,
      double _fontSize) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);

    //
    double _alpha_r = (_alpha * pi) / 180; // convert to radians
    //
    double _sinAlpha = deci(sin(_alpha_r), angleDdecimals);
    double _bXsinAlpha = deci(_b * _sinAlpha, decimals);
    double _bXsinAlphaDivA = deci(_bXsinAlpha / _a, decimals);
    double _csc_bXsinAlphaDivA =
        deci((asin(_bXsinAlphaDivA)) * (180 / pi), decimals);
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Result(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText("beta: "),
              StyledText(_csc_bXsinAlphaDivA.toString()),
              StyledText("°"),
            ],
          ),
        ),
        if (trigonometryProvider.showStepByStep) ...[
          Formula(
              r'\textcolor{gray}{β = sin^{-1}( \frac{b*sin(alpha)' +
                  '  } {a' +
                  '})}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{β = sin^{-1}( \frac{' +
                  _b.toString() +
                  '*sin(' +
                  _alpha.toString() +
                  ')' +
                  '  } {' +
                  _a.toString() +
                  '' +
                  '})}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{β = sin^{-1}( \frac{' +
                  _b.toString() +
                  '*' +
                  _sinAlpha.toString() +
                  '' +
                  '  } {' +
                  _a.toString() +
                  '' +
                  '})}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{β = sin^{-1}( \frac{' +
                  _bXsinAlpha.toString() +
                  '' +
                  '  } {' +
                  _a.toString() +
                  '' +
                  '})}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{β = sin^{-1}( ' +
                  _bXsinAlphaDivA.toString() +
                  ') }',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{β =  ' +
                  _csc_bXsinAlphaDivA.toString() +
                  '° }',
              _fontSize),
        ]
      ],
    );
  }

  Widget _option_2(BuildContext context, double _b, double _gamma, double _c,
      double _fontSize) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);

    //
    double _gamma_r = (_gamma * pi) / 180; // convert to radians
    //
    double _sinGamma = deci(sin(_gamma_r), angleDdecimals);
    double _bXsinGamma = deci(_b * _sinGamma, decimals);
    double _bXsinGammaDivC = deci(_bXsinGamma / _c, decimals);
    double _csc_bXsinGammaDivC =
        deci((asin(_bXsinGammaDivC)) * (180 / pi), decimals);
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Result(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText("beta: "),
              StyledText(_csc_bXsinGammaDivC.toString()),
              StyledText("°"),
            ],
          ),
        ),
        if (trigonometryProvider.showStepByStep) ...[
          Formula(
              r'\textcolor{gray}{β = sin^{-1}( \frac{b*sin(gamma)' +
                  '  } {c' +
                  '})}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{β = sin^{-1}( \frac{' +
                  _b.toString() +
                  '*sin(' +
                  _gamma.toString() +
                  ')' +
                  '  } {' +
                  _c.toString() +
                  '' +
                  '})}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{β = sin^{-1}( \frac{' +
                  _b.toString() +
                  '*' +
                  _sinGamma.toString() +
                  '' +
                  '  } {' +
                  _c.toString() +
                  '' +
                  '})}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{β = sin^{-1}( \frac{' +
                  _bXsinGamma.toString() +
                  '' +
                  '  } {' +
                  _c.toString() +
                  '' +
                  '})}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{β = sin^{-1}( ' +
                  _bXsinGammaDivC.toString() +
                  ') }',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{β =  ' +
                  _csc_bXsinGammaDivC.toString() +
                  '° }',
              _fontSize),
        ]
      ],
    );
  }

  Widget _option_3(
      BuildContext context, double _a, double _c, double _b, double _fontSize) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);

    //
    double _a2 = deci(_a * _a, decimals);
    double _b2 = deci(_b * _b, decimals);
    double _c2 = deci(_c * _c, decimals);

    double _a2PlusC2MinusB2 = deci(_a2 + _c2 - _b2, decimals);

    double _2XaXc = deci(2 * _a * _c, decimals);

    double _a2PlusC2MinusB2Div_2XaXc =
        deci(_a2PlusC2MinusB2 / _2XaXc, angleDdecimals);

    double _beta = deci(acos(_a2PlusC2MinusB2Div_2XaXc) * (180 / pi), decimals);

    //
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Result(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText("beta: "),
              StyledText(_beta.toString()),
              StyledText("°"),
            ],
          ),
        ),
        if (trigonometryProvider.showStepByStep) ...[
          Formula(
              r'\textcolor{gray}{β = cos^{-1}(  \frac{ '
              r' a^2+c^2-'
              ' b^2 } {2 * a* c} )}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{β = cos^{-1}(  \frac{ '
                      r' ' +
                  _a.toString() +
                  '^2+' +
                  _c.toString() +
                  '^2-' ' ' +
                  _b.toString() +
                  '^2 } {2 * ' +
                  _a.toString() +
                  '* ' +
                  _c.toString() +
                  '} )}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{β = cos^{-1}(  \frac{ '
                      r' ' +
                  _a2.toString() +
                  '+' +
                  _c2.toString() +
                  '-' ' ' +
                  _b2.toString() +
                  ' } {2 * ' +
                  _a.toString() +
                  '* ' +
                  _c.toString() +
                  '} )}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{β = cos^{-1}(  \frac{ '
                      r' ' +
                  _a2.toString() +
                  '+' +
                  _c2.toString() +
                  '-' ' ' +
                  _b2.toString() +
                  ' } { ' +
                  _2XaXc.toString() +
                  '} )}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{β = cos^{-1}(  \frac{ '
                      r' ' +
                  _a2PlusC2MinusB2.toString() +
                  ' } { ' +
                  _2XaXc.toString() +
                  '} )}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{β = cos^{-1}(  '
                      ' ' +
                  _a2PlusC2MinusB2Div_2XaXc.toString() +
                  ' )}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{β =  '
                      ' ' +
                  _beta.toString() +
                  '° }',
              _fontSize),
        ]
      ],
    );
  }
}
