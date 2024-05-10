import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:perapal/pages/splash_screen.dart';


void main() {
  debugPaintSizeEnabled = false;
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
