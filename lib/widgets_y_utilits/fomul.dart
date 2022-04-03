import 'package:flutter/material.dart';
import 'package:catex/catex.dart';

class Formula extends StatelessWidget {
  Formula(
    this.ecuacion,
    this.tamano,
  );
  final String ecuacion;
  final double tamano;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: DefaultTextStyle(
              style: TextStyle(fontSize: tamano), child: CaTeX(ecuacion)),
        )
      ],
    );
  }
}
