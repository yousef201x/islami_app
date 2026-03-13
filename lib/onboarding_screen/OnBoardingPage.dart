import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/routes/AppRouter.dart';
import 'package:islami/style/AppColors.dart';

class OnBoardingPage extends StatefulWidget {
  static String routeName = "/onboarding";

  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRouter.mainLayoutRoute);
  }

  Image _onBoardingLogo() {
    return Image.asset(
      "assets/images/app_logo.png",
      width: 291,
    );
  }

  Image _onBoardingPageMainImage(int pageIndex) {
    return Image.asset(
      "assets/images/onboarding_$pageIndex.png",
      width: 398,
    );
  }

  Text onBoardingPageTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: AppColors.gold,
      ),
    );
  }

  Text onBoardingPageDescription(String description) {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.gold,
        fontSize: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0xFF202020),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Color(0xFF202020),
      allowImplicitScrolling: true,
      infiniteAutoScroll: false,
      pages: [
        // Page 1
        PageViewModel(
          titleWidget: Container(
            child: _onBoardingLogo(),
          ),
          decoration: pageDecoration,
          bodyWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _onBoardingPageMainImage(1),
              const SizedBox(height: 110),
              onBoardingPageTitle("Welcome To Islami App"),
            ],
          ),
        ),
        // Page 2
        PageViewModel(
          titleWidget: Container(
            child: _onBoardingLogo(),
          ),
          decoration: pageDecoration,
          bodyWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _onBoardingPageMainImage(2),
              const SizedBox(height: 35),
              onBoardingPageTitle("Welcome To Islami App"),
              const SizedBox(height: 50),
              onBoardingPageDescription("We Are Very Excited To Have You In Our Community"),
            ],
          ),
        ),
        // Page 3
        PageViewModel(
          titleWidget: Container(
            child: _onBoardingLogo(),
          ),
          decoration: pageDecoration,
          bodyWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _onBoardingPageMainImage(3),
              const SizedBox(height: 30),
              onBoardingPageTitle("Reading the Quran"),
              const SizedBox(height: 35),
              onBoardingPageDescription("Read, and your Lord is the Most Generous"),
            ],
          ),
        ),
        // Page 4
        PageViewModel(
          titleWidget: Container(
            child: _onBoardingLogo(),
          ),
          decoration: pageDecoration,
          bodyWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _onBoardingPageMainImage(4),
              const SizedBox(height: 35),
              onBoardingPageTitle("Bearish"),
              const SizedBox(height: 40),
              onBoardingPageDescription("Praise the name of your Lord, the Most High"),
            ],
          ),
        ),
        // Page 5
        PageViewModel(
          titleWidget: Container(
            child: _onBoardingLogo(),
          ),
          decoration: pageDecoration,
          bodyWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _onBoardingPageMainImage(5),
              const SizedBox(height: 25),
              onBoardingPageTitle("Holy Quran Radio"),
              const SizedBox(height: 25),
              onBoardingPageDescription("You can listen to the Holy Quran Radio through the application for free and easily"),
            ],
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: false,
      skipOrBackFlex: 1,
      nextFlex: 1,
      dotsFlex: 2,
      showBackButton: true,
      back: const Text('Back', style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xFFE2BE7F))),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xFFE2BE7F))),
      next: const Text('Next', style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xFFE2BE7F))),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xFFE2BE7F))),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFF707070),
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xFFE2BE7F),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onBackToIntro(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const OnBoardingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("This is the screen after Introduction"),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _onBackToIntro(context),
              child: const Text('Back to Introduction'),
            ),
          ],
        ),
      ),
    );
  }
}


