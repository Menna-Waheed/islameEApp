import 'package:flutter/material.dart';
import 'package:islame_app/core/app_fonts.dart';
import 'package:islame_app/presentation/onboarding/model/on_boarding_model.dart';

class OnBoardingWidget extends StatelessWidget {
  OnBoardingWidget({super.key, required this.index});

  int index;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Image.asset(OnBoardingModel.onBoardingList[index].image),
        SizedBox(height: height * 0.04),
        Text(
          OnBoardingModel.onBoardingList[index].title,
          style: AppFonts.bold20primaryColor,
        ),
        SizedBox(height: height * 0.06),
        Text(
          OnBoardingModel.onBoardingList[index].descraption ?? '',
          style: AppFonts.bold20primaryColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
