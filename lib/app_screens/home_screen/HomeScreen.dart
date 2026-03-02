import 'package:flutter/material.dart';
import 'package:islami/app_screens/home_screen/HomeScreenInput.dart';
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
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

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

        body: Container(
          width: double.infinity,
          padding: EdgeInsetsGeometry.symmetric(vertical: deviceHeight*0.03,horizontal: deviceHeight*0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.appLogoPath,width: deviceWidth,height: deviceHeight*0.2),
              HomeScreenInput(),

            ]
          ),
        ),
      ),
    );
  }
}