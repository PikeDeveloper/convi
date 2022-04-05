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

class AStepByStep extends StatelessWidget {
  const AStepByStep({Key key}) : super(key: key);

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
    double _b_ = trigonometryProvider.legB;
    double _c_ = trigonometryProvider.legC;
    double _b2_ = 1;
    double _c2_ = 1;
    double _c2MenosB2_ = 1;
    double _a_ = 1;
    _b2_ = deci(pow(_b_, 2), _decimals);
    _c2_ = deci(pow(_c_, 2), _decimals);
    _c2MenosB2_ = deci(_c2_ - _b2_, _decimals);
    _a_ = deci(sqrt(_c2MenosB2_), _decimals);
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
                    StyledText("a: "),
                    StyledText(_a_.toString()),
                  ],
                ),
              ),
              if (trigonometryProvider.showStepByStep) ...[
                Formula(
                    r'\textcolor{gray}{a = '
                    r' \sqrt {c ^2 - b^2 } }',
                    _ecuationSize),
                Formula(
                    r'\textcolor{gray}{a = '
                            r' \sqrt {' +
                        _c_.toString() +
                        ' ^2 - ' +
                        _b_.toString() +
                        '^2 } }',
                    _ecuationSize),
                Formula(
                    r'\textcolor{gray}{a = '
                            r' \sqrt {' +
                        _c2_.toString() +
                        ' - ' +
                        _b2_.toString() +
                        ' } }',
                    _ecuationSize),
                Formula(
                    r'\textcolor{gray}{a = '
                            r' \sqrt {' +
                        _c2MenosB2_.toString() +
                        ' } }',
                    _ecuationSize),
                Formula(
                    r'\textcolor{gray}{a = '
                            r' ' +
                        _a_.toString() +
                        ' }',
                    _ecuationSize)
              ]
            ],
          ),
        ]));
  }
}
