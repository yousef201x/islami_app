import 'package:flutter/material.dart';
import 'package:islami/app_screens/home_screen/HomeScreen.dart';
import '../onboarding_screen/OnBoardingPage.dart';

class AppRouter {
  String onBoardingRoute(){
    return OnBoardingPage.routeName;
  }

  Widget homeScreenRouteWidget(){
    return HomeScreen();
  }

  Map<String,WidgetBuilder> routes(){
    return {
      OnBoardingPage.routeName : (context) => OnBoardingPage(),
      HomeScreen.routeName : (context) => HomeScreen(),
    };
  }
}