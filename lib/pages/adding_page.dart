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
              icon: const Icon(Icons.attach_money), 
              onPressed: () {  }, 
              label: const Text("Add expense")
              ),

            ElevatedButton.icon(
              icon: const Icon(Icons.wallet), 
              onPressed: () {  }, 
              label: const Text("Add budget")
              ),

            ElevatedButton.icon(
              icon: const Icon(Icons.house), 
              onPressed: () {  }, 
              label: const Text("Add savings")
              ),              
          ]
          ,)
         )
      );

  }
}