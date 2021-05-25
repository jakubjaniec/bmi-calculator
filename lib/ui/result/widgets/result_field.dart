import '../../../cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ResultField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#1D1F33'),
      height: 550,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              children: [
                _BmiCategory(),
                SizedBox(height: 20.0),
                _BmiResult(),
                SizedBox(height: 30.0),
                Text('Normal BMI range:',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0)),
                SizedBox(height: 10.0),
                Text('18,5 - 25',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                SizedBox(height: 25.0),
                _BmiResultInfo(),
                SizedBox(height: 70.0),
                _SaveResultButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BmiResult extends StatelessWidget {
  const _BmiResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiCubit, BmiState>(
      builder: (context, state) {
        if (state is BmiCalculated) {
          return Text(state.bmi.toString(),
              style: TextStyle(
                fontSize: 100.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ));
        }
        return Container();
      },
    );
  }
}

class _SaveResultButton extends StatelessWidget {
  const _SaveResultButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230.0,
      height: 60.0,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: HexColor('#0A0D22'),
          ),
          child: Text('SAVE RESULT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ))),
    );
  }
}

class _BmiResultInfo extends StatelessWidget {
  const _BmiResultInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String determineInfoText() {
      if (context.watch<BmiCubit>().state is BmiCalculated) {
        double? bmi = (context.watch<BmiCubit>().state as BmiCalculated).bmi;

        if (bmi! < 18.5) {
          return "Your result suggests you\nare underweight.";
        } else if (bmi >= 18.5 && bmi <= 24.9) {
          return "You have a normal body\nweight. Good job!";
        } else if (bmi >= 25 && bmi <= 29.9) {
          return "Your result suggests you\nare overweight.";
        } else {
          return "Your result suggests you\nare obese.";
        }
      }
      return '';
    }

    return Text(determineInfoText(),
        textAlign: TextAlign.center,
        softWrap: false,
        style: TextStyle(
          fontSize: 22.0,
          height: 1.3,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ));
  }
}

class _BmiCategory extends StatelessWidget {
  const _BmiCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String determineCategory() {
      if (context.watch<BmiCubit>().state is BmiCalculated) {
        double? bmi = (context.watch<BmiCubit>().state as BmiCalculated).bmi;

        if (bmi! < 18.5) {
          return "UNDERWEIGHT";
        } else if (bmi >= 18.5 && bmi <= 24.9) {
          return "NORMAL";
        } else if (bmi >= 25 && bmi <= 29.9) {
          return "OVERWEIGHT";
        } else {
          return "OBESITY";
        }
      }
      return '';
    }

    return Text(determineCategory(),
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
            color: Colors.green[200]));
  }
}
