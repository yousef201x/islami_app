import 'package:flutter/material.dart';
import 'package:islami/onboarding_screen/OnBoardingPage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnBoardingPage(),
    );
  }
}