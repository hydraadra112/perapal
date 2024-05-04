import 'package:flutter/material.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Expenses",
        selectionColor: Colors.white,
        ),
        elevation: 0,
        backgroundColor: Colors.blue,
      )
      ,backgroundColor:Colors.purple ,
    );
    
  }
}