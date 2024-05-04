import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Expenses",
        style: heading1L,
        selectionColor: textDark,
        ),
        elevation: 0,
        backgroundColor: red,
        automaticallyImplyLeading: false
    )
    );
    
  }
}