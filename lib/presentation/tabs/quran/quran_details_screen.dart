import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islame_app/core/app_asset.dart';
import 'package:islame_app/core/app_colors.dart';
import 'package:islame_app/core/app_fonts.dart';
import 'package:islame_app/core/app_route.dart';
import 'package:islame_app/presentation/tabs/quran/model/quran_resources.dart';
import 'package:islame_app/presentation/tabs/quran/widget/sura_contant.dart';

class QuranDetailsScreen extends StatefulWidget {
  QuranDetailsScreen({super.key});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> verses = [];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      readQuranFile(index);
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.1,
        iconTheme: IconThemeData(color: AppColors.primryColor),
        actions: [
          Icon(Icons.table_rows_outlined, size: 35),
          SizedBox(width: width * 0.04),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoute.quranDetailesScreen1,
                arguments: index,
              );
            },
            child: Icon(Icons.abc_outlined, size: 35),
          ),
          SizedBox(width: width * 0.1),
        ],
        backgroundColor: AppColors.secoundColor,
        title: Text(
          '${QuranResources.englishQuranSurahsList[index]}',
          style: AppFonts.bold20primaryColor,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.secoundColor,
          image: DecorationImage(
            image: AssetImage(AppAssets.suraDecoration),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Text(
              '${QuranResources.arabicQuranSurasList[index]}',
              style: AppFonts.bold24primaryColor,
            ),
            Expanded(
              child: verses.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primryColor,
                      ),
                    )
                  : Container(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(
                          vertical: height * 0.08,
                          horizontal: width * 0.04,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              currentIndex = index;
                              setState(() {});
                            },
                            child: SuraContant(
                              contant: '${verses[index]}[${index + 1}]',
                              index: index,
                              selectedIndex: currentIndex,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: height * 0.02);
                        },
                        itemCount: verses.length,
                      ),
                    ),
            ),
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }

  Future<void> readQuranFile(int index) async {
    String quran = await rootBundle.loadString(
      'assets/files/suras/${index + 1}.txt',
    );
    List<String> suraContant = quran.split('\n');

    verses = suraContant;
    setState(() {});
  }
}
