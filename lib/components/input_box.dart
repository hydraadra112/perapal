import 'package:flutter/material.dart';

class CustomInputBox extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Function(String) onChanged;

  const CustomInputBox({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: const Color.fromARGB(255, 231, 231, 231),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: onChanged,
        obscureText: obscureText,
      ),
    );
  }
}
