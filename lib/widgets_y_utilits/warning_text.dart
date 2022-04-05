import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class WarningText extends StatelessWidget {
  WarningText(this.text, {Key key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Text(
      text,
      style: TextStyle(
        color: MyColors.grayAD,
        fontSize: screenSize.width > 700
            ? Constants.globalBigFontSize
            : screenSize.width < 400
                ? Constants.globalSmallFontSize
                : Constants.globalFontSize,
      ),
    );
  }
}
