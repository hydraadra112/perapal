import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';

class Budget extends StatelessWidget {
  const Budget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Budgeting",
        style: heading1L,
        selectionColor: textDark,
        ),
        elevation: 0,
        backgroundColor: blue,
        automaticallyImplyLeading: false
    )
    );
    
  }
}