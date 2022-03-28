import 'package:calculadorafisica/widgets_y_utilits/input_value.dart';
import 'package:calculadorafisica/widgets_y_utilits/output_value.dart';
import 'package:flutter/material.dart';

class Tmeperature extends StatelessWidget {
  const Tmeperature({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _unitList = ['°K', '°C', '°F'];
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
