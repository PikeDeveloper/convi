import 'package:calculadorafisica/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'constants.dart';
import 'styled_text.dart';

class ConvertionFactor extends StatelessWidget {
  const ConvertionFactor({
    Key key,
    @required this.magnitud,
    @required this.inputUnit,
    @required this.outputUnit,
    @required this.conversionFactor,
  }) : super(key: key);

  final String magnitud;
  final String inputUnit;
  final String outputUnit;
  final double conversionFactor;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    String _convertionFactorTemperature = "imagenes/iconoNada.png";

    if (inputUnit == '°C' && outputUnit == '°C') {
      _convertionFactorTemperature = "imagenes/iconoNada.png";
    }
    if (inputUnit == '°C' && outputUnit == '°F') {
      _convertionFactorTemperature = "imagenes/temp/cf.png";
    }
    if (inputUnit == '°C' && outputUnit == '°K') {
      _convertionFactorTemperature = "imagenes/temp/ck.png";
    }
    if (inputUnit == '°F' && outputUnit == '°C') {
      _convertionFactorTemperature = "imagenes/temp/fc.png";
    }
    if (inputUnit == '°F' && outputUnit == '°F') {
      _convertionFactorTemperature = "imagenes/iconoNada.png";
    }
    if (inputUnit == '°F' && outputUnit == '°K') {
      _convertionFactorTemperature = "imagenes/temp/fk.png";
    }
    if (inputUnit == '°K' && outputUnit == '°C') {
      _convertionFactorTemperature = "imagenes/temp/kc.png";
    }
    if (inputUnit == '°K' && outputUnit == '°F') {
      _convertionFactorTemperature = "imagenes/temp/kf.png";
    }
    if (inputUnit == '°K' && outputUnit == '°K') {
      _convertionFactorTemperature = "imagenes/iconoNada.png";
    }

    if (magnitud == 'Temperature') {
      return SizedBox(
        height: 100,
        child: ImageIcon(
          AssetImage(_convertionFactorTemperature),
          color: MyColors.blue9B,
          size: 200,
        ),
      );
    } else {
      return Column(
        children: [
          StyledText(
            AppLocalizations.current.ConversionFactor,
          ),
          SizedBox(height: 7),
          Container(
            width: screenSize.width > 700
                ? Constants.bigWidthTextFieldWnputValue + 20
                : Constants.widthTextFieldInputValue + 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: MyColors.blue9B),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: StyledText(conversionFactor.toString()),
              ),
            ),
          ),
        ],
      );
    }
  }
}
