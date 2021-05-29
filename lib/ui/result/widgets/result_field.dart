import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../cubit/bmi_cubit.dart';

class ResultField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Container(
      color: HexColor('#1D1F33'),
      height: height * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.033),
            child: Column(
              children: [
                const _BmiCategory(),
                SizedBox(height: height * 0.022),
                const _BmiResult(),
                SizedBox(height: height * 0.033),
                Text('Normal BMI range:',
                    textScaleFactor: height / 900,
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey)),
                SizedBox(height: height * 0.011),
                Text('18,5 - 25',
                    textScaleFactor: height / 900,
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                SizedBox(height: height * 0.027),
                const _BmiResultInfo(),
                SizedBox(height: height * 0.078),
                const _SaveResultButton(),
              ],
            ),
          ),
        ],
      ),
    );
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
        final double? bmi =
            (context.watch<BmiCubit>().state as BmiCalculated).bmi;

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
        textScaleFactor: MediaQuery.of(context).size.height / 900,
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            color: Colors.green[200]));
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
        final double height = MediaQuery.of(context).size.height;
        if (state is BmiCalculated) {
          return Text(state.bmi.toString(),
              textScaleFactor: height / 900,
              style: const TextStyle(
                fontSize: 90.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ));
        }
        return Container();
      },
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
        final double? bmi =
            (context.watch<BmiCubit>().state as BmiCalculated).bmi;

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
        textScaleFactor: MediaQuery.of(context).size.height / 900,
        style: const TextStyle(
          fontSize: 22.0,
          height: 1.3,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ));
  }
}

class _SaveResultButton extends StatelessWidget {
  const _SaveResultButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.56,
      height: height * 0.07,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: HexColor('#0A0D22'),
          ),
          child: Text('SAVE RESULT',
              textScaleFactor: height / 900,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ))),
    );
  }
}
