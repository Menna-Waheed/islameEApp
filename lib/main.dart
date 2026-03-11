import 'package:flutter/material.dart';
import 'package:islame_app/core/app_route.dart';
import 'package:islame_app/core/app_them.dart';
import 'package:islame_app/presentation/home/home_screen.dart';
import 'package:islame_app/presentation/tabs/quran/quran_details_screen.dart';
import 'package:islame_app/presentation/tabs/quran/quran_details_screen1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoute.homeNamed,
      routes: {
        AppRoute.homeNamed: (context) => HomeScreen(),
        AppRoute.quranDetailesScreen: (context) => QuranDetailsScreen(),
        AppRoute.quranDetailesScreen1: (context) => QuranDetailsScreen1(),
      },
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
