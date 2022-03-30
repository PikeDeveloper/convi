import 'package:calculadorafisica/widgets_y_utilits/input_value.dart';
import 'package:calculadorafisica/widgets_y_utilits/output_value.dart';
import 'package:flutter/material.dart';

class VolumenScreen extends StatelessWidget {
  const VolumenScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _unitList = [
      'm³',
      'Liter (L)',
      'ml',
      'cc',
      'Cubic inch (in³)',
      'Cubic foot (ft³)',
      'US Barrel',
      'US Gallon',
      'US quarts',
      'US Pint',
      'US Cup',
      'US Fluid ozs',
      'US tbsp',
      'US tsp',
      'Imperial barrel',
      'Imperial gallon',
      'Imperial quarts',
      'Imperial pint',
      'Imperial cup',
      'Imperial fluid oz',
      'Imperial tbsp',
      'Imperial tsp',
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
