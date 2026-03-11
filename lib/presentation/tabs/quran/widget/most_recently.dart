import 'package:flutter/material.dart';
import 'package:islame_app/core/app_colors.dart';

import '../../../../core/app_asset.dart';
import '../../../../core/app_fonts.dart';

class MostRecently extends StatelessWidget {
  const MostRecently({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: width * 0.02),
      decoration: BoxDecoration(
        color: AppColors.primryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Al-Anbiya', style: AppFonts.bold24black),
              Text('الأنبياء', style: AppFonts.bold24black),
              Text('112 Verses', style: AppFonts.bold14black),
            ],
          ),
          Image.asset(AppAssets.suraImage),
        ],
      ),
    );
  }
}
