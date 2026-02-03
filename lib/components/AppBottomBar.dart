import 'package:flutter/material.dart';
import 'package:islami/components/BottomBarItem.dart';
import 'package:islami/style/AppColors.dart';

class AppBottomBar extends StatelessWidget {
  final int activeIndex;
  final Function(int) onTap;

  AppBottomBar({required this.activeIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: activeIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.gold,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      items: [
        BottomBarItem().buildBottomBarItem(index: 0, activeIndex: activeIndex, iconName: "quran", label: "Quran"),
        BottomBarItem().buildBottomBarItem(index: 1, activeIndex: activeIndex, iconName: "hadeth", label: "Hadeth"),
        BottomBarItem().buildBottomBarItem(index: 2, activeIndex: activeIndex, iconName: "sebha", label: "Sebha"),
        BottomBarItem().buildBottomBarItem(index: 3, activeIndex: activeIndex, iconName: "radio", label: "Radio"),
        BottomBarItem().buildBottomBarItem(index: 4, activeIndex: activeIndex, iconName: "time", label: "Time"),
      ],
    );
  }
}
