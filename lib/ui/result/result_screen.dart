import 'package:bmi_calc/cubit/bmi_cubit.dart';
import 'package:bmi_calc/ui/general/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#090C20'),
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        leading: Icon(Icons.sort, size: 32),
        backgroundColor: HexColor('#0A0D22'),
      ),
      body: Column(
        children: [
          BlocBuilder<BmiCubit, BmiState>(
            builder: (context, state) {
              return Text(
                (state as BmiInitial).age.toString(),
              );
            },
          ),
          ActionButton(route: 'result'),
        ],
      ),
    );
  }
}
