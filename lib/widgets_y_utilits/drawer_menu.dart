import 'package:calculadorafisica/providers/home_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 80),
          opcion(
            context,
            0,
            'Converter',
            () {
              homeProvider.currentTab = 0;
              // Navigator.of(context).pop();
            },
          ),
          opcion(
            context,
            1,
            'Trigonometry',
            () {
              homeProvider.currentTab = 1;
            },
          ),
          opcion(
            context,
            2,
            'Settings',
            () {
              homeProvider.currentTab = 2;
            },
          ),
        ],
      ),
    );
  }

  Widget opcion(
      BuildContext context, int index, String text, VoidCallback onpress) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return GestureDetector(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                SizedBox(width: 20),
                // icono(index),
                SizedBox(width: 10),
                Row(
                  children: [
                    Text(
                      text,
                      style: TextStyle(color: MyColors.blue9B),
                    ),
                    if (homeProvider.currentTab == index)
                      Icon(
                        Icons.check,
                        color: MyColors.blue9B,
                      )
                  ],
                )
              ],
            )),
        onTap: onpress);
  }

  StatelessWidget icono(int index) {
    switch (index) {
      case 0:
        return FaIcon(FontAwesomeIcons.rightLeft);
        break;
      case 1:
        return FaIcon(FontAwesomeIcons.angleDown);
        break;
      case 2:
        return FaIcon(FontAwesomeIcons.penNib);
        break;
      case 3:
        return FaIcon(FontAwesomeIcons.bolt);
        break;
      default:
        return FaIcon(FontAwesomeIcons.bolt);
        break;
    }
  }
}
