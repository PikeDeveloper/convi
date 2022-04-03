import 'package:calculadorafisica/generated/l10n.dart';
import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:calculadorafisica/widgets_y_utilits/custom_underline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputCatetoB extends StatelessWidget {
  InputCatetoB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final trigonometryProvider =
        Provider.of<TrigonometryProvider>(context, listen: false);
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: Constants.widthInputTrigonometry,
              child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  textAlign: TextAlign.center,
                  cursorColor: MyColors.blue9B,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    // hintText: AppLocalizations.current.EnterValue,
                    focusColor: MyColors.blue9B,
                    hoverColor: MyColors.blue9B,
                    fillColor: Colors.white,
                  ),
                  style: TextStyle(
                    color: MyColors.grayAD,
                    fontSize: screenSize.width > 700
                        ? Constants.globalBigFontSize
                        : screenSize.width < 400
                            ? Constants.globalSmallFontSize
                            : Constants.globalFontSize,
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) {
                    trigonometryProvider.legB = double.parse(value);
                    ;
                  }),
            ),
            // CustomUnderline()
          ],
        ),
        SizedBox(width: 6),
      ],
    );
  }
}
