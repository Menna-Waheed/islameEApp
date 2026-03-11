import 'package:flutter/material.dart';

import '../../../../core/app_fonts.dart';

class SuraContant1 extends StatelessWidget {
  SuraContant1({super.key, required this.contant});

  String contant;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Text(
        contant,
        style: AppFonts.bold20primaryColor,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
