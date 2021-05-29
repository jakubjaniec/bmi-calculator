import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../general/action_button.dart';
import '../general/bmi_app_bar.dart';
import 'widgets/result_field.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    const TextStyle _headlineStyle = TextStyle(
      fontSize: 38.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );

    return Scaffold(
      backgroundColor: HexColor('#090C20'),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.055),
        child: BmiAppBar(),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.only(left: width * 0.094, right: width * 0.094),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Your Result',
                        textScaleFactor: height / 900, style: _headlineStyle),
                    SizedBox(height: height * 0.025),
                    ResultField(),
                  ],
                ),
              ),
            ),
            const ActionButton(route: 'result'),
          ],
        ),
      ),
    );
  }
}
