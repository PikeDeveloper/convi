import 'dart:io';
import 'package:calculadorafisica/providers/home_provider.dart';
import 'package:calculadorafisica/screens/converter/converter.dart';
import 'package:calculadorafisica/screens/trigonometry/trigonometry.dart';
import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:calculadorafisica/widgets_y_utilits/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import '../widgets_y_utilits/styled_text.dart';
import 'screens/settings.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "/HomeScreen";
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> Screens = [
    ConverterScreen(),
    TrigonometryScreen(),
    AppSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      drawer: MenuDrawer(),
      resizeToAvoidBottomInset: false,
      appBar: _myAppBar(),
      body: Screens[homeProvider.currentTab],
    );
  }

  AppBar _myAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: MyColors.blue9B),
      centerTitle: true,
      title: Text(
        "Convi",
        style: TextStyle(
            color: MyColors.blue9B, fontSize: 50, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      actions: _accions(),
    );
  }

  List<Widget> _accions() {
    if (Platform.isIOS) {
      return [
        IconButton(
            onPressed: () {
              Share.share("https://apps.apple.com/us/app/convi/id1616275570");
            },
            icon: Icon(
              Icons.share,
              color: MyColors.blue9B,
            ))
      ];
    } else {
      return [
        PopupMenuButton<String>(
          icon: Icon(
            Icons.share,
            color: MyColors.blue9B,
          ),
          onSelected: (link) => Share.share(link),
          itemBuilder: (context) => [
            PopupMenuItem(
              value:
                  "https://play.google.com/store/apps/details?id=com.pike.convi",
              child: StyledText("Android"),
            ),
            PopupMenuItem(
              value: "https://apps.apple.com/us/app/convi/id1616275570",
              child: StyledText("iOS"),
            ),
          ],
        ),
      ];
    }
  }
}
