import 'package:calculadorafisica/widgets_y_utilits/input_value.dart';
import 'package:calculadorafisica/widgets_y_utilits/output_value.dart';
import 'package:flutter/material.dart';

class PowerScreen extends StatelessWidget {
  const PowerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _unitList = [
      'Watt',
      'Kilowatt',
      'Megawatt',
      'HP',
      'BTU/min',
      'BTU/s',
      'lb-ft/min',
      'lb-ft/s',
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
