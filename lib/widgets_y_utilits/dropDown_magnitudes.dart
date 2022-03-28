import 'package:calculadorafisica/providers/converter_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'carret_down_icon.dart';
import 'constants.dart';

class DropDownMagnitudes extends StatelessWidget {
  final List<String> _magnitudes = [
    'Temperature',
    'Mass',
    'Length',
    'Speed',
    'Volumen',
    'Energy',
    'Angle',
    'Pressure',
    'Radiation',
    'Power',
    'Force',
    'Sound',
    'Area',
    'Density',
    'Fuel consumption',
    'Time',
  ];

  @override
  Widget build(BuildContext context) {
    final converterProvider = Provider.of<ConverterProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    return Container(
      // width: 350,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: MyColors.blue9B),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                ImageIcon(
                    AssetImage(magnitudeIcon(converterProvider.magnitude)),
                    color: MyColors.blue9B,
                    size: 30.0),
                SizedBox(width: 19),
                DropdownButton(
                  icon: CaretDownIcon(),
                  underline: Container(),
                  borderRadius: BorderRadius.circular(20),
                  dropdownColor: MyColors.dropDownColor,
                  style: TextStyle(
                    color: MyColors.grayAD,
                    fontSize: screenSize.width > 700
                        ? Constants.globalBigFontSize
                        : Constants.globalFontSize,
                  ),
                  value: converterProvider.magnitude,
                  items: getOpcionesDropdownMagnitudes(),
                  onChanged: (opt) {
                    converterProvider.magnitude = opt;
                    //-------------------------------set the
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdownMagnitudes() {
    List<DropdownMenuItem<String>> lista = [];
    _magnitudes.forEach((opcion) {
      lista.add(DropdownMenuItem(
        child: Text(opcion),
        value: opcion,
      ));
    });
    return lista;
  }

  final TextStyle dropDownMenuStyle = TextStyle(
    color: MyColors.grayAD,
    fontSize: Constants.globalFontSize,
  );

  String magnitudeIcon(String _magnitud) {
    String imageRoute = "imagenes/iconos/temperatura.png";
    switch (_magnitud) {
      case 'Temperature':
        imageRoute = "imagenes/iconos/temperatura.png";
        return imageRoute;
        break;
      case 'Mass':
        imageRoute = "imagenes/iconos/masa.png";
        return imageRoute;
        break;
      case 'Length':
        imageRoute = "imagenes/iconos/longitud.png";
        return imageRoute;
        break;
      case 'Speed':
        imageRoute = "imagenes/iconos/velocidad.png";
        return imageRoute;
        break;
      case 'Volumen':
        imageRoute = "imagenes/iconos/volumen.png";
        return imageRoute;
        break;
      case 'Energy':
        imageRoute = "imagenes/iconos/energia.png";
        return imageRoute;
        break;
      case 'Angle':
        imageRoute = "imagenes/iconos/angulo.png";
        return imageRoute;
        break;
      case 'Pressure':
        imageRoute = "imagenes/iconos/presion.png";
        return imageRoute;
        break;
      case 'Radiation':
        imageRoute = "imagenes/iconos/radiacion.png";
        return imageRoute;
        break;
      case 'Power':
        imageRoute = "imagenes/iconos/potencia.png";
        return imageRoute;
        break;
      case 'Force':
        imageRoute = "imagenes/iconos/fuerza.png";
        return imageRoute;
        break;
      case 'Sound':
        imageRoute = "imagenes/iconos/sonido.png";
        return imageRoute;
        break;
      case 'Area':
        imageRoute = "imagenes/iconos/area.png";
        return imageRoute;
        break;
      case 'Density':
        imageRoute = "imagenes/iconos/densidad.png";
        return imageRoute;
        break;
      case 'Fuel consumption':
        imageRoute = "imagenes/iconos/combustible.png";
        return imageRoute;
        break;
      case 'Time':
        imageRoute = "imagenes/iconos/tiempo.png";
        return imageRoute;
        break;

      default:
        return imageRoute;
    }
  }
}
