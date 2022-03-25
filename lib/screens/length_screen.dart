import 'package:calculadorafisica/widgets_y_utilits/input_value.dart';
import 'package:calculadorafisica/widgets_y_utilits/output_value.dart';
import 'package:flutter/material.dart';

class LengthScreen extends StatelessWidget {
  const LengthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _unitList = [
      'Km',
      'Meter (m)',
      'cm',
      'Mille (mi)',
      'Yard (yd)',
      'Foot (ft)',
      'inch',
      'Nautical mile',
      'au',
      'Light-year',
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
