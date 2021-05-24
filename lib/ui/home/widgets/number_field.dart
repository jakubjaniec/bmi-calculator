import 'package:bmi_calc/cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class NumberField extends StatelessWidget {
  final String? type;

  NumberField({this.type});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 200,
        color: HexColor('#1D1F33'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  type == 'weight' ? 'WEIGHT' : 'AGE',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5.0),
                BlocBuilder<BmiCubit, BmiState>(
                  builder: (context, state) {
                    return Text(
                      type == 'weight'
                          ? (state as BmiInitial).weight.toString()
                          : (state as BmiInitial).age.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 55.0,
                      width: 55.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (type == 'weight') {
                            context.read<BmiCubit>().pickWeight('decrement');
                          } else if (type == 'age') {
                            context.read<BmiCubit>().pickAge('decrement');
                          }
                        },
                        child: Icon(Icons.remove),
                        style: ElevatedButton.styleFrom(
                          primary: HexColor('#323546'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0),
                    SizedBox(
                      height: 55.0,
                      width: 55.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (type == 'weight') {
                            context.read<BmiCubit>().pickWeight('increment');
                          } else if (type == 'age') {
                            context.read<BmiCubit>().pickAge('increment');
                          }
                        },
                        child: Icon(Icons.add),
                        style: ElevatedButton.styleFrom(
                          primary: HexColor('#323546'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
