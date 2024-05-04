import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';

class Savings extends StatelessWidget {
  const Savings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Savings",
        style: heading1D,
        selectionColor: textLight,
        ),
        elevation: 0,
        backgroundColor: yellow,
        automaticallyImplyLeading: false
    )
    );
    
  }
}