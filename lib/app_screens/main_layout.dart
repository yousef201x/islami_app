import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/app_screens/tabs/radio_tab.dart';
import 'package:islami/app_screens/tabs/sebha_tab.dart';
import 'package:islami/app_screens/tabs/time_tab.dart';
import '../style/AppColors.dart';
import '../style/AppImages.dart';
import 'tabs/quran_tab.dart';
import 'tabs/hadith_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const QuranTab(),
    const HadithTab(),
    const SebhaTab(),
    const RadioTab(),
    const TimeTab()
  ];

  BottomNavigationBarItem _buildNavItem(String iconPath, String label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
      ),
      activeIcon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image(
            image: AppImages.backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: _screens[_currentIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColors.gold,
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              backgroundColor: AppColors.gold,
              selectedItemColor: AppColors.white,
              unselectedItemColor: AppColors.black,

              showSelectedLabels: true,
              showUnselectedLabels: false,
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),

              type: BottomNavigationBarType.fixed,
              items: [
                _buildNavItem("assets/icons/quran.svg", "Quran"),
                _buildNavItem("assets/icons/hadeth.svg", "Hadith"),
                _buildNavItem("assets/icons/sebha.svg", "Sebha"),
                _buildNavItem("assets/icons/radio.svg", "Radio"),
                _buildNavItem("assets/icons/time.svg", "Time"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}