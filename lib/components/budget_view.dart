import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';
import '../components/budget_box.dart'; // Import the BudgetBox widget

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
              Text(
                "View more...",
                style: p1,
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
