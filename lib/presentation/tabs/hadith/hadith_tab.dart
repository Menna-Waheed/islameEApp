import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islame_app/presentation/tabs/hadith/widget/hadeth_card.dart';

class HadithTab extends StatelessWidget {
  HadithTab({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return CarouselSlider(
      options: CarouselOptions(
          height: height * 0.66,
          enlargeCenterPage: true,
          initialPage: 0
      ),
      items: List.generate(50, (index) => index + 1,).map((index) {
        return HadethCard(index: index,);
      }).toList(),
    );
  }


}
