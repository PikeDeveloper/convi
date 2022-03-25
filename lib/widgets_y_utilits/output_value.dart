import 'package:calculadorafisica/providers/main_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/calc_helper.dart';
import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:calculadorafisica/widgets_y_utilits/dropDown_output_units.dart';
import 'package:calculadorafisica/widgets_y_utilits/styled_text.dart';
import 'package:calculadorafisica/widgets_y_utilits/custom_underline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OutputValue extends StatelessWidget {
  OutputValue(this._unitList, {Key key}) : super(key: key);
  final List<String> _unitList;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final mainProvider = Provider.of<MainProvider>(context);
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
              child: Center(
                  child:
                      StyledText(mainProvider.result.toString())),
            ),
            CustomUnderline()
          ],
        ),
        SizedBox(width: 6),
        DropDownOutputUnits(_unitList)
      ],
    );
  }
}
