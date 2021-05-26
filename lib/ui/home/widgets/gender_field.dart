import '../../../cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderField extends StatelessWidget {
  final String? gender;

  GenderField({this.gender});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<BmiCubit>().pickGender(gender: gender);
      },
      child: Container(
        height: 170,
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
                    size: 80,
                  ),
                  SizedBox(height: 15.0),
                  Text(gender.toString().toUpperCase(),
                      style: TextStyle(
                        color:
                            state.gender == gender ? Colors.white : Colors.grey,
                        fontSize: 20,
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
