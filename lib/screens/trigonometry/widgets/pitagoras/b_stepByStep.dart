import 'dart:math';

import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/fomul.dart';
import 'package:calculadorafisica/widgets_y_utilits/utilitis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BStepByStep extends StatelessWidget {
  const BStepByStep({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    double _ecuationSize = 12;
    int _decimals = 2;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
            ],
          ),
        ]));
  }
}
