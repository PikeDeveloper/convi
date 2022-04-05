import 'dart:math';

import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/screens/trigonometry/widgets/result.dart';
import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:calculadorafisica/widgets_y_utilits/fomul.dart';
import 'package:calculadorafisica/widgets_y_utilits/styled_text.dart';
import 'package:calculadorafisica/widgets_y_utilits/utilitis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../main.dart';

class BStepByStep extends StatelessWidget {
  const BStepByStep({Key key}) : super(key: key);

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
    double _c_ = trigonometryProvider.legC;
    double _a2_ = 1;
    double _c2_ = 1;
    double _c2MenosA2_ = 1;
    double _b_ = 1;
    _a2_ = deci(pow(_a_, 2), _decimals);
    _c2_ = deci(pow(_c_, 2), _decimals);
    _c2MenosA2_ = deci(_c2_ - _a2_, _decimals);
    _b_ = deci(sqrt(_c2MenosA2_), _decimals);
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
                    StyledText("b: "),
                    StyledText(_b_.toString()),
                  ],
                ),
              ),
              if (trigonometryProvider.showStepByStep) ...[
                Formula(
                    r'\textcolor{gray}{b = '
                    r' \sqrt {c ^2 - a^2 } }',
                    _ecuationSize),
                Formula(
                    r'\textcolor{gray}{b = '
                            r' \sqrt {' +
                        _c_.toString() +
                        ' ^2 - ' +
                        _a_.toString() +
                        '^2 } }',
                    _ecuationSize),
                Formula(
                    r'\textcolor{gray}{b = '
                            r' \sqrt {' +
                        _c2_.toString() +
                        ' - ' +
                        _a2_.toString() +
                        ' } }',
                    _ecuationSize),
                Formula(
                    r'\textcolor{gray}{b = '
                            r' \sqrt {' +
                        _c2MenosA2_.toString() +
                        ' } }',
                    _ecuationSize),
                Formula(
                    r'\textcolor{gray}{b = '
                            r' ' +
                        _b_.toString() +
                        ' }',
                    _ecuationSize)
              ]
            ],
          ),
        ]));
  }
}
