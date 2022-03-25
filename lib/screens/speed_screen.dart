import 'package:calculadorafisica/widgets_y_utilits/input_value.dart';
import 'package:calculadorafisica/widgets_y_utilits/output_value.dart';
import 'package:flutter/material.dart';

class SpeedScreen extends StatelessWidget {
  const SpeedScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _unitList = [
      'mph',
      'ft/s',
      'm/s',
      'Km/h',
      'knots (kn)',
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
