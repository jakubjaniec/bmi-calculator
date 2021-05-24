import 'package:bmi_calc/cubit/bmi_cubit.dart';
import 'package:bmi_calc/ui/home/home_screen.dart';
import 'package:bmi_calc/ui/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ActionButton extends StatelessWidget {
  final String? route;

  ActionButton({this.route});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          if (route == 'home') {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ResultScreen(),
              ),
            );
          } else if (route == 'result') {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          primary: HexColor('#EB1555'),
        ),
        child: Text(
            route == 'home' ? 'CALCULATE YOUR BMI' : 'RE-CALCULATE YOUR BMI',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19.0,
            )),
      ),
    );
  }
}
