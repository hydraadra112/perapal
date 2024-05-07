// budget_page.dart
import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';
import 'package:perapal/components/budget/budget_box.dart';
import 'package:perapal/components/cash_display.dart';

class Budget extends StatelessWidget {
  const Budget({super.key});

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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(padding: EdgeInsets.only(top: 10)),

             Row( // Display Total widgets side by side
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


              SizedBox(height: 25),
              Text(
                'Budget Overview',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20.0),
              BudgetBox(
                budgetName: 'Groceries',
                budgetLimit: 500.0,
                amountSpent: 350.0,
              ),

              SizedBox(height: 20.0),
              BudgetBox(
                budgetName: 'Entertainment',
                budgetLimit: 200.0,
                amountSpent: 150.0,
              ),

              SizedBox(height: 20.0),
              BudgetBox(
                budgetName: 'Utilities',
                budgetLimit: 300.0,
                amountSpent: 200.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
