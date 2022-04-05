import 'dart:math';
import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:calculadorafisica/widgets_y_utilits/fomul.dart';
import 'package:calculadorafisica/widgets_y_utilits/styled_text.dart';
import 'package:calculadorafisica/widgets_y_utilits/utilitis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../main.dart';
import '../result.dart';

class CStepByStep extends StatelessWidget {
  const CStepByStep({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    double _ecuationSize = screenSize.width > 700
        ? Constants.fontsizeEcuationBig
        : screenSize.width < 400
            ? Constants.fontsizeEcuationSmall
            : Constants.fontsizeEcuation;
    int _decimals = prefs.decimals;
    double _a_ = trigonometryProvider.legA;
    double _b_ = trigonometryProvider.legB;
    double _b2_ = 1;
    double _a2_ = 1;
    double _a2MasB2_ = 1;
    double _c_ = 1;
    _b2_ = deci(pow(_b_, 2), _decimals);
    _a2_ = deci(pow(_a_, 2), _decimals);
    _a2MasB2_ = deci(_a2_ + _b2_, _decimals);
    _c_ = deci(sqrt(_a2MasB2_), _decimals);
    // trigonometryProvider.hipotenusa = _c_;

    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Result(
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyledText("c: "),
                    StyledText(_c_.toString()),
                  ],
                ),
              ),
              if (trigonometryProvider.showStepByStep) ...[
                Formula(
                    r'\textcolor{gray}{c = '
                            r' \sqrt {' +
                        _a_.toString() +
                        ' ^2 + ' +
                        _b_.toString() +
                        '^2 } }',
                    _ecuationSize),
                Formula(
                    r'\textcolor{gray}{c = '
                            r' \sqrt {' +
                        _a2_.toString() +
                        ' + ' +
                        _b2_.toString() +
                        ' } }',
                    _ecuationSize),
                Formula(
                    r'\textcolor{gray}{c = '
                            r' \sqrt {' +
                        _a2MasB2_.toString() +
                        ' } }',
                    _ecuationSize),
                Formula(
                    r'\textcolor{gray}{c = '
                            r' ' +
                        _c_.toString() +
                        ' }',
                    _ecuationSize)
              ]
            ],
          ),
        ]));
  }
}
