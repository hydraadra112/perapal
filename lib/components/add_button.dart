import 'package:flutter/material.dart';
/* import 'package:flutter/widgets.dart';
import 'package:perapal/components/add_budget_savings_box.dart';
import 'package:perapal/pages/savings_page.dart'; */
import 'package:perapal/utils/style.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

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
        onPressed: () => _dialogBuilder(context),
      child: Icon(
        Icons.add, 
        size: medium,
        )
        );      
  }
}


  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              "Add transactions",
              style: heading3,),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Expenses",
                  style: p2,
                  ),

                Text(
                  "Budgets",
                  style: p2,
                  ),
              ],
            ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: (){  
                    },
                    child: const Icon(Icons.money),
                    ),
                    
                   FloatingActionButton(
                    onPressed: (){  
                    },
                    child: const Icon(Icons.wallet),
                    ), 
                ],
              ),

              const SizedBox(height: 10,),

              Center(
                child: Text(
                  "Savings", 
                  style: p2,)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {} ,
                    child: const Icon(Icons.savings),
                  ),
                ],
              ),
                


                ],
        );
      },
    );
  }
                   
      