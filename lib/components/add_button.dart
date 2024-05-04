import 'package:flutter/material.dart';
import 'package:perapal/pages/adding_page.dart';

class addButton extends StatelessWidget {
  const addButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton (child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
         
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

                   
      