import 'package:calculadorafisica/widgets_y_utilits/input_value.dart';
import 'package:calculadorafisica/widgets_y_utilits/output_value.dart';
import 'package:flutter/material.dart';

class PressureScreen extends StatelessWidget {
  const PressureScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _unitList = [
      'bar',
      'Pascal (Pa)',
      'kPa',
      'MPa',
      'Torr',
      'psi',
      'atm',
      'Kg/cm²',
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
