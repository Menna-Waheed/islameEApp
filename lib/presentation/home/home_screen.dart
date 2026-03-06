import 'package:flutter/material.dart';
import 'package:islame_app/core/app_asset.dart';
import 'package:islame_app/core/app_colors.dart';
import 'package:islame_app/presentation/tabs/hadith/hadith_tab.dart';
import 'package:islame_app/presentation/tabs/quran/quran_tab.dart';
import 'package:islame_app/presentation/tabs/radio/radio_tab.dart';
import 'package:islame_app/presentation/tabs/sebha/sebha_tab.dart';
import 'package:islame_app/presentation/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> bgImage = [
    AppAssets.qranPg,
    AppAssets.hadthBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];
  List<Widget> Tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bgImage[selectedIndex]),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.primryColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: [
            buildIconDecoration(
              image: AppAssets.qranIcon,
              label: 'Quran',
              index: 0,
            ),
            buildIconDecoration(
              image: AppAssets.hadthIcon,
              label: 'Hadith',
              index: 1,
            ),
            buildIconDecoration(
              image: AppAssets.sephaIcon,
              label: 'Sebha',
              index: 2,
            ),
            buildIconDecoration(
              image: AppAssets.radioIcon,
              label: 'Radio',
              index: 3,
            ),
            buildIconDecoration(
              image: AppAssets.timeIcon,
              label: 'Time',
              index: 4,
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.logo),
            Expanded(child: Tabs[selectedIndex]),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildIconDecoration({
    required String image,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: index == selectedIndex
          ? Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.secoundColor,
                borderRadius: BorderRadius.circular(66),
              ),
              child: ImageIcon(AssetImage(image)),
            )
          : ImageIcon(AssetImage(image)),
      label: label,
    );
  }
}
