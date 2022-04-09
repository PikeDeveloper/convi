import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Result extends StatelessWidget {
  const Result(this.child, {Key key}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            height: screenSize.width > 700 ? 40 : 25,
            // width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: MyColors.blue9B),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(child: child),
            ),
          ),
        ),
        onTap: () {
          trigonometryProvider.showStepByStep =
              !trigonometryProvider.showStepByStep;
        });
  }
}
