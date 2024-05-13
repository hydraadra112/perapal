// budget_page.dart
import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';
import 'package:perapal/components/budget/budget_box.dart';
import 'package:perapal/components/cash_display.dart';

class Budget extends StatefulWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  _BudgetState createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  // List to store budget data
  List<Map<String, dynamic>> budgets = [
    {'name': 'Groceries', 'limit': 500.0, 'spent': 350.0},
    {'name': 'Entertainment', 'limit': 200.0, 'spent': 150.0},
    {'name': 'Utilities', 'limit': 300.0, 'spent': 200.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Budgeting",
          style: heading1L,
          selectionColor: textDark,
        ),
        elevation: 0,
        backgroundColor: blue,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: const EdgeInsets.only(top: 10)),

            const Row(
              // Display Total widgets side by side
              children: [
                Expanded(
                  child: CashDisplay(expenseName: "Total Budget", cashValue: 50000.0),
                ),
                SizedBox(width: 10), // Add space between widgets
                Expanded(
                  child: CashDisplay(expenseName: "Total Remaining", cashValue: 50000.0),
                ),
              ],
            ),

            const SizedBox(height: 25),
            const Text(
              'Budget Overview',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20.0),

            // ListView.builder to dynamically build BudgetBox widgets
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: budgets.length,
              itemBuilder: (context, index) {
                final budget = budgets[index];
                return BudgetBox(
                  budgetName: budget['name'],
                  budgetLimit: budget['limit'],
                  amountSpent: budget['spent'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
