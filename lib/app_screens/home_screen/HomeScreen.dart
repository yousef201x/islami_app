import 'package:flutter/material.dart';
import 'package:islami/components/AppBottomBar.dart';
import 'package:islami/style/AppImages.dart';

class HomeScreen extends StatefulWidget{
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AppImages.backgroundImage,fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: AppBottomBar(activeIndex: this.screenIndex, onTap: (index) {
          setState(() {
          });
        },),
      ),
    );
  }
}