import 'package:flutter/material.dart';
import 'package:islame_app/core/app_colors.dart';
import 'package:islame_app/core/app_fonts.dart';

class SuraContant extends StatelessWidget {
  SuraContant({
    super.key,
    required this.contant,
    required this.selectedIndex,
    required this.index,
  });

  int selectedIndex;
  int index;
  String contant;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsetsGeometry.symmetric(vertical: height * 0.02),
      decoration: BoxDecoration(
        color: selectedIndex == index
            ? AppColors.primryColor
            : AppColors.transperentColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primryColor, width: 2),
      ),
      child: Text(
        contant,
        style: selectedIndex == index
            ? AppFonts.bold20black
            : AppFonts.bold20primaryColor,
        textAlign: TextAlign.center,
      ),
    );
  }
}
