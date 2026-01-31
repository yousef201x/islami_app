import 'package:flutter/material.dart';
import 'onboarding_screen/OnBoardingPage.dart';

class Router {
  String onBoardingPageRoute(){
    return "/onboarding";
  }

  Map<String,Widget> routes(){
    return {
      this.onBoardingPageRoute(): OnBoardingPage(),
    };
  }
}