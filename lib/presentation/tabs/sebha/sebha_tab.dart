import 'package:flutter/material.dart';
import 'package:islame_app/core/app_asset.dart';
import 'package:islame_app/core/app_fonts.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double rotate = 0.0;
  int index = 0;

  List<String>doaa = [
    'سبحان الله',
    'الحمد الله',
    'لااله الا الله',
    'الله اكبر',
    'استغفر الله',

  ];

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
    return Column(
      children: [
        Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى', style: AppFonts.bold36White,),
        Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.hand_sebha),
              Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (counter == 33) {
                            index++;
                            counter = 0;
                          }
                          if (index == doaa.length) {
                            index = 0;
                          }
                          rotate++;
                          counter++;

                          setState(() {

                          });
                        },
                        child: Transform.rotate(angle: rotate,
                            child: Image.asset(AppAssets.sebha_body))),
                    Column(
                      children: [
                        Text('${doaa[index]}', style: AppFonts.bold36White),
                        SizedBox(height: height * 0.02,),
                        Text('$counter', style: AppFonts.bold36White),

                      ],
                    )
                  ])
            ]))
      ],
    );
  }
}
