import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

final TextStyle dropDownMenuStyle = TextStyle(
  color: MyColors.grayAD,
  fontSize: Constants.globalFontSize,
);

double deci(num cantidad, int decimals) {
  if (decimals == null) {
    decimals = 2;
  }
  return double.parse((cantidad).toStringAsFixed(decimals));
}
