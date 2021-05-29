import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BmiAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return AppBar(
      title: Text(
        'BMI CALCULATOR',
        textScaleFactor: height / 900,
        style: const TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      //TODO: CHECK IF SIZE VALUE IS RESPONSIVE
      leading: Icon(Icons.sort, size: height * 0.035),
      backgroundColor: HexColor('#0A0D22'),
    );
  }
}
