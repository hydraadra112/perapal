import 'package:flutter/material.dart';
import 'package:perapal/components/cash_display.dart';
import 'package:perapal/components/savings/savings_box.dart';
import 'package:perapal/utils/style.dart';

class Savings extends StatelessWidget {
  Savings({super.key});

  // List of savings goals
  final List<Map<String, dynamic>> savingsGoals = [
    {'name': 'Car', 'goalAmount': 600000, 'savedAmount': 8000},
    {'name': 'PhilHealth', 'goalAmount': 250000, 'savedAmount': 42350},
    {'name': 'Hobby', 'goalAmount': 25000, 'savedAmount': 20350},
    // Add more savings goals here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Savings",
          style: heading1D,
          selectionColor: textLight,
        ),
        elevation: 0,
        backgroundColor: yellow,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Padding(padding: EdgeInsets.only(top: 30)),
            
              const CashDisplay(expenseName: "Total Savings", cashValue: 50000.0),

              const Padding(padding: EdgeInsets.only(top: 30)),
              
              const SizedBox(height: 14),
              const Text(
                'Savings Overview',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 20.0),
              // Iterate over the list and create SavingsBox for each item
              for (var goal in savingsGoals)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: SavingsBox(
                    goalName: goal['name'],
                    goalAmount: goal['goalAmount'],
                    savedAmount: goal['savedAmount'],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


/* 
Add syntax, apply this on function
savingsGoals.add({
  'name': 'New Goal',
  'goalAmount': 100000,
  'savedAmount': 5000,
});


 */