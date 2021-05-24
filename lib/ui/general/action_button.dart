import '../../cubit/bmi_cubit.dart';
import '../result/result_screen.dart';
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
            var currentState = (context.read<BmiCubit>().state as BmiInitial);

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
            style: TextStyle(
              color: Colors.white,
              fontSize: 19.0,
            )),
      ),
    );
  }
}
