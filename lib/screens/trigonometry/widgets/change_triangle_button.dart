import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ChangeTriangleButon extends StatelessWidget {
  ChangeTriangleButon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.zero,
            width: screenSize.width > 700 ? 60 : 50,
            height: screenSize.width > 700 ? 60 : 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: MyColors.blue9B),
            ),
            child: Icon(
              FontAwesomeIcons.exchangeAlt,
              color: MyColors.blue9B,
              size: screenSize.width > 700 ? 40 : 30,
            ),
          ),
        ],
      ),
      onTap: () {
        trigonometryProvider.currentScreen == 0
            ? trigonometryProvider.currentScreen = 1
            : trigonometryProvider.currentScreen = 0;
      },
    );
  }
}
