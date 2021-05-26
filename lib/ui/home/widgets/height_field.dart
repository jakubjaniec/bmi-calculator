import '../../../cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        color: HexColor('#1D1F33'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HEIGHT',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.grey,
                )),
            SizedBox(height: 5.0),
            _ValueText(),
            SizedBox(height: 20.0),
            _HeightSlider(),
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
      width: 250.0,
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
