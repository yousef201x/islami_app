import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/style/AppColors.dart';

class BottomBarItem{

  BottomNavigationBarItem buildBottomBarItem({required String label,required String iconName,required int index,required int activeIndex}){
    if(activeIndex == index){
      return BottomNavigationBarItem(
        label: label,
        icon: Container(
            padding: EdgeInsetsGeometry.symmetric(vertical: 8,horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.black
            ),
            child: SvgPicture.asset("assets/icons/${iconName}.svg",color: Colors.white)
        ),
      );
    }else{
      return BottomNavigationBarItem(
        label: label,
        icon: Container(
            child: SvgPicture.asset("assets/icons/${iconName}.svg",color: Colors.black)
        ),
      );
    }
  }
}