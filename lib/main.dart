import 'package:flutter/material.dart';
import 'routes/AppRouter.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // routing
      initialRoute: AppRouter().onBoardingRoute(),
      routes: AppRouter().routes(),
    );
  }
}