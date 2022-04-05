import 'package:calculadorafisica/generated/l10n.dart';
import 'package:calculadorafisica/main.dart';
import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:calculadorafisica/widgets_y_utilits/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppSettings extends StatefulWidget {
  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  int _decimalSeleccionado = prefs.decimals;
  int _decimalSeleccionadoAngulo = prefs.angleDecimals;

  List<int> _decimales = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40),
            StyledText(AppLocalizations.current.whoMenyDecimal),
            _crearDropdownDecimales(),
            SizedBox(height: 40),
            StyledText(AppLocalizations.current.whoMenyDecimalAngle),
            _crearDropdownDecimalesAngulo(),
            SizedBox(height: 40),
            // Text(
            //   "Everything blue is touch",
            //   style: TextStyle(color: MyColors.grayAD, fontSize: 20),
            // )
          ]),
    );
  }

  Widget _crearDropdownDecimales() {
    final screenSize = MediaQuery.of(context).size;

    return Row(
      children: [
        StyledText(AppLocalizations.current.decimals),
        SizedBox(width: 10),
        Container(
          child: Row(
            children: <Widget>[
              DropdownButton(
                icon: Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: FaIcon(
                    FontAwesomeIcons.caretDown,
                    color: MyColors.blue9B,
                    size: 15,
                  ),
                ),
                dropdownColor: MyColors.dropDownColor,
                style: TextStyle(
                  color: MyColors.blue9B,
                  fontSize: screenSize.width > 700
                      ? Constants.globalBigFontSize
                      : screenSize.width < 400
                          ? Constants.globalSmallFontSize
                          : Constants.globalFontSize,
                ),
                value: _decimalSeleccionado,
                items: getOpcionesDropdownDeciamles(_decimales),
                onChanged: (opt) {
                  _decimalSeleccionado = opt;
                  prefs.decimals = opt;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        SizedBox(width: 15),
        StyledText("→"),
        SizedBox(width: 15),
        StyledText(_cerosDecimales(_decimalSeleccionado)),
      ],
    );
  }

  Widget _crearDropdownDecimalesAngulo() {
    final screenSize = MediaQuery.of(context).size;

    return Row(
      children: [
        StyledText(AppLocalizations.current.decimals),
        SizedBox(width: 10),
        Container(
          child: Row(
            children: <Widget>[
              DropdownButton(
                icon: Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: FaIcon(
                    FontAwesomeIcons.caretDown,
                    color: MyColors.blue9B,
                    size: 15,
                  ),
                ),
                dropdownColor: MyColors.dropDownColor,
                style: TextStyle(
                  color: MyColors.blue9B,
                  fontSize: screenSize.width > 700
                      ? Constants.globalBigFontSize
                      : screenSize.width < 400
                          ? Constants.globalSmallFontSize
                          : Constants.globalFontSize,
                ),
                value: _decimalSeleccionadoAngulo,
                items: getOpcionesDropdownDeciamles(_decimales),
                onChanged: (opt) {
                  _decimalSeleccionadoAngulo = opt;
                  prefs.angleDecimals = opt;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        SizedBox(width: 15),
        StyledText("→"),
        SizedBox(width: 15),
        StyledText(_cerosDecimales(_decimalSeleccionadoAngulo)),
      ],
    );
  }

  List<DropdownMenuItem<int>> getOpcionesDropdownDeciamles(List<int> opciones) {
    List<DropdownMenuItem<int>> lista = new List();
    opciones.forEach((opcion) {
      lista.add(DropdownMenuItem(
        child: Text(opcion.toString()),
        value: opcion,
      ));
    });
    return lista;
  }

  String _cerosDecimales(int deciomales) {
    String _cerosDecimales = "2";
    switch (deciomales) {
      case 0:
        _cerosDecimales = "0";
        return _cerosDecimales;
        break;
      case 1:
        _cerosDecimales = "0.0";
        return _cerosDecimales;
        break;
      case 2:
        _cerosDecimales = "0.00";
        return _cerosDecimales;
        break;
      case 3:
        _cerosDecimales = "0.000";
        return _cerosDecimales;
        break;
      case 4:
        _cerosDecimales = "0.0000";
        return _cerosDecimales;
        break;
      case 5:
        _cerosDecimales = "0.00000";
        return _cerosDecimales;
        break;
      case 6:
        _cerosDecimales = "0.000000";
        return _cerosDecimales;
        break;
      case 7:
        _cerosDecimales = "0.0000000";
        return _cerosDecimales;
        break;
      case 8:
        _cerosDecimales = "0.00000000";
        return _cerosDecimales;
        break;

      default:
    }
  }
}
