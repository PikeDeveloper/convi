import 'dart:math';

import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/fomul.dart';
import 'package:calculadorafisica/widgets_y_utilits/utilitis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CStepByStep extends StatelessWidget {
  const CStepByStep({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    double _ecuationSize = 12;
    int _decimals = 2;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
            ],
          ),
        ]));
  }
}
