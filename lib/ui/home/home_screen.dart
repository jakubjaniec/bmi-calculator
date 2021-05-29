import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../general/action_button.dart';
import '../general/bmi_app_bar.dart';
import 'widgets/gender_field.dart';
import 'widgets/height_field.dart';
import 'widgets/number_field.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController heightTextController = TextEditingController();
  final TextEditingController weightTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: HexColor('#090C20'),
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.067),
              child: BmiAppBar()),
          body: SizedBox(
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: width * 0.07, right: width * 0.07),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                    child: GenderField(gender: 'male')),
                                SizedBox(width: width * 0.025),
                                const Expanded(
                                    child: GenderField(gender: 'female')),
                              ],
                            ),
                            SizedBox(height: height * 0.02),
                            HeightField(),
                            SizedBox(height: height * 0.02),
                            Row(
                              children: [
                                const Expanded(
                                    child: NumberField(type: 'weight')),
                                SizedBox(width: width * 0.025),
                                const Expanded(child: NumberField(type: 'age')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const ActionButton(route: 'home'),
              ],
            ),
          ),
        );
      },
    );
  }
}
