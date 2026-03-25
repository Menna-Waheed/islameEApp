import 'package:flutter/material.dart';
import 'package:islame_app/core/app_asset.dart';
import 'package:islame_app/core/app_colors.dart';
import 'package:islame_app/core/app_route.dart';
import 'package:islame_app/presentation/onboarding/model/on_boarding_model.dart';
import 'package:islame_app/presentation/onboarding/widget/dot_indecator.dart';
import 'package:islame_app/presentation/onboarding/widget/on_boarding_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/app_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secoundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logo),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (value) {
                    currentIndex = value;
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    return OnBoardingWidget(index: index);
                  },
                  itemCount: OnBoardingModel.onBoardingList.length,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentIndex == 0
                      ? SizedBox()
                      : TextButton(
                          onPressed: () {
                            controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Text(
                            'Back',
                            style: AppFonts.bold16primaryColor,
                          ),
                        ),
                  Row(
                    children: List.generate(
                      OnBoardingModel.onBoardingList.length,
                      (index) => DotIndecator(
                        isActive: currentIndex == index ? true : false,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                      if (currentIndex ==
                          OnBoardingModel.onBoardingList.length - 1) {
                        await viewOnBoarding();
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoute.homeNamed,
                        );
                      }
                    },
                    child: Text(
                      currentIndex == OnBoardingModel.onBoardingList.length - 1
                          ? 'Finished'
                          : 'Next',
                      style: AppFonts.bold16primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> viewOnBoarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onBoardingView', true);
  }
}
