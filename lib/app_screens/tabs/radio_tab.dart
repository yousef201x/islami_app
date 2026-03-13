import 'package:flutter/material.dart';
import '../../style/AppColors.dart';
import '../../style/AppImages.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  bool isRadioSelected = true;

  final List<String> radioStations = [
    "Radio Ibrahim Al-Akdar",
    "Radio Al-Qaria Yassen",
    "Radio Ahmed Al-trabulsi",
    "Radio Addokali Mohammad Alalim",
  ];

  final List<String> reciters = [
    "Ibrahim Al-Akdar",
    "Akram Alalaqmi",
    "Majed Al-Enezi",
    "Malik shaibat Alhamed",
  ];

  @override
  Widget build(BuildContext context) {
    final currentList = isRadioSelected ? radioStations : reciters;

    return SafeArea(
      child: Column(
        children: [
          Center(
            child: Image.asset(AppImages.appLogoPath, height: 160),
          ),

          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: AppColors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isRadioSelected = true),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: isRadioSelected ? AppColors.gold : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Radio",
                        style: TextStyle(
                          color: isRadioSelected ? AppColors.black : AppColors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isRadioSelected = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: !isRadioSelected ? AppColors.gold : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Reciters",
                        style: TextStyle(
                          color: !isRadioSelected ? AppColors.black : AppColors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              itemCount: currentList.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(20),
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
                          color: AppColors.black.withOpacity(0.4),
                          errorBuilder: (c, e, s) => const SizedBox(),
                        ),
                      ),

                      Positioned(
                        top: 50,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/images/sound_wave.png',
                          fit: BoxFit.fitWidth,
                          color: AppColors.black.withOpacity(0.2),
                          errorBuilder: (c, e, s) => const Icon(Icons.graphic_eq, size: 80, color: Colors.black12),
                        ),
                      ),

                      Column(
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            currentList[index],
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                          ),

                          const Spacer(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.play_arrow),
                                color: AppColors.black,
                                iconSize: 45,
                                onPressed: () {
                                },
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                icon: const Icon(Icons.volume_up),
                                color: AppColors.black,
                                iconSize: 30,
                                onPressed: () {
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}