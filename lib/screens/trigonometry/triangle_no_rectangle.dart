import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/screens/trigonometry/widgets/no_rectangle/dropDown_triangle_input_1.dart';
import 'package:calculadorafisica/screens/trigonometry/widgets/no_rectangle/input_a.dart';
import 'package:calculadorafisica/screens/trigonometry/widgets/pitagoras/a_stepByStep.dart';
import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:calculadorafisica/widgets_y_utilits/custom_underline.dart';
import 'package:calculadorafisica/widgets_y_utilits/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/change_triangle_button.dart';
import 'widgets/no_rectangle/answer_selecter.dart';
import 'widgets/no_rectangle/dropDown_triangle_input_2.dart';
import 'widgets/no_rectangle/dropDown_triangle_input_3.dart';
import 'widgets/no_rectangle/input_alpha.dart';
import 'widgets/no_rectangle/input_b.dart';
import 'widgets/no_rectangle/input_beta.dart';
import 'widgets/no_rectangle/input_c.dart';
import 'widgets/no_rectangle/input_gamma.dart';
import 'widgets/no_rectangle/step_by_step/a_stepByStep.dart';
import 'widgets/pitagoras/b_stepByStep.dart';
import 'widgets/pitagoras/c_stepByStep.dart';

class TriangleNoRectangle extends StatelessWidget {
  const TriangleNoRectangle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            ImageIcon(
              AssetImage("imagenes/trianguloNoRectangulo.png"),
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
            DropDownInpuITriangle1(),
            InputValue(side: trigonometryProvider.input_1),
            SizedBox(width: 10),
            DropDownInpuITriangle2(),
            InputValue(side: trigonometryProvider.input_2),
            SizedBox(width: 10),
            DropDownInpuITriangle3(),
            InputValue(side: trigonometryProvider.input_3),
          ],
        ),
        SizedBox(height: 30),
        AnswerNoRectangle(),
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
        return InputA();
        break;
      case " b:":
        return InputB();
        break;
      case " c:":
        return InputC();
        break;
      case " α:":
        return InputAlpha();
        break;
      case " β:":
        return InputBeta();
        break;
      case " γ:":
        return InputGamma();
        break;
      default:
        return Container();
        break;
    }
  }
}

class AnswerNoRectangle extends StatelessWidget {
  const AnswerNoRectangle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    final String in1 = trigonometryProvider.input_1;
    final String in2 = trigonometryProvider.input_2;
    final String in3 = trigonometryProvider.input_3;
    String _unknown = trigonometryProvider.unknown;
    if (in1 == in2 || in1 == in3 || in2 == in3) {
      return Container(
        child: Text(
          "Please select different sides and angles",
          style: TextStyle(
              color: MyColors.grayAD,
              fontSize: screenSize.width > 700 ? 24 : 16),
        ),
      );
    } else {
      return Column(
        children: [
          Row(
            children: [
              AnswerSelecterNorectable(),
              Container(
                height: 25,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyColors.blue9B),
                ),
                child: Center(
                    child: StyledText(trigonometryProvider.result.toString())),
              ),
            ],
          ),
          SizedBox(height: 50),
          CustomUnderline(),
          if (_unknown == ' a:') AStepByStepNoRectangle(),
          if (_unknown == ' b:') CStepByStep(),
          if (_unknown == ' c:') BStepByStep(),
          if (_unknown == ' α:') AStepByStep(),
          if (_unknown == ' β:') AStepByStep(),
          if (_unknown == ' γ:') AStepByStep(),
        ],
      );
    }
  }
}
