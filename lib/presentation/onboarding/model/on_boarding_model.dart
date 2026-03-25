import 'package:islame_app/core/app_asset.dart';

class OnBoardingModel {
  String image;
  String title;
  String? descraption;

  OnBoardingModel({required this.title, required this.image, this.descraption});

  static List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      title: 'Welcome To Islmi App',
      image: AppAssets.onBoarding1,
    ),

    OnBoardingModel(
      title: 'Welcome To Islmi App',
      image: AppAssets.onBoarding2,
      descraption: 'We Are Very Excited To Have You In Our Community',
    ),

    OnBoardingModel(
      title: 'Reading the Quran',
      image: AppAssets.onBoarding3,
      descraption: 'Read, and your Lord is the Most Generous',
    ),

    OnBoardingModel(
      title: 'Bearish',
      image: AppAssets.onBoarding4,
      descraption: 'Praise the name of your Lord, the Most High',
    ),
    OnBoardingModel(
      title: 'Holy Quran Radio',
      image: AppAssets.onBoarding5,
      descraption:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];
}
