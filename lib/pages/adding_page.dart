import 'package:flutter/material.dart';

class AddingPage extends StatelessWidget {
  const AddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.attach_money), 
              onPressed: () {  }, 
              label: Text("Add expense")
              ),

            ElevatedButton.icon(
              icon: Icon(Icons.wallet), 
              onPressed: () {  }, 
              label: Text("Add budget")
              ),

            ElevatedButton.icon(
              icon: Icon(Icons.house), 
              onPressed: () {  }, 
              label: Text("Add savings")
              ),              
          ]
          ,)
         )
      );

  }
}