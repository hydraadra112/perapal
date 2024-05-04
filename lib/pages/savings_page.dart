import 'package:flutter/material.dart';

class Savings extends StatelessWidget {
  const Savings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Savings",
        selectionColor: Colors.white,
        ),
        elevation: 0,
        backgroundColor: Colors.blue,
      )
      ,backgroundColor:Colors.green ,
    );
    
  }
}