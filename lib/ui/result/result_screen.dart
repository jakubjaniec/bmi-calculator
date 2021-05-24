import 'package:bmi_calc/cubit/bmi_cubit.dart';
import 'package:bmi_calc/ui/general/action_button.dart';
import 'package:bmi_calc/ui/result/widgets/result_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your Result',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  SizedBox(height: 30.0),
                  ResultField(),
                ],
              ),
            ),
            ActionButton(route: 'result'),
          ],
        ),
      ),
    );
  }
}
