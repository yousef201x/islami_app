import 'package:flutter/material.dart';
import '../../style/AppColors.dart';
import '../../style/AppImages.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int currentIndex = 0;
  double turns = 0.0;

  final List<String> tasbeehList = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
  ];

  void onSebhaTap() {
    setState(() {
      counter++;
      turns += 1 / 33;

      if (counter == 33) {
        counter = 0;
        currentIndex = (currentIndex + 1) % tasbeehList.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(AppImages.appLogoPath, height: 160),
          ),
          const SizedBox(height: 10),

          const Text(
            "سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 36,
              fontWeight: FontWeight.w900,
            ),
          ),

          const Spacer(),

          GestureDetector(
            onTap: onSebhaTap,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 75),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedRotation(
                        turns: turns,
                        duration: const Duration(milliseconds: 300),
                        child: Image.asset(
                          'assets/images/sebha.png',
                          width: 300,
                          height: 300,
                          fit: BoxFit.contain,
                        ),
                      ),

                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            tasbeehList[currentIndex],
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "$counter",
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Image.asset(
                  'assets/images/sebha_top.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}