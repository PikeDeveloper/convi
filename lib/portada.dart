import 'dart:io';
import 'package:calculadorafisica/screens/angle_screen.dart';
import 'package:calculadorafisica/screens/area_screen.dart';
import 'package:calculadorafisica/screens/density_screen.dart';
import 'package:calculadorafisica/screens/mass_screen.dart';
import 'package:calculadorafisica/screens/sound_screen.dart';
import 'package:calculadorafisica/screens/speed_screen.dart';
import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'providers/main_provider.dart';
import 'screens/energy_screen.dart';
import 'screens/force_screen.dart';
import 'screens/fuel_consumption_screen.dart';
import 'screens/length_screen.dart';
import 'screens/power_screen.dart';
import 'screens/pressure_screen.dart';
import 'screens/radiation_screen.dart';
import 'screens/temperature_screen.dart';
import 'screens/time_screen.dart';
import 'screens/volumen_screen.dart';
import 'widgets_y_utilits/convertion_factor.dart';
import 'widgets_y_utilits/dropDown_magnitudes.dart';
import 'widgets_y_utilits/styled_text.dart';

class Portada extends StatefulWidget {
  static const String route = "/portada";
  const Portada({Key key}) : super(key: key);

  @override
  State<Portada> createState() => _PortadaState();
}

class _PortadaState extends State<Portada> {
  List<Widget> _convertionsScreen = [
    Tmeperature(),
    MaasScreen(),
    LengthScreen(),
    SpeedScreen(),
    VolumenScreen(),
    EnergyScreen(),
    AngleScreen(),
    PressureScreen(),
    RadiationScreen(),
    PowerScreen(),
    ForceScreen(),
    SoundScreen(),
    AreaScreen(),
    DensityScreen(),
    FuelConsumptionScreen(),
    TimeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _myAppBar(),
        body: Stack(
          children: [
            adorno(),
            Row(
              children: [
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    DropDownMagnitudes(),
                    SizedBox(height: 38),
                    _convertionsScreen[mainProvider.currentScreen],
                    ConvertionFactor(
                        magnitud: mainProvider.magnitude,
                        inputUnit: mainProvider.inputUnit,
                        outputUnit: mainProvider.outputUnit,
                        conversionFactor: mainProvider.conversionFactor),
                  ],
                ),
                Spacer(),
              ],
            ),
          ],
        ));
  }

  AppBar _myAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Convi",
        style: TextStyle(
            color: MyColors.blue9B, fontSize: 50, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      // actions: _accions(),
    );
  }

  List<Widget> _accions() {
    if (Platform.isIOS) {
      return [Container()];
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
                  "https://play.google.com/store/apps/details?id=com.pike.convi&hl=es_CO&gl=US",
              child: StyledText("Android"),
            ),
            PopupMenuItem(
              value: "https://apps.apple.com/us/app/calc-fisica/id1578202570",
              child: StyledText("iOS"),
            ),
          ],
        ),
      ];
    }
  }

  Widget adorno() {
    final screenSize = MediaQuery.of(context).size;
    return screenSize.width < 700
        ? Stack(
            children: [
              Positioned(
                bottom: -360,
                left: -200,
                child: ImageIcon(
                  AssetImage("imagenes/ornamnet.png"),
                  color: MyColors.blue9B,
                  size: 600,
                ),
              ),
              Positioned(
                bottom: -140,
                right: -270,
                child: ImageIcon(
                  AssetImage("imagenes/ornamnet.png"),
                  color: MyColors.blueCF,
                  size: 500,
                ),
              ),
              Positioned(
                bottom: -360,
                right: -55,
                child: ImageIcon(
                  AssetImage("imagenes/ornamnet.png"),
                  color: MyColors.blue67,
                  size: 500,
                ),
              ),
              Positioned(
                bottom: 50,
                right: 10,
                left: 10,
                child: Center(
                  child: GestureDetector(
                    child: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: Colors.white,
                      size: 30,
                    ),
                    onTap: () => _launchURLSonamp(),
                  ),
                ),
              ),
            ],
          )
        : //--------------iPad and similar
        Stack(
            children: [
              Positioned(
                bottom: -280,
                right: 200,
                child: ImageIcon(
                  AssetImage("imagenes/ornamnet.png"),
                  color: MyColors.blue9B,
                  size: 600,
                ),
              ),
              Positioned(
                bottom: -100,
                right: -60,
                child: ImageIcon(
                  AssetImage("imagenes/ornamnet.png"),
                  color: MyColors.blueCF,
                  size: 500,
                ),
              ),
              Positioned(
                bottom: -230,
                right: -80,
                child: ImageIcon(
                  AssetImage("imagenes/ornamnet.png"),
                  color: MyColors.blue67,
                  size: 500,
                ),
              ),
              Positioned(
                bottom: 30,
                right: 10,
                left: 10,
                child: Center(
                  child: GestureDetector(
                    child: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: Colors.white,
                      size: 60,
                    ),
                    onTap: () => _launchURLSonamp(),
                  ),
                ),
              ),
            ],
          );
  }

  _launchURLSonamp() async {
    String url = 'https://www.instagram.com/enrique_rcl_electronica/?hl=es';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
