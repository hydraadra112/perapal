import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const Button({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0), // Square shape
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(blue), // Light blue background
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
          child: Text(
            buttonText,
            style: TextStyle(
              color: white,
              backgroundColor: blue,
            ),
          ),
        ),
      ),
    );
  }
}
