import 'package:flutter/material.dart';
import 'package:islame_app/core/app_asset.dart';
import 'package:islame_app/core/app_colors.dart';
import 'package:islame_app/core/app_fonts.dart';
import 'package:islame_app/core/app_route.dart';
import 'package:islame_app/presentation/tabs/quran/model/quran_resources.dart';
import 'package:islame_app/presentation/tabs/quran/widget/most_recently.dart';
import 'package:islame_app/presentation/tabs/quran/widget/quran_item.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
          horizontal: width * 0.04
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Image.asset(AppAssets.VectorSearch),
              hintText: 'Sura Name',
              hintStyle: AppFonts.bold16white,
              enabledBorder: buildOutLineDecoration(),
              focusedBorder: buildOutLineDecoration(),
            ),

          ),
          SizedBox(height: height * 0.02,),
          Text('Most Recently', style: AppFonts.bold16white,),
          SizedBox(height: height * 0.02,),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MostRecently();
              },
              itemCount: 5,
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.01,);
              },

            ),
          ),
          SizedBox(height: height * 0.02,),
          Text('Suras List', style: AppFonts.bold16white,),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoute.quranDetailesScreen,
                              arguments: index);
                        },
                        child: QuranItem(index: index,));
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      endIndent: width * 0.04,
                      indent: width * 0.04,
                    );
                  },
                  itemCount: QuranResources.arabicQuranSurasList.length))

        ],


      ),
    );
  }

  OutlineInputBorder buildOutLineDecoration() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
          color: AppColors.primryColor,
          width: 2
      ),
    );
  }

}
