// import 'package:calculadorafisica/providers/trigonometry_provider.dart';
// import 'package:calculadorafisica/widgets_y_utilits/utilitis.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ProcedureA extends StatelessWidget {
//   const ProcedureA({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final trigonometryProvider =
//         Provider.of<TrigonometryProvider>(context, listen: false);
//     final String in1 = trigonometryProvider.input_1;
//     final String in2 = trigonometryProvider.input_2;
//     return Container();
//   }

//   void _calcula_a() {
//     _c_ = deci(_cDouble, decimales);
//     _b_ = deci(_bDouble, decimales);
//     _unidad = _opcionSeleccionadaEntrada_c;

//     _c2_ = deci(_c_ * _c_, decimales);

//     _b2_ = deci(_b_ * _b_, decimales);

//     _c2MenosB2_ = deci(_c2_ - _b2_, decimales);

//     _raiz = deci(sqrt(_c2MenosB2_), decimales);

//     _unidadSeleccionada = _unidad;

//     _kilometroString =
//         convertirLongitud(_unidadSeleccionada, _raiz).kilometroString;

//     _metroString = convertirLongitud(_unidadSeleccionada, _raiz).metroString;

//     _centimetroString =
//         convertirLongitud(_unidadSeleccionada, _raiz).centimetroString;

//     _yardaString = convertirLongitud(_unidadSeleccionada, _raiz).yardaString;

//     _pieString = convertirLongitud(_unidadSeleccionada, _raiz).pieString;

//     _pulgadaString =
//         convertirLongitud(_unidadSeleccionada, _raiz).pulgadaString;

//     setState(() {});
//   }
// }
