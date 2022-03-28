import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContainerPitagorasInputs extends StatelessWidget {
  ContainerPitagorasInputs(this.child, {Key key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.zero,
      width: screenSize.width > 700 ? 60 : 50,
      height: screenSize.width > 700 ? 40 : 25,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   border: Border.all(color: MyColors.blue9B),
      // ),
      child: Row(
        children: [
          Spacer(),
          FaIcon(
            FontAwesomeIcons.caretDown,
            color: MyColors.blue9B,
            size: 15,
          ),
          child,
          Spacer(),
        ],
      ),
    );
  }
}
