import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/screens/trigonometry/pitagoras.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeometryScreen extends StatefulWidget {
  static const String route = "/GeometryScreen";
  const GeometryScreen({Key key}) : super(key: key);

  @override
  State<GeometryScreen> createState() => _GeometryScreenState();
}

class _GeometryScreenState extends State<GeometryScreen> {
  List<Widget> _GeometryScreensScreen = [
    Pitagoras(),
  ];

  @override
  Widget build(BuildContext context) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    final screensize = MediaQuery.of(context).size;

    return SizedBox(
      width: screensize.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _GeometryScreensScreen[trigonometryProvider.currentScreen],
              SizedBox(
                height: 20,
                width: screensize.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
