import 'dart:math';
import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:calculadorafisica/widgets_y_utilits/fomul.dart';
import 'package:calculadorafisica/widgets_y_utilits/styled_text.dart';
import 'package:calculadorafisica/widgets_y_utilits/utilitis.dart';
import 'package:calculadorafisica/widgets_y_utilits/warning_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ecuation_separator.dart';
import '../../result.dart';

class AlphaStepByStepNoRectangle extends StatelessWidget {
  AlphaStepByStepNoRectangle({Key key}) : super(key: key);
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
        trigonometryProvider.inputs.contains(' b:')) {
      return _option_1(context, trigonometryProvider.sideA,
          trigonometryProvider.beta, trigonometryProvider.sideB, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" a:") &&
        trigonometryProvider.inputs.contains(' gamma:') &&
        trigonometryProvider.inputs.contains(" c:")) {
      return _option_2(context, trigonometryProvider.sideA,
          trigonometryProvider.gamma, trigonometryProvider.sideC, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" b:") &&
        trigonometryProvider.inputs.contains(" c:") &&
        trigonometryProvider.inputs.contains(' a:')) {
      return _option_3(context, trigonometryProvider.sideB,
          trigonometryProvider.sideC, trigonometryProvider.sideA, _fontSize);
    }

    return WarningText(
        "to calculate alpha it is necessary:\n\noption 1: a, beta, b\n\noption 2: a, gamma, c\n\noption 3: a, b, c");
  }

  Widget _option_1(BuildContext context, double _a, double _beta, double _b,
      double _fontSize) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);

    //

    double _beta_r = (_beta * pi) / 180; // convert to radians
    //
    double _sinBeta = deci(sin(_beta_r), angleDdecimals);
    double _aXsinBeta = deci(_a * _sinBeta, decimals);
    double _aXsinBetaDivB = deci(_aXsinBeta / _b, decimals);
    double _csc_aXsinBetaDivB =
        deci((asin(_aXsinBetaDivB)) * (180 / pi), decimals);
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Result(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText("alpha: "),
              StyledText(_csc_aXsinBetaDivB.toString()),
              StyledText("°"),
            ],
          ),
        ),
        if (trigonometryProvider.showStepByStep) ...[
          Formula(
              r'\textcolor{gray}{alpha = sin^{-1}( \frac{a*sin(beta)' +
                  '  } {b' +
                  '})}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{alpha = sin^{-1}( \frac{' +
                  _a.toString() +
                  '*sin(' +
                  _beta.toString() +
                  ')' +
                  '  } {' +
                  _b.toString() +
                  '' +
                  '})}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{alpha = sin^{-1}( \frac{' +
                  _a.toString() +
                  '*' +
                  _sinBeta.toString() +
                  '' +
                  '  } {' +
                  _b.toString() +
                  '' +
                  '})}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{alpha = sin^{-1}( \frac{' +
                  _aXsinBeta.toString() +
                  '' +
                  '  } {' +
                  _b.toString() +
                  '' +
                  '})}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{alpha = sin^{-1}( ' +
                  _aXsinBetaDivB.toString() +
                  ') }',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{alpha =  ' +
                  _csc_aXsinBetaDivB.toString() +
                  '° }',
              _fontSize),
        ]
      ],
    );
  }

  Widget _option_2(BuildContext context, double _a, double _gamma, double _c,
      double _fontSize) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);

    //

    double _gamma_r = (_gamma * pi) / 180; // convert to radians
    //
    double _sinGamma = deci(sin(_gamma_r), angleDdecimals);
    double _aXsinGamma = deci(_a * _sinGamma, decimals);
    double _aXsinGammaDivC = deci(_aXsinGamma / _c, decimals);
    double _csc_aXsinGammaDivc =
        deci((asin(_aXsinGammaDivC)) * (180 / pi), decimals);
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Result(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText("alpha: "),
              StyledText(_csc_aXsinGammaDivc.toString()),
              StyledText("°"),
            ],
          ),
        ),
        if (trigonometryProvider.showStepByStep) ...[
          Formula(
              r'\textcolor{gray}{alpha = sin^{-1}( \frac{a*sin(gamma)' +
                  '  } {c' +
                  '})}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{alpha = sin^{-1}( \frac{' +
                  _a.toString() +
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
              r'\textcolor{gray}{alpha = sin^{-1}( \frac{' +
                  _a.toString() +
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
              r'\textcolor{gray}{alpha = sin^{-1}( \frac{' +
                  _aXsinGamma.toString() +
                  '' +
                  '  } {' +
                  _c.toString() +
                  '' +
                  '})}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{alpha = sin^{-1}( ' +
                  _aXsinGammaDivC.toString() +
                  ') }',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{alpha =  ' +
                  _csc_aXsinGammaDivc.toString() +
                  '° }',
              _fontSize),
        ]
      ],
    );
  }

  Widget _option_3(
      BuildContext context, double _b, double _c, double _a, double _fontSize) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);

    //

    double _a2 = deci(_a * _a, decimals);
    double _b2 = deci(_b * _b, decimals);
    double _c2 = deci(_c * _c, decimals);

    double _b2PlusC2MinusA2 = deci(_b2 + _c2 - _a2, decimals);

    double _2XbXc = deci(2 * _b * _c, decimals);

    double _b2PlusC2MinusA2Div_2XbXc =
        deci(_b2PlusC2MinusA2 / _2XbXc, angleDdecimals);

    double _alpha =
        deci(acos(_b2PlusC2MinusA2Div_2XbXc) * (180 / pi), decimals);

    //
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Result(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText("alpha: "),
              StyledText(_alpha.toString()),
              StyledText("°"),
            ],
          ),
        ),
        if (trigonometryProvider.showStepByStep) ...[
          Formula(
              r'\textcolor{gray}{alpha =cos^{-1}(  \frac{ '
              r' b^2+c^2-'
              ' a^2 } {2 * b* c} )}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{alpha =cos^{-1}(  \frac{ '
                      r' ' +
                  _b.toString() +
                  '^2+' +
                  _c.toString() +
                  '^2-' ' ' +
                  _a.toString() +
                  '^2 } {2 * ' +
                  _b.toString() +
                  '* ' +
                  _c.toString() +
                  '} )}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{alpha =cos^{-1}(  \frac{ '
                      r' ' +
                  _b2.toString() +
                  '+' +
                  _c2.toString() +
                  '-' ' ' +
                  _a2.toString() +
                  ' } {2 * ' +
                  _b.toString() +
                  '* ' +
                  _c.toString() +
                  '} )}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{alpha =cos^{-1}(  \frac{ '
                      r' ' +
                  _b2.toString() +
                  '+' +
                  _c2.toString() +
                  '-' ' ' +
                  _a2.toString() +
                  ' } { ' +
                  _2XbXc.toString() +
                  '} )}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{alpha =cos^{-1}(  \frac{ '
                      r' ' +
                  _b2PlusC2MinusA2.toString() +
                  ' } { ' +
                  _2XbXc.toString() +
                  '} )}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{alpha =cos^{-1}(  '
                      ' ' +
                  _b2PlusC2MinusA2Div_2XbXc.toString() +
                  ' )}',
              _fontSize),
          EcuationSeparator(),
          Formula(
              r'\textcolor{gray}{alpha = '
                      ' ' +
                  _alpha.toString() +
                  '° }',
              _fontSize),
        ]
      ],
    );
  }
}
