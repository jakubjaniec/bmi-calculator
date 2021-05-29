import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../cubit/bmi_cubit.dart';

class NumberField extends StatelessWidget {
  final String? type;

  const NumberField({this.type});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.22,
      width: width,
      color: HexColor('#1D1F33'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(type == 'weight' ? 'WEIGHT' : 'AGE',
              textScaleFactor: height / 900,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              )),
          SizedBox(height: height * 0.008),
          _ValueText(type: type),
          SizedBox(height: height * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _CustomButton(type: type, action: 'decrement'),
              SizedBox(width: width * 0.02),
              _CustomButton(type: type, action: 'increment'),
            ],
          )
        ],
      ),
    );
  }
}

class _ValueText extends StatelessWidget {
  const _ValueText({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String? type;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiCubit, BmiState>(
      builder: (context, state) {
        if (state is BmiInitial) {
          return Text(
            type == 'weight' ? state.weight.toString() : state.age.toString(),
            textScaleFactor: MediaQuery.of(context).size.height / 900,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 50.0,
              color: Colors.white,
            ),
          );
        }
        return Container();
      },
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton({
    Key? key,
    required this.type,
    required this.action,
  }) : super(key: key);

  final String? type;
  final String? action;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: () {
        if (type == 'weight') {
          context.read<BmiCubit>().pickWeight(event: action);
        } else if (type == 'age') {
          context.read<BmiCubit>().pickAge(event: action);
        }
      },
      style: ElevatedButton.styleFrom(
        primary: HexColor('#323546'),
        minimumSize: Size(
          height * 0.06,
          height * 0.06,
        ),
        shape: const CircleBorder(),
      ),
      child: Icon(
        action == 'increment' ? Icons.add : Icons.remove,
        size: height * 0.03,
      ),
    );
  }
}
