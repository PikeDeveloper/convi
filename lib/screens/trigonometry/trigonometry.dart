import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/screens/trigonometry/pitagoras.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'triangle_no_rectangle.dart';

class TrigonometryScreen extends StatefulWidget {
  static const String route = "/TrigonometryScreen";
  const TrigonometryScreen({Key key}) : super(key: key);

  @override
  State<TrigonometryScreen> createState() => _TrigonometryScreenState();
}

class _TrigonometryScreenState extends State<TrigonometryScreen> {
  List<Widget> _trigonometryScreensScreen = [
    Pitagoras(),
    TriangleNoRectangle()
  ];

  @override
  Widget build(BuildContext context) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);

    return Row(
      children: [
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _trigonometryScreensScreen[trigonometryProvider.currentScreen],
            SizedBox(height: 20),
          ],
        ),
        Spacer(),
      ],
    );
  }
}
