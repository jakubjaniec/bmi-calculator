import 'package:bmi_calc/cubit/bmi_cubit.dart';
import 'package:bmi_calc/ui/home/widgets/gender_field.dart';
import 'package:bmi_calc/ui/home/widgets/height_field.dart';
import 'package:bmi_calc/ui/home/widgets/number_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController heightTextController = TextEditingController();
  final TextEditingController weightTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: HexColor('#090C20'),
            appBar: AppBar(
              title: Text(
                'BMI CALCULATOR',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              leading: Icon(Icons.sort, size: 32),
              backgroundColor: HexColor('#0A0D22'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 40.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GenderField(gender: 'male'),
                        SizedBox(width: 10.0),
                        GenderField(gender: 'female'),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    HeightField(),
                    SizedBox(height: 30.0),
                    Row(
                      children: [
                        NumberField(type: 'weight'),
                        SizedBox(width: 10.0),
                        NumberField(type: 'age'),
                      ],
                    ),
                    // InputField(
                    //     title: 'Height [cm]', controller: heightTextController),
                    // SizedBox(height: 20.0),
                    // InputField(
                    //     title: 'Weight [kg]', controller: weightTextController),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       context.read<BmiCubit>().calculateBmi(
                    //             height: heightTextController.text,
                    //             weight: weightTextController.text,
                    //           );
                    //     },
                    //     child: Text('calculate bmi')),
                    // ResultWidget(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// class InputField extends StatelessWidget {
//   final String title;
//   final TextEditingController controller;

//   InputField({required this.title, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//           height: 40,
//           width: 200,
//           child: TextField(
//             controller: controller,
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(
//               labelText: '$title',
//               border: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey, width: 1.0)),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class ResultWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BmiCubit, BmiState>(
//       builder: (context, state) {
//         if (state is BmiCalculated)
//           return Text(state.bmi.toString());
//         else if (state is BmiCalculating)
//           return CircularProgressIndicator();
//         else if (state is BmiError) return Text(state.error.toString());
//         return Container();
//       },
//     );
//   }
// }
