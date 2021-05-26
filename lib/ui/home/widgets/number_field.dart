import '../../../cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class NumberField extends StatelessWidget {
  final String? type;

  NumberField({this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      color: HexColor('#1D1F33'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(type == 'weight' ? 'WEIGHT' : 'AGE',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              )),
          SizedBox(height: 5.0),
          _ValueText(type: type),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _CustomButton(type: type, action: 'decrement'),
              SizedBox(width: 15.0),
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
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 50,
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
    return SizedBox(
      height: 55.0,
      width: 55.0,
      child: ElevatedButton(
        onPressed: () {
          if (type == 'weight') {
            context.read<BmiCubit>().pickWeight(event: action);
          } else if (type == 'age') {
            context.read<BmiCubit>().pickAge(event: action);
          }
        },
        child: Icon(
          action == 'increment' ? Icons.add : Icons.remove,
        ),
        style: ElevatedButton.styleFrom(
          primary: HexColor('#323546'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        ),
      ),
    );
  }
}
