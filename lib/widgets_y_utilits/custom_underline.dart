import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:flutter/material.dart';

class CustomUnderline extends StatelessWidget {
  CustomUnderline({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
        color: MyColors.blue9B,
        width: screenSize.width > 700
            ? Constants.bigWidthTextFieldWnputValue
            : screenSize.width < 400
                ? Constants.smallWidthTextFieldInputValue
                : Constants.widthTextFieldInputValue,
        height: 2);
  }
}
