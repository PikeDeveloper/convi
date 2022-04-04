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

          // DrawerHeader(
          //   padding: EdgeInsets.all(15),
          //   margin: EdgeInsets.all(15),
          //   child: Container(),
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage("imagenes/dart_logo.png"),
          //           fit: BoxFit.contain)),
          // ),
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
                Text(
                  text,
                  style: TextStyle(
                      color: homeProvider.currentTab == index
                          ? MyColors.blue9B
                          : MyColors.grayAD),
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
