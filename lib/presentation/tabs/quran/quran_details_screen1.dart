import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islame_app/presentation/tabs/quran/model/quran_resources.dart';
import 'package:islame_app/presentation/tabs/quran/widget/sura_contant1.dart';

import '../../../core/app_asset.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_fonts.dart';

class QuranDetailsScreen1 extends StatefulWidget {
  QuranDetailsScreen1({super.key});

  String verses = '';

  @override
  State<QuranDetailsScreen1> createState() => _QuranDetailsScreen1State();
}

class _QuranDetailsScreen1State extends State<QuranDetailsScreen1> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (widget.verses.isEmpty) {
      readQuranFile(index);
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.1,
        iconTheme: IconThemeData(color: AppColors.primryColor),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.table_rows_outlined, size: 35),
          ),
          SizedBox(width: width * 0.04),
          Icon(Icons.abc_outlined, size: 35),
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
        color: AppColors.secoundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.decorationLHS),
                  Text(
                    '${QuranResources.arabicQuranSurasList[index]}',
                    style: AppFonts.bold24primaryColor,
                  ),
                  Image.asset(AppAssets.decorationRHS),
                ],
              ),
              Expanded(
                child: widget.verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primryColor,
                        ),
                      )
                    : SingleChildScrollView(
                        child: SuraContant1(contant: widget.verses),
                      ),
              ),
              Image.asset(AppAssets.mosqueBottom),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> readQuranFile(int index) async {
    String quran = await rootBundle.loadString(
      'assets/files/suras/${index + 1}.txt',
    );
    List<String> suraContant = quran.split('\n');
    for (int i = 0; i < suraContant.length; i++) {
      suraContant[i] += '[${i + 1}]';
    }
    widget.verses = suraContant.join();
    setState(() {});
  }
}
