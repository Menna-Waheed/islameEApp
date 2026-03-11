import 'package:flutter/material.dart';
import 'package:islame_app/core/app_asset.dart';
import 'package:islame_app/core/app_fonts.dart';
import 'package:islame_app/presentation/tabs/quran/model/quran_resources.dart';

class QuranItem extends StatelessWidget {
  QuranItem({super.key, required this.index});

  int index;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      spacing: width * 0.02,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.VectorStar),
            Text('${index + 1}', style: AppFonts.bold20white),
          ],
        ),
        Column(
          spacing: height * 0.01,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${QuranResources.englishQuranSurahsList[index]}',
              style: AppFonts.bold20white,
            ),
            Text(
              '${QuranResources.AyatNumber[index]} Verses',
              style: AppFonts.bold14white,
            ),
          ],
        ),
        Spacer(),
        Text(
          '${QuranResources.arabicQuranSurasList[index]}',
          style: AppFonts.bold20white,
        ),
      ],
    );
  }
}
