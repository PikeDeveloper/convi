import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/screens/trigonometry/widgets/dropDown_input_1.dart';
import 'package:calculadorafisica/screens/trigonometry/widgets/dropDown_input_2.dart';
import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:calculadorafisica/widgets_y_utilits/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/input_CatetoC.dart';
import 'widgets/input_catetoA.dart';
import 'widgets/input_catetoB.dart';

class Pitagoras extends StatelessWidget {
  const Pitagoras({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    return Column(
      children: [
        ImageIcon(
          AssetImage("imagenes/trianguloRectangulo.png"),
          color: MyColors.blue67,
          size: 150,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DropDownInpuItagoras1(),
            InputValue(side: trigonometryProvider.input_1),
            SizedBox(width: 20),
            DropDownInpuItagoras2(),
            InputValue(side: trigonometryProvider.input_2),
          ],
        ),
        SizedBox(height: 30),
        Answer()
      ],
    );
  }
}

class InputValue extends StatelessWidget {
  const InputValue({
    Key key,
    @required this.side,
  }) : super(key: key);

  final String side;

  @override
  Widget build(BuildContext context) {
    switch (side) {
      case " a:":
        return InputCatetoA();
        break;
      case " b:":
        return InputCatetoB();
        break;
      case " c:":
        return InputCatetoC();
        break;
      default:
        return Container();
        break;
    }
  }
}

class Answer extends StatelessWidget {
  const Answer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    final String in1 = trigonometryProvider.input_1;
    final String in2 = trigonometryProvider.input_2;
    String _sideFound = "";
    if (in1 == in2) {
      return Container(
        child: Text(
          "Please select different sides",
          style: TextStyle(
              color: MyColors.grayAD,
              fontSize: screenSize.width > 700 ? 24 : 16),
        ),
      );
    } else {
      if (in1 != " a:" && in2 != " a:") {
        _sideFound = " a:";
      }
      if (in1 != " b:" && in2 != " b:") {
        _sideFound = " b:";
      }
      if (in1 != " c:" && in2 != " c:") {
        _sideFound = " c:";
      }
      return Container(
        height: 20,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: MyColors.blue9B),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _sideFound,
              style: TextStyle(
                  color: MyColors.grayAD,
                  fontSize: screenSize.width > 700 ? 24 : 16),
            ),
            StyledText(trigonometryProvider.result.toString()),
          ],
        ),
      );
    }
  }
}
