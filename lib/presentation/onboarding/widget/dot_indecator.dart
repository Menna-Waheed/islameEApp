import 'package:flutter/material.dart';
import 'package:islame_app/core/app_colors.dart';

class DotIndecator extends StatelessWidget {
  DotIndecator({super.key, required this.isActive});

  bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 300),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: isActive ? 30 : 10,
        height: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isActive ? AppColors.primryColor : AppColors.colorgray,
        ),
      ),
    );
  }
}
