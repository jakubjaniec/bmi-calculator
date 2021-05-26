import 'package:bmi_calc/ui/general/bmi_app_bar.dart';

import '../general/action_button.dart';
import 'widgets/result_field.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ResultScreen extends StatelessWidget {
  final TextStyle _headlineStyle = TextStyle(
      fontSize: 40.0, fontWeight: FontWeight.w500, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#090C20'),
      appBar: BmiAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Result', style: _headlineStyle),
                    SizedBox(height: 30.0),
                    ResultField(),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              ActionButton(route: 'result'),
            ],
          ),
        ),
      ),
    );
  }
}
