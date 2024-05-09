import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:perapal/main.dart';
// import 'package:perapal/assets/DSC02460';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: "assets/DSC02460.png",
      nextScreen: LoginApp(),
      splashTransition: SplashTransition.fadeTransition,
      duration: 1500,
      // pageTransitionType: PageTransitionEvent(type),
      );
      
  }
}