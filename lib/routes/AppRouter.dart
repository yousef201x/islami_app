import 'package:flutter/material.dart';
import '../onboarding_screen/OnBoardingPage.dart';
import '../app_screens/main_layout.dart';
import '../app_screens/sura_details_screen.dart';

class AppRouter {
  static const String onBoardingRoute = "/onboarding";
  static const String mainLayoutRoute = "/main";
  static const String suraDetailsRoute = "/suraDetails";


  Map<String, WidgetBuilder> routes() {
    return {
      onBoardingRoute: (context) => const OnBoardingPage(),
      mainLayoutRoute: (context) => const MainLayout(),

    };
  }
}