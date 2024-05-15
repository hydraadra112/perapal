import 'package:flutter/material.dart';

Future<void> showAddBudgetDialog(BuildContext context, Function(String, double, double) onAdd) async {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController limitController = TextEditingController();
  final TextEditingController spentController = TextEditingController();

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add New Budget'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Budget Name'),
              ),
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
            child: const Text('Add'),
            onPressed: () {
              final String name = nameController.text;
              final double limit = double.tryParse(limitController.text) ?? 0.0;
              final double spent = double.tryParse(spentController.text) ?? 0.0;
              onAdd(name, limit, spent);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


Future<void> showAddSavingsDialog(BuildContext context, Function(String, double, double) onAdd) async {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController goalController = TextEditingController();
  final TextEditingController savedController = TextEditingController();

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add New Savings Goal'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Savings Goal Name'),
              ),
              TextField(
                controller: goalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Goal Amount'),
              ),
              TextField(
                controller: savedController,
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
            child: const Text('Add'),
            onPressed: () {
              final String name = nameController.text;
              final double goalAmount = double.tryParse(goalController.text) ?? 0.0;
              final double savedAmount = double.tryParse(savedController.text) ?? 0.0;
              onAdd(name, goalAmount, savedAmount);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}




