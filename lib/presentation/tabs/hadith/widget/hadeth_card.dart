import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islame_app/core/app_colors.dart';
import 'package:islame_app/core/app_fonts.dart';

class HadethCard extends StatefulWidget {
  HadethCard({super.key, required this.index});

  int index;

  @override
  State<HadethCard> createState() => _HadethCardState();
}

class _HadethCardState extends State<HadethCard> {
  String hadeth = '';
  String title = '';

  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // if(hadeth.isEmpty){
    //   loadHadethFile();
    // }

    return Container(
      padding: EdgeInsets.only(
        top: height * 0.02,
        right: width * 0.02,
        left: width * 0.02,
      ),

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/HadithCardBackGround 1.png'),
        ),
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primryColor,
      ),
      child: hadeth.isEmpty
          ? Center(
              child: CircularProgressIndicator(color: AppColors.secoundColor),
            )
          : Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/hadeth_decoration.png',
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.05),
                    Text('$title', style: AppFonts.bold24black),
                    SizedBox(height: height * 0.05),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          '$hadeth',
                          style: AppFonts.bold16black,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  void loadHadethFile() async {
    String hadethContant = await rootBundle.loadString(
      'assets/files/Hadeeth/h${widget.index}.txt',
    );
    List<String> hadethLines = hadethContant.split('\n');
    title = hadethLines[0];
    String hadethCon = '';
    for (int i = 1; i < hadethLines.length; i++) {
      hadethCon += hadethLines[i];
    }
    hadeth = hadethCon;
    await Future.delayed(Duration(seconds: 1));

    setState(() {});
  }
}

// Row(
//             children: [
//               Image.asset(AppAssets.decorationLHS,color: AppColors.blackColor,),
//               Text('$title',style: AppFonts.bold24black,),
//               Image.asset(AppAssets.decorationRHS,color: AppColors.blackColor,)
//             ],
//           ),
