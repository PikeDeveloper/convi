import 'package:calculadorafisica/providers/trigonometry_provider.dart';
import 'package:calculadorafisica/widgets_y_utilits/colors.dart';
import 'package:calculadorafisica/widgets_y_utilits/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../container_of_triangle_inputs.dart';

class DropDownInpuITriangle2 extends StatelessWidget {
  DropDownInpuITriangle2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final trigonometryProvider = Provider.of<TrigonometryProvider>(context);
    final List<String> _unitList = trigonometryProvider.sidesAndAngle;

    return ContainerTriangleInputs(
      DropdownButton(
        alignment: Alignment.bottomRight,
        icon: Container(),
        underline: Container(),
        borderRadius: BorderRadius.circular(20),
        dropdownColor: MyColors.dropDownColor,
        style: TextStyle(
          color: MyColors.blue9B,
          fontSize: screenSize.width > 700
              ? Constants.globalBigFontSize
              : Constants.globalFontSize,
        ),
        value: trigonometryProvider.input_2,
        items: getOpcionesDropdownInputUnits(context, _unitList),
        onChanged: (opt) {
          trigonometryProvider.input_2 = opt;
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdownInputUnits(
      context, List<String> _unitList) {
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
