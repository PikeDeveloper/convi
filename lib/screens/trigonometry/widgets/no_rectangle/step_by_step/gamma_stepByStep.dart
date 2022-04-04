import 'dart:math';
import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:calculadorafisica/widgets_y_utilits/fomul.dart';
import 'package:calculadorafisica/widgets_y_utilits/styled_text.dart';
import 'package:calculadorafisica/widgets_y_utilits/utilitis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ecuation_separator.dart';

class GammaStepByStepNoRectangle extends StatelessWidget {
  const GammaStepByStepNoRectangle({Key key}) : super(key: key);
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

    if (trigonometryProvider.inputs.contains(' c:') &&
        trigonometryProvider.inputs.contains(' al:') &&
        trigonometryProvider.inputs.contains(' a:')) {
      return _option_1(trigonometryProvider.sideC, trigonometryProvider.alpha,
          trigonometryProvider.sideA, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" c:") &&
        trigonometryProvider.inputs.contains(' be:') &&
        trigonometryProvider.inputs.contains(" b:")) {
      return _option_2(trigonometryProvider.sideC, trigonometryProvider.beta,
          trigonometryProvider.sideB, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" a:") &&
        trigonometryProvider.inputs.contains(" b:") &&
        trigonometryProvider.inputs.contains(' c:')) {
      return _option_3(trigonometryProvider.sideA, trigonometryProvider.sideB,
          trigonometryProvider.sideC, _fontSize);
    }

    return StyledText("No solution");
  }

  Widget _option_1(double _c, double _alpha, double _a, double _fontSize) {
    //
    double _alpha_r = (_alpha * pi) / 180; // convert to radians
    //
    double _sinAlpha = deci(sin(_alpha_r), angleDdecimals);
    double _cXsinAlpha = deci(_c * _sinAlpha, decimals);
    double _cXsinAlphaDivA = deci(_cXsinAlpha / _a, decimals);
    double _csc_cXsinAlphaDivA =
        deci((asin(_cXsinAlphaDivA)) * (180 / pi), decimals);
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Formula(
            r'\textcolor{gray}{γ = sin^{-1}( \frac{' +
                _c.toString() +
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
            r'\textcolor{gray}{γ = sin^{-1}( \frac{' +
                _c.toString() +
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
            r'\textcolor{gray}{γ = sin^{-1}( \frac{' +
                _cXsinAlpha.toString() +
                '' +
                '  } {' +
                _a.toString() +
                '' +
                '})}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{γ = sin^{-1}( ' +
                _cXsinAlphaDivA.toString() +
                ') }',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{γ =  ' + _csc_cXsinAlphaDivA.toString() + '° }',
            _fontSize),
      ],
    );
  }

  Widget _option_2(double _c, double _beta, double _b, double _fontSize) {
    //
    double _beta_r = (_beta * pi) / 180; // convert to radians
    //
    double _sinBeta = deci(sin(_beta_r), angleDdecimals);
    double _cXsinBeta = deci(_c * _sinBeta, decimals);
    double _cXsinBetaDivB = deci(_cXsinBeta / _b, decimals);
    double _csc_cXsinBetaDivB =
        deci((asin(_cXsinBetaDivB)) * (180 / pi), decimals);
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Formula(
            r'\textcolor{gray}{γ = sin^{-1}( \frac{' +
                _c.toString() +
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
            r'\textcolor{gray}{γ = sin^{-1}( \frac{' +
                _c.toString() +
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
            r'\textcolor{gray}{γ = sin^{-1}( \frac{' +
                _cXsinBeta.toString() +
                '' +
                '  } {' +
                _b.toString() +
                '' +
                '})}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{γ = sin^{-1}( ' +
                _cXsinBetaDivB.toString() +
                ') }',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{γ =  ' + _csc_cXsinBetaDivB.toString() + '° }',
            _fontSize),
      ],
    );
  }

  Widget _option_3(double _a, double _b, double _c, double _fontSize) {
    //
    double _a2 = deci(_a * _a, decimals);
    double _b2 = deci(_b * _b, decimals);
    double _c2 = deci(_c * _c, decimals);

    double _a2PlusB2MinusC2 = deci(_a2 + _b2 - _c2, decimals);
    double _2XaXb = deci(2 * _a * _b, decimals);
    double _a2PlusB2MinusC2Div_2XaXb =
        deci(_a2PlusB2MinusC2 / _2XaXb, angleDdecimals);

    double _gamma =
        deci(acos(_a2PlusB2MinusC2Div_2XaXb) * (180 / pi), decimals);

    //
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Formula(
            r'\textcolor{gray}{γ = cos^{-1}(  \frac{ '
                    r' ' +
                _a.toString() +
                '^2+' +
                _b.toString() +
                '^2-' ' ' +
                _c.toString() +
                '^2 } {2 * ' +
                _a.toString() +
                '* ' +
                _b.toString() +
                '} )}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{γ = cos^{-1}(  \frac{ '
                    r' ' +
                _a2.toString() +
                '+' +
                _b2.toString() +
                '-' ' ' +
                _c2.toString() +
                ' } {2 * ' +
                _a.toString() +
                '* ' +
                _b.toString() +
                '} )}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{γ = cos^{-1}(  \frac{ '
                    r' ' +
                _a2.toString() +
                '+' +
                _b2.toString() +
                '-' ' ' +
                _c2.toString() +
                ' } { ' +
                _2XaXb.toString() +
                '} )}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{γ = cos^{-1}(  \frac{ '
                    r' ' +
                _a2PlusB2MinusC2.toString() +
                ' } { ' +
                _2XaXb.toString() +
                '} )}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{γ = cos^{-1}(  '
                    ' ' +
                _a2PlusB2MinusC2Div_2XaXb.toString() +
                ' )}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{γ =  '
                    ' ' +
                _gamma.toString() +
                '° }',
            _fontSize),
      ],
    );
  }
}
