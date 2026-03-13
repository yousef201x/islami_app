import 'package:flutter/material.dart';
import 'routes/AppRouter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.onBoardingRoute,
      routes: AppRouter().routes(),
    );
  }
}