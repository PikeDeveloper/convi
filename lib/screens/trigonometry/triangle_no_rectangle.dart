import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/screens/trigonometry/widgets/no_rectangle/dropDown_triangle_input_1.dart';
import 'package:calculadorafisica/screens/trigonometry/widgets/no_rectangle/input_a.dart';
import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
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
import 'widgets/no_rectangle/step_by_step/alpha_stepByStep.dart';
import 'widgets/no_rectangle/step_by_step/b_stepByStep.dart';
import 'widgets/no_rectangle/step_by_step/beta_stepByStep.dart';
import 'widgets/no_rectangle/step_by_step/c_stepByStep.dart';
import 'widgets/no_rectangle/step_by_step/gamma_stepByStep.dart';

class TriangleNoRectangle extends StatelessWidget {
  const TriangleNoRectangle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    return SingleChildScrollView(
      child: Column(
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DropDownInpuITriangle1(),
                  InputValue(side: trigonometryProvider.input_1),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DropDownInpuITriangle2(),
                  InputValue(side: trigonometryProvider.input_2),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DropDownInpuITriangle3(),
                  InputValue(side: trigonometryProvider.input_3),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          AnswerNoRectangle(),
        ],
      ),
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
      case ' alpha:':
        return InputAlpha();
        break;
      case ' beta:':
        return InputBeta();
        break;
      case ' gamma:':
        return InputGamma();
        break;
      default:
        return Container();
        break;
    }
  }
}

class AnswerNoRectangle extends StatelessWidget {
  AnswerNoRectangle({
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
          "Please do not repeat sides or angles",
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
              AnswerSelecterNoRectable(),
            ],
          ),
          SizedBox(height: 50),
          Divider(
            height: 2,
            color: MyColors.grayAD,
            thickness: 1,
          ),
          if (_unknown == 'a: ?') AStepByStepNoRectangle(),
          if (_unknown == 'b: ?') BStepByStepNoRectangle(),
          if (_unknown == 'c: ?') CStepByStepNoRectangle(),
          if (_unknown == 'alpha: ?') AlphaStepByStepNoRectangle(),
          if (_unknown == 'beta: ?') BetaStepByStepNoRectangle(),
          if (_unknown == 'gamma: ?') GammaStepByStepNoRectangle(),
        ],
      );
    }
  }
}
