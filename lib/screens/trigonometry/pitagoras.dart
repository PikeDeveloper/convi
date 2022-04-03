import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:calculadorafisica/widgets_y_utilits/custom_underline.dart';
import 'package:calculadorafisica/widgets_y_utilits/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/pitagoras/a_stepByStep.dart';
import 'widgets/change_triangle_button.dart';
import 'widgets/pitagoras/b_stepByStep.dart';
import 'widgets/pitagoras/c_stepByStep.dart';
import 'widgets/pitagoras/dropDown_pitagoras_input_1.dart';
import 'widgets/pitagoras/dropDown_pitagras_input_2.dart';
import 'widgets/pitagoras/input_CatetoC.dart';
import 'widgets/pitagoras/input_catetoA.dart';
import 'widgets/pitagoras/input_catetoB.dart';

class Pitagoras extends StatelessWidget {
  const Pitagoras({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            ImageIcon(
              AssetImage("imagenes/trianguloRectangulo.png"),
              color: MyColors.blue67,
              size: 150,
            ),
            SizedBox(width: 20),
            ChangeTriangleButon()
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DropDownInpuItagoras1(),
            InputValue(side: trigonometryProvider.inputPitagoras_1),
            SizedBox(width: 20),
            DropDownInpuItagoras2(),
            InputValue(side: trigonometryProvider.inputPitagoras_2),
          ],
        ),
        SizedBox(height: 30),
        Answer(),
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
    final String in1 = trigonometryProvider.inputPitagoras_1;
    final String in2 = trigonometryProvider.inputPitagoras_2;
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
        _sideFound = "a:";
      }
      if (in1 != " b:" && in2 != " b:") {
        _sideFound = "b:";
      }
      if (in1 != " c:" && in2 != " c:") {
        _sideFound = "c:";
      }
      // trigonometryProvider.sideUnKnow = _sideFound;
      return Column(
        children: [
          Container(
            height: 25,
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
                      fontSize: screenSize.width > 700 ? 24 : 18),
                ),
                StyledText(trigonometryProvider.result.toString()),
              ],
            ),
          ),
          SizedBox(height: 50),
          CustomUnderline(),
          if (_sideFound == "c:") CStepByStep(),
          if (_sideFound == "b:") BStepByStep(),
          if (_sideFound == "a:") AStepByStep()
        ],
      );
    }
  }
}
