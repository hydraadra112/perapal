import 'package:flutter/material.dart';
import 'package:perapal/pages/adding_page.dart';
import 'package:perapal/utils/style.dart';

class addButton extends StatelessWidget {
  const addButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton (child: Icon(Icons.add),
        foregroundColor: white,
        backgroundColor: blue,
        shape: const CircleBorder(),
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const AddingPage()),
              ); 
        }
        );      
  }
}

                   
      