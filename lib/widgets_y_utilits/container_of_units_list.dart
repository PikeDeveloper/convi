import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:flutter/material.dart';

class ContainerList extends StatelessWidget {
  ContainerList(this.child, {Key key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.zero,
      width: screenSize.width > 700 ? 220 : 155,
      height: screenSize.width > 700 ? 40 : 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: MyColors.blue9B),
      ),
      child: Row(
        children: [
          Spacer(),
          child,
        ],
      ),
    );
  }
}
