import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';
import './budget_box.dart'; // Import the BudgetBox widget
// import 'package:perapal/pages/budget_page.dart';

class BudgetView extends StatelessWidget {
  const BudgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Adjust the height as needed
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Budgets",
                style: heading1D,
              ),

              TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Budget()),
                    // );
                  },
                  child:Text(
                "View more...",
                style: p1,
              ),
              ),
            ],
          ),
          SizedBox(
            height: small,
          ),
          
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, int i) {
                return const BudgetBox(); // Use the BudgetBox widget here
              },
            ),
          )
        ],
      ),
    );
  }
}
