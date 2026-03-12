import 'package:flutter/material.dart';
import '../../style/AppColors.dart';
import '../../style/AppImages.dart';

class Prayer {
  final String name;
  final String time;
  final String amPm;
  final bool isActive;

  Prayer({required this.name, required this.time, required this.amPm, this.isActive = false});
}

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  final List<Prayer> prayers = [
    Prayer(name: "Fajr", time: "04:04", amPm: "AM"),
    Prayer(name: "Dhuhr", time: "01:01", amPm: "PM"),
    Prayer(name: "ASR", time: "04:38", amPm: "PM", isActive: true),
    Prayer(name: "Maghrib", time: "07:57", amPm: "PM"),
    Prayer(name: "Isha", time: "09:11", amPm: "PM"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(AppImages.appLogoPath, height: 160),
            ),
            const SizedBox(height: 10),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                  image: AssetImage('assets/images/prayer_bg.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                          "16 Jul,\n2024",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.bold)
                      ),

                      Column(
                        children: const [
                          Text("Pray Time", style: TextStyle(color: AppColors.black, fontSize: 20, fontWeight: FontWeight.w900)),
                          Text("Tuesday", style: TextStyle(color: AppColors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),

                      const Text(
                          "09 Muh,\n1446",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.bold)
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: prayers.length,
                      itemBuilder: (context, index) {
                        final prayer = prayers[index];
                        return Container(
                          width: 80,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: prayer.isActive ? AppColors.black.withOpacity(0.6) : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(prayer.name, style: TextStyle(color: prayer.isActive ? AppColors.white : AppColors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text(prayer.time, style: TextStyle(color: prayer.isActive ? AppColors.white : AppColors.black, fontSize: 22, fontWeight: FontWeight.w900)),
                              const SizedBox(height: 4),
                              Text(prayer.amPm, style: TextStyle(color: prayer.isActive ? AppColors.white : AppColors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      const Spacer(),
                      const Text("Next Pray - 02:32", style: TextStyle(color: AppColors.black, fontSize: 18, fontWeight: FontWeight.w900)),
                      const Spacer(),
                      Icon(Icons.volume_off, color: AppColors.black, size: 28),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Azkar", style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: _buildAzkarCard("Evening Azkar", "assets/images/evening_azkar.png"),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildAzkarCard("Morning Azkar", "assets/images/morning_azkar.png"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildAzkarCard(String title, String imagePath) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.5),
        border: Border.all(color: AppColors.gold, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (c, e, s) => const Icon(Icons.mosque, size: 60, color: AppColors.gold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}