import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../style/AppColors.dart';
import '../../style/AppImages.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  final PageController _pageController = PageController(viewportFraction: 0.82);

  final List<Hadith> hadithList = [
    Hadith(
      title: "الحديث الأول",
      content: "عَنْ أَمِيرِ الْمُؤْمِنِينَ أَبِي حَفْصٍ عُمَرَ بْنِ الْخَطَّابِ رَضِيَ اللهُ عَنْهُ قَالَ: سَمِعْتُ رَسُولَ اللَّهِ ﷺ يَقُولُ: (إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى. فَمَنْ كَانَتْ هِجْرَتُهُ إِلَى اللَّهِ وَرَسُولِهِ، فَهِجْرَتُهُ إِلَى اللَّهِ وَرَسُولِهِ، وَمَنْ كَانَتْ هِجْرَتُهُ لِدُنْيَا يُصِيبُهَا أَوْ امْرَأَةٍ يَنْكِحُهَا، فَهِجْرَتُهُ إِلَى مَا هَاجَرَ إِلَيْهِ).",
    ),
    Hadith(
      title: "الحديث الثاني",
      content: "عَنْ عُمَرَ رَضِيَ اللهُ عَنْهُ أَيْضاً قَالَ: بَيْنَمَا نَحْنُ جُلُوسٌ عِنْدَ رَسُولِ اللَّهِ ﷺ ذَاتَ يَوْمٍ، إِذْ طَلَعَ عَلَيْنَا رَجُلٌ شَدِيدُ بَيَاضِ الثِّيَابِ شَدِيدُ سَوَادِ الشَّعَرِ...",
    ),
    Hadith(
      title: "الحديث الثالث",
      content: "عَنْ أَبِي عَبْدِ الرَّحْمَنِ عَبْدِ اللَّهِ بْنِ عُمَرَ بْنِ الْخَطَّابِ رَضِيَ اللَّهُ عَنْهُمَا قَالَ: سَمِعْتُ رَسُولَ اللَّهِ ﷺ يَقُولُ: بُنِيَ الْإِسْلَامُ عَلَى خَمْسٍ: شَهَادَةِ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَنَّ مُحَمَّدًا رَسُولُ اللَّهِ، وَإِقَامِ الصَّلَاةِ، وَإِيتَاءِ الزَّكَاةِ، وَحَجِّ الْبَيْتِ، وَصَوْمِ رَمَضَانَ.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Center(
            child: Image.asset(AppImages.appLogoPath, height: 160),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: hadithList.length,
              itemBuilder: (context, index) {
                final hadith = hadithList[index];

                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double pageOffset = 0;

                    if (_pageController.position.haveDimensions) {
                      pageOffset = _pageController.page! - index;
                    } else {
                      pageOffset = (0.0 - index).toDouble();
                    }

                    double absOffset = pageOffset.abs().clamp(0.0, 1.0);
                    double verticalMargin = 20 + (absOffset * 40);

                    return Padding(
                      padding: EdgeInsets.only(
                        top: verticalMargin,
                        bottom: verticalMargin,
                      ),
                      child: child,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: AppColors.gold,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            'assets/images/sura_details_bottom.png',
                            fit: BoxFit.fitWidth,
                            color: AppColors.black,
                            errorBuilder: (c, e, s) => const SizedBox(),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/images/sura_border_left.png',
                                    height: 60,
                                    color: AppColors.black,
                                    errorBuilder: (c, e, s) => const Icon(Icons.star_half, color: AppColors.black, size: 40),
                                  ),

                                  Expanded(
                                    child: Text(
                                      hadith.title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: AppColors.black,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w900
                                      ),
                                    ),
                                  ),

                                  Image.asset(
                                    'assets/images/sura_border_right.png',
                                    height: 60,
                                    color: AppColors.black,
                                    errorBuilder: (c, e, s) => const Icon(Icons.star_half, color: AppColors.black, size: 40),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),
                              Expanded(
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.only(bottom: 60),
                                  child: Text(
                                    hadith.content,
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                        color: AppColors.black,
                                        fontSize: 22,
                                        height: 1.8,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}