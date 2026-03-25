import 'package:flutter/material.dart';
import 'package:islame_app/core/app_route.dart';
import 'package:islame_app/core/app_them.dart';
import 'package:islame_app/presentation/home/home_screen.dart';
import 'package:islame_app/presentation/onboarding/onboarding_screen.dart';
import 'package:islame_app/presentation/tabs/quran/quran_details_screen.dart';
import 'package:islame_app/presentation/tabs/quran/quran_details_screen1.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool ?showedOnboarding = await prefs.getBool('onBoardingView');
  runApp(MyApp(viewOnBoarding: showedOnboarding ?? false,));
}

class MyApp extends StatelessWidget {
  bool viewOnBoarding;

  MyApp({super.key, required this.viewOnBoarding});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: viewOnBoarding ? AppRoute.homeNamed : AppRoute.onBoarding,
      routes: {
        AppRoute.homeNamed: (context) => HomeScreen(),
        AppRoute.quranDetailesScreen: (context) => QuranDetailsScreen(),
        AppRoute.quranDetailesScreen1: (context) => QuranDetailsScreen1(),
        AppRoute.onBoarding: (context) => OnboardingScreen(),
      },
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
