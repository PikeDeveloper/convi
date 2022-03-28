import 'package:calculadorafisica/widgets_y_utilits/input_value.dart';
import 'package:calculadorafisica/widgets_y_utilits/output_value.dart';
import 'package:flutter/material.dart';

class EnergyScreen extends StatelessWidget {
  const EnergyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _unitList = [
      'joules (J)',
      'KJ',
      'Wh',
      'KWh',
      'BTU',
      'Foot-pound',
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
