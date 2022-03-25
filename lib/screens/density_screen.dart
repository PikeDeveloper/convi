import 'package:calculadorafisica/widgets_y_utilits/input_value.dart';
import 'package:calculadorafisica/widgets_y_utilits/output_value.dart';
import 'package:flutter/material.dart';

class DensityScreen extends StatelessWidget {
  const DensityScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _unitList = [
      'Kg/m³',
      'g/cm³',
      'lb/ft³',
      'lb/in³',
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
