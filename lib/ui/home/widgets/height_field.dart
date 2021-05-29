import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../cubit/bmi_cubit.dart';

class HeightField extends StatelessWidget {
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
            Text('HEIGHT',
                textScaleFactor: height / 900,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  color: Colors.grey,
                )),
            SizedBox(height: height * 0.009),
            const _ValueText(),
            SizedBox(height: height * 0.02),
            const _HeightSlider(),
          ],
        ));
  }
}

class _ValueText extends StatelessWidget {
  const _ValueText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiCubit, BmiState>(
      builder: (context, state) {
        if (state is BmiInitial) {
          return Text.rich(
            TextSpan(
              text: state.height.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 50.0,
                color: Colors.white,
              ),
              children: const [
                TextSpan(
                    text: 'cm',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                    )),
              ],
            ),
            textScaleFactor: MediaQuery.of(context).size.height / 900,
          );
        }
        return Container();
      },
    );
  }
}

class _HeightSlider extends StatelessWidget {
  const _HeightSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      child: BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) {
          if (state is BmiInitial) {
            return Slider(
              value: state.height ?? 180,
              divisions: 110,
              min: 140,
              max: 250,
              inactiveColor: Colors.grey,
              activeColor: Colors.white,
              onChanged: (value) {
                context.read<BmiCubit>().pickHeight(height: value);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
