import 'package:calculadorafisica/widgets_y_utilits/input_value.dart';
import 'package:calculadorafisica/widgets_y_utilits/output_value.dart';
import 'package:flutter/material.dart';

class AngleScreen extends StatelessWidget {
  const AngleScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _unitList = [
      'Degrees (°)',
      'Radian (rad)',
      'Gradian (grad)',
    ];
    return Column(
      children: [
        InputValue(_unitList),
        SizedBox(height: 30),
        OutputValue(_unitList),
        SizedBox(height: 45),
      ],
    );
  }
}
