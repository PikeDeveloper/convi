import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'colors.dart';

class CaretDownIcon extends StatelessWidget {
  CaretDownIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 4),
      child: FaIcon(
        FontAwesomeIcons.caretDown,
        color: MyColors.blue9B,
        size: 20,
      ),
    );
  }
}
