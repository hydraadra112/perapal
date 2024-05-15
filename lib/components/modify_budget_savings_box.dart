import 'package:flutter/material.dart';

Future<void> showModifyBudgetDialog(
  BuildContext context,
  String name,
  double initialLimit,
  double initialSpent,
  Function(double, double) onModify,
) async {
  final TextEditingController limitController = TextEditingController(text: initialLimit.toString());
  final TextEditingController spentController = TextEditingController(text: initialSpent.toString());

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Modify Budget for $name'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                controller: limitController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Budget Limit'),
              ),
              TextField(
                controller: spentController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Amount Spent'),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Save'),
            onPressed: () {
              final double newLimit = double.tryParse(limitController.text) ?? initialLimit;
              final double newSpent = double.tryParse(spentController.text) ?? initialSpent;
              onModify(newLimit, newSpent);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


Future<void> showModifySavingsDialog(
  BuildContext context,
  String name,
  double initialGoalAmount,
  double initialSavedAmount,
  Function(double, double) onModify,
) async {
  final TextEditingController goalAmountController = TextEditingController(text: initialGoalAmount.toString());
  final TextEditingController savedAmountController = TextEditingController(text: initialSavedAmount.toString());

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Modify Savings Goal for $name'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                controller: goalAmountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Goal Amount'),
              ),
              TextField(
                controller: savedAmountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Saved Amount'),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Save'),
            onPressed: () {
              final double newGoalAmount = double.tryParse(goalAmountController.text) ?? initialGoalAmount;
              final double newSavedAmount = double.tryParse(savedAmountController.text) ?? initialSavedAmount;
              onModify(newGoalAmount, newSavedAmount);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

