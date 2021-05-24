import 'package:bmi_calc/cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: HexColor('#1D1F33'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<BmiCubit, BmiState>(builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5.0),
                Text.rich(
                  TextSpan(
                    text: (state as BmiInitial).height.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 50,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                          text: 'cm',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  width: 250.0,
                  child: Slider(
                    value: state.height ?? 180,
                    divisions: 110,
                    min: 140,
                    max: 250,
                    inactiveColor: Colors.grey,
                    activeColor: Colors.white,
                    onChanged: (value) {
                      context.read<BmiCubit>().pickHeight(value);
                    },
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
