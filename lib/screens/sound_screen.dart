import 'package:calculadorafisica/widgets_y_utilits/input_value.dart';
import 'package:calculadorafisica/widgets_y_utilits/output_value.dart';
import 'package:flutter/material.dart';

class SoundScreen extends StatelessWidget {
  const SoundScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _unitList = [
      'Bell (B)',
      'decibel (dB)',
      'neper (Np)',
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
