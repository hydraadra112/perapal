import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';
import 'package:perapal/components/expenses/expense_box.dart';
import 'package:perapal/components/expenses/total_expense.dart'; 

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Expenses",
          style: heading1L,
          selectionColor: textDark,
        ),
        elevation: 0,
        backgroundColor: red,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30), // Add horizontal padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
            children: [

              Padding(padding: EdgeInsets.only(top: medium)),

              const TotalExpense(),

              Padding(padding: EdgeInsets.only(top: medium)),

              // First date collection with three expense boxes
              _buildDateSection("01/01/2024", 5),

              Padding(padding: EdgeInsets.only(top: medium)),

              // Second date collection with three expense boxes
              _buildDateSection("02/01/2024", 1),

              Padding(padding: EdgeInsets.only(top: medium)),

              // Third date collection with three expense boxes
              _buildDateSection("03/01/2024", 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateSection(String date, int numOfExpenseBoxes) {
    List<Widget> expenseBoxes = List.generate(numOfExpenseBoxes, (index) => ExpenseBox(
      budgetName: "Budget ${index + 1}", 
      amountRemaining: "Amount ${index + 1}"
    ));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align date text to the start (left)
      children: [
        Text(
          date,
          style: heading2D,
        ),
        const SizedBox(height: 10), // Spacer
        Column(
          children: expenseBoxes,
        ),
      ],
    );
  }
}
