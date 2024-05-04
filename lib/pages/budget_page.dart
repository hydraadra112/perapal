import 'package:flutter/material.dart';

class Budget extends StatelessWidget {
  const Budget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Budgeting",
        selectionColor: Colors.white,
        ),
        elevation: 0,
        backgroundColor: Colors.blue,
      )
      ,backgroundColor:Colors.orange ,
    );
    
  }
}