import 'package:calculadorafisica/generated/l10n.dart';
import 'package:calculadorafisica/providers/main_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:calculadorafisica/widgets_y_utilits/custom_underline.dart';
import 'package:calculadorafisica/widgets_y_utilits/dropDown_input_units.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputValue extends StatelessWidget {
  InputValue(this._unitList, {Key key}) : super(key: key);

  final List<String> _unitList;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: screenSize.width > 700
                  ? Constants.bigWidthTextFieldWnputValue
                  : screenSize.width < 400
                      ? Constants.smallWidthTextFieldInputValue
                      : Constants.widthTextFieldInputValue,
              child: TextField(
                  textAlign: TextAlign.center,
                  cursorColor: MyColors.grayAD,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: AppLocalizations.current.EnterValue,
                    focusColor: MyColors.blue9B,
                    hoverColor: MyColors.blue9B,
                    fillColor: Colors.white,
                    border: InputBorder.none,
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
                    mainProvider.inputValue = double.parse(value);
                  }),
            ),
            CustomUnderline()
          ],
        ),
        SizedBox(width: 6),
        DropDownInputUnits(_unitList)
      ],
    );
  }
}
