import 'dart:math';
import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:calculadorafisica/widgets_y_utilits/fomul.dart';
import 'package:calculadorafisica/widgets_y_utilits/styled_text.dart';
import 'package:calculadorafisica/widgets_y_utilits/utilitis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ecuation_separator.dart';

class AlphaStepByStepNoRectangle extends StatelessWidget {
  const AlphaStepByStepNoRectangle({Key key}) : super(key: key);
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

    if (trigonometryProvider.inputs.contains(' a:') &&
        trigonometryProvider.inputs.contains(' be:') &&
        trigonometryProvider.inputs.contains(' b:')) {
      return _option_1(trigonometryProvider.sideA, trigonometryProvider.beta,
          trigonometryProvider.sideB, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" a:") &&
        trigonometryProvider.inputs.contains(' γ:') &&
        trigonometryProvider.inputs.contains(" c:")) {
      return _option_2(trigonometryProvider.sideA, trigonometryProvider.gamma,
          trigonometryProvider.sideC, _fontSize);
    }
    if (trigonometryProvider.inputs.contains(" b:") &&
        trigonometryProvider.inputs.contains(" c:") &&
        trigonometryProvider.inputs.contains(' a:')) {
      return _option_3(trigonometryProvider.sideB, trigonometryProvider.sideC,
          trigonometryProvider.sideA, _fontSize);
    }

    return StyledText("No solution");
  }

  Widget _option_1(double _a, double _beta, double _b, double _fontSize) {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Formula(
            r'\textcolor{gray}{α = sin^{-1}( \frac{' +
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
            r'\textcolor{gray}{α = sin^{-1}( \frac{' +
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
            r'\textcolor{gray}{α = sin^{-1}( \frac{' +
                _aXsinBeta.toString() +
                '' +
                '  } {' +
                _b.toString() +
                '' +
                '})}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{α = sin^{-1}( ' +
                _aXsinBetaDivB.toString() +
                ') }',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{α =  ' + _csc_aXsinBetaDivB.toString() + '° }',
            _fontSize),
      ],
    );
  }

  Widget _option_2(double _a, double _gamma, double _c, double _fontSize) {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Formula(
            r'\textcolor{gray}{α = sin^{-1}( \frac{' +
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
            r'\textcolor{gray}{α = sin^{-1}( \frac{' +
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
            r'\textcolor{gray}{α = sin^{-1}( \frac{' +
                _aXsinGamma.toString() +
                '' +
                '  } {' +
                _c.toString() +
                '' +
                '})}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{α = sin^{-1}( ' +
                _aXsinGammaDivC.toString() +
                ') }',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{α =  ' + _csc_aXsinGammaDivc.toString() + '° }',
            _fontSize),
      ],
    );
  }

  Widget _option_3(double _b, double _c, double _a, double _fontSize) {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Formula(
            r'\textcolor{gray}{α= cos^{-1}(  \frac{ '
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
            r'\textcolor{gray}{α= cos^{-1}(  \frac{ '
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
            r'\textcolor{gray}{α= cos^{-1}(  \frac{ '
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
            r'\textcolor{gray}{α= cos^{-1}(  \frac{ '
                    r' ' +
                _b2PlusC2MinusA2.toString() +
                ' } { ' +
                _2XbXc.toString() +
                '} )}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{α= cos^{-1}(  '
                    ' ' +
                _b2PlusC2MinusA2Div_2XbXc.toString() +
                ' )}',
            _fontSize),
        EcuationSeparator(),
        Formula(
            r'\textcolor{gray}{α=  '
                    ' ' +
                _alpha.toString() +
                '° }',
            _fontSize),
      ],
    );
  }
}
