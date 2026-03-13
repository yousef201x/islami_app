import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/models.dart';
import '../../style/AppColors.dart';
import '../../style/AppImages.dart';
import '../sura_details_screen.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Sura> surasList = [
      Sura(id: 1, nameEn: "Al-Fatiha", nameAr: "الفاتحه", verses: 7),
      Sura(id: 2, nameEn: "Al-Baqarah", nameAr: "البقرة", verses: 286),
      Sura(id: 3, nameEn: "Aal-E-Imran", nameAr: "آل عمران", verses: 200),
      Sura(id: 4, nameEn: "An-Nisa", nameAr: "النساء", verses: 176),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(AppImages.appLogoPath, height: 160),
            ),
            const SizedBox(height: 16),

            TextField(
              style: const TextStyle(color: AppColors.white, fontSize: 16),
              decoration: InputDecoration(
                hintText: "Sura Name",
                hintStyle: const TextStyle(color: AppColors.white, fontWeight: FontWeight.w600),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    "assets/icons/quran.svg",
                    width: 30,
                    height: 30,
                  ),
                ),
                filled: true,
                fillColor: AppColors.black.withOpacity(0.5),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.gold, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.gold, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
                "Most Recently",
                style: TextStyle(color: AppColors.white, fontSize: 20, fontWeight: FontWeight.w900)
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    width: 270,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: AppColors.gold,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Al-Anbiya", style: TextStyle(color: AppColors.black, fontSize: 20, fontWeight: FontWeight.w900)),
                              Text("الأنبياء", style: TextStyle(color: AppColors.black, fontSize: 24, fontWeight: FontWeight.w900)),
                              SizedBox(height: 8),
                              Text("112 Verses", style: TextStyle(color: AppColors.black, fontSize: 14, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          child: Image.asset(
                            'assets/images/img_most_recent.png',
                            width: 120,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (c, e, s) => const Icon(Icons.menu_book, size: 60, color: AppColors.black),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            const Text(
                "Suras List",
                style: TextStyle(color: AppColors.white, fontSize: 20, fontWeight: FontWeight.w900)
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.separated(
                itemCount: surasList.length,
                separatorBuilder: (context, index) => const Divider(color: AppColors.gold, thickness: 1),
                itemBuilder: (context, index) {
                  final sura = surasList[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SuraDetailsScreen(sura: sura)));
                    },
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/images/itr_border.png",
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                            errorBuilder: (c, e, s) => const Icon(Icons.star_border, color: AppColors.gold, size: 40),
                          ),
                          Text(
                            "${index + 1}",
                            style: const TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    title: Text(sura.nameEn, style: const TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w900)),
                    subtitle: Text("${sura.verses} Verses", style: const TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                    trailing: Text(sura.nameAr, style: const TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.w900)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}