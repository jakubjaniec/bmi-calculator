import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../cubit/bmi_cubit.dart';
import '../result/result_screen.dart';

class ActionButton extends StatelessWidget {
  final String? route;

  const ActionButton({this.route});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * 0.08,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          if (route == 'home') {
            final BmiInitial currentState =
                context.read<BmiCubit>().state as BmiInitial;

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ResultScreen(),
            ));
            context
                .read<BmiCubit>()
                .calculateBmi(currentState.height, currentState.weight);
          } else if (route == 'result') {
            context.read<BmiCubit>().reCalculateBmi();
            Navigator.of(context).pop();
          }
        },
        style: ElevatedButton.styleFrom(
          primary: HexColor('#EB1555'),
        ),
        child: Text(
            route == 'home' ? 'CALCULATE YOUR BMI' : 'RE-CALCULATE YOUR BMI',
            textScaleFactor: height / 900,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 19.0,
            )),
      ),
    );
  }
}
