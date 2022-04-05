import 'package:flutter/material.dart';

class ContainerTriangleInputs extends StatelessWidget {
  ContainerTriangleInputs(this.child, {Key key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.zero,
      // width: screenSize.width > 700 ? 100 : 80,
      height: screenSize.width > 700 ? 40 : 25,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   border: Border.all(color: MyColors.blue9B),
      // ),
      child: Row(
        children: [
          // FaIcon(
          //   FontAwesomeIcons.caretDown,
          //   color: MyColors.blue9B,
          //   size: 15,
          // ),
          child,
        ],
      ),
    );
  }
}
