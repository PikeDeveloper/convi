import 'package:calculadorafisica/widgets_y_utilits/input_value.dart';
import 'package:calculadorafisica/widgets_y_utilits/output_value.dart';
import 'package:flutter/material.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _unitList = [
      'Second (s)',
      'Minute',
      'Hour (hr)',
      'Day',
      'Week',
      'Month',
      'Year',
      'Century',
      'Millennium',
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
