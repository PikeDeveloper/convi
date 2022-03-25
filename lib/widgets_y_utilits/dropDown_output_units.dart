import 'package:calculadorafisica/providers/main_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/carret_down_icon.dart';
import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:calculadorafisica/widgets_y_utilits/container_of_units_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

class DropDownOutputUnits extends StatelessWidget {
  DropDownOutputUnits(this._unitList, {Key key}) : super(key: key);
  List<String> _unitList = [];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final mainProvider = Provider.of<MainProvider>(context);
    return ContainerList(
      DropdownButton(
        alignment: Alignment.bottomRight,
        icon: CaretDownIcon(),
        underline: Container(),
        borderRadius: BorderRadius.circular(20),
        dropdownColor: MyColors.dropDownColor,
        style: TextStyle(
          color: MyColors.grayAD,
          fontSize: screenSize.width > 700
              ? Constants.globalBigFontSize
              : screenSize.width < 400
                  ? Constants.globalSmallFontSize
                  : Constants.globalFontSize,
        ),
        value: mainProvider.outputUnit,
        items: getOpcionesDropdownOutputUnits(context),
        onChanged: (opt) {
          mainProvider.outputUnit = opt;
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdownOutputUnits(context) {
    List<DropdownMenuItem<String>> lista = [];
    _unitList.forEach((opcion) {
      lista.add(DropdownMenuItem(
        child: Text(opcion),
        value: opcion,
      ));
    });
    return lista;
  }
}
