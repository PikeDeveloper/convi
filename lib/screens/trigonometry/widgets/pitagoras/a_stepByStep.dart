import 'dart:math';

import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/fomul.dart';
import 'package:calculadorafisica/widgets_y_utilits/utilitis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AStepByStep extends StatelessWidget {
  const AStepByStep({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    double _ecuationSize = 12;
    int _decimals = 2;
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
    // trigonometryProvider.hipotenusa = _c_;

    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
            ],
          ),
        ]));
  }
}
