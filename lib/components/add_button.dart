import 'package:flutter/material.dart';
import 'package:perapal/pages/adding_page.dart';
import 'package:perapal/utils/style.dart';

class addButton extends StatelessWidget {
  const addButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton (
      foregroundColor: white,
        backgroundColor: blue,
        shape: StadiumBorder(
          side: BorderSide(
          color: textLight,
        width: 4),
        ),
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const AddingPage()),
              ); 
        },
      child: Icon(Icons.add, 
        size: medium,)
        );      
  }
}

                   
      