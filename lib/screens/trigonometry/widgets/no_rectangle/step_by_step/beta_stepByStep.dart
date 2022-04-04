import 'dart:math';
import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:calculadorafisica/widgets_y_utilits/fomul.dart';
import 'package:calculadorafisica/widgets_y_utilits/styled_text.dart';
import 'package:calculadorafisica/widgets_y_utilits/utilitis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ecuation_separator.dart';

class BetaStepByStepNoRectangle extends StatelessWidget {
  const BetaStepByStepNoRectangle({Key key}) : super(key: key);
  final int decimals = 4;
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
        trigonometryProvider.inputs.contains(' a:')) {
      return _option_1(trigonometryProvider.sideB, trigonometryProvider.alpha,
          trigonometryProvider.sideA, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" b:") &&
        trigonometryProvider.inputs.contains(' γ:') &&
        trigonometryProvider.inputs.contains(" c:")) {
      return _option_2(trigonometryProvider.sideB, trigonometryProvider.gamma,
          trigonometryProvider.sideC, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" a:") &&
        trigonometryProvider.inputs.contains(" c:") &&
        trigonometryProvider.inputs.contains(' b:')) {
      return _option_3(trigonometryProvider.sideA, trigonometryProvider.sideC,
          trigonometryProvider.sideB, _fontSize);
    }

    return StyledText("No solution");
  }

  Widget _option_1(double _b, double _alpha, double _a, double _fontSize) {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            r'\textcolor{gray}{β =  ' + _csc_bXsinAlphaDivA.toString() + '° }',
            _fontSize),
      ],
    );
  }

  Widget _option_2(double _b, double _gamma, double _c, double _fontSize) {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            r'\textcolor{gray}{β =  ' + _csc_bXsinGammaDivC.toString() + '° }',
            _fontSize),
      ],
    );
  }

  Widget _option_3(double _a, double _c, double _b, double _fontSize) {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}
