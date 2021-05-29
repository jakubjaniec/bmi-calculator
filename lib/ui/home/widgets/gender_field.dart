import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../cubit/bmi_cubit.dart';

class GenderField extends StatelessWidget {
  final String? gender;

  const GenderField({this.gender});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        context.read<BmiCubit>().pickGender(gender: gender);
      },
      child: Container(
        height: height * 0.19,
        color: HexColor('#1D1F33'),
        child: BlocBuilder<BmiCubit, BmiState>(
          builder: (context, state) {
            if (state is BmiInitial) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    gender == 'male' ? Icons.male : Icons.female,
                    color: state.gender == gender ? Colors.white : Colors.grey,
                    size: height * 0.09,
                  ),
                  const SizedBox(height: 15.0),
                  Text(gender.toString().toUpperCase(),
                      textScaleFactor: height / 900,
                      style: TextStyle(
                        color:
                            state.gender == gender ? Colors.white : Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
