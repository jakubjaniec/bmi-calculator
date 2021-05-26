import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BmiAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'BMI CALCULATOR',
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
      leading: Icon(Icons.sort, size: 32),
      backgroundColor: HexColor('#0A0D22'),
    );
  }
}
