import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:perapal/firebase/auth.dart';


class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/logo.png',  
      nextScreen: const AuthPage(),
      splashTransition: SplashTransition.fadeTransition,
      duration: 1200,
      );
      
  }
}