import '../general/action_button.dart';
import 'widgets/gender_field.dart';
import 'widgets/height_field.dart';
import 'widgets/number_field.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController heightTextController = TextEditingController();
  final TextEditingController weightTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
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
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 40.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: GenderField(gender: 'male')),
                            SizedBox(width: 10.0),
                            Expanded(child: GenderField(gender: 'female')),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        HeightField(),
                        SizedBox(height: 30.0),
                        Row(
                          children: [
                            Expanded(child: NumberField(type: 'weight')),
                            SizedBox(width: 10.0),
                            Expanded(child: NumberField(type: 'age')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ActionButton(route: 'home'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
