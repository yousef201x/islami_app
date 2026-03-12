import 'package:flutter/material.dart';
import '../models/models.dart';
import '../style/AppColors.dart';

class SuraDetailsScreen extends StatelessWidget {
  final Sura sura;

  const SuraDetailsScreen({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.black,
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/images/sura_details_bottom.png',
            fit: BoxFit.fitWidth,
            errorBuilder: (c, e, s) => const SizedBox(),
          ),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(sura.nameEn, style: const TextStyle(color: AppColors.gold, fontWeight: FontWeight.w900)),
            centerTitle: true,
            iconTheme: const IconThemeData(color: AppColors.gold),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/sura_border_left.png',
                      height: 60,
                      errorBuilder: (c, e, s) => const Icon(Icons.star_half, color: AppColors.gold, size: 40),
                    ),

                    Expanded(
                      child: Text(
                          sura.nameAr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: AppColors.gold, fontSize: 28, fontWeight: FontWeight.w900)
                      ),
                    ),
                    Image.asset(
                      'assets/images/sura_border_right.png',
                      height: 60,
                      errorBuilder: (c, e, s) => const Icon(Icons.star_half, color: AppColors.gold, size: 40),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      "[1] بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ [2] الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ [3] الرَّحْمَٰنِ الرَّحِيمِ [4] مَالِكِ يَوْمِ الدِّينِ [5] إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ [6] اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ [7] صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ",
                      style: const TextStyle(
                        color: AppColors.gold,
                        fontSize: 22,
                        height: 2.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}