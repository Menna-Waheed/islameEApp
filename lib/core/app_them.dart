import 'package:flutter/material.dart';
import 'package:islame_app/core/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transperentColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: false,
        selectedItemColor: AppColors.whiteColor,
        elevation: 0,
        unselectedIconTheme: IconThemeData(
            color: AppColors.blackColor
        ),


      )


  );
}
