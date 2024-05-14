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
  final List<Map<String, dynamic>> budgets = [
    {'name': 'Groceries', 'limit': 500.0, 'spent': 350.0},
    {'name': 'Entertainment', 'limit': 200.0, 'spent': 150.0},
    {'name': 'Utilities', 'limit': 300.0, 'spent': 200.0},
  ];

  String _sortCriteria = 'name';
  bool _isAscending = true;

  void _sortBudgets() {
    setState(() {
      budgets.sort((a, b) {
        int comparison;
        switch (_sortCriteria) {
          case 'name':
            comparison = a['name'].compareTo(b['name']);
            break;
          case 'limit':
            comparison = a['limit'].compareTo(b['limit']);
            break;
          case 'spent':
            comparison = a['spent'].compareTo(b['spent']);
            break;
          default:
            comparison = 0;
        }
        return _isAscending ? comparison : -comparison;
      });
    });
  }

  double get totalBudget => budgets.fold(0, (prev, budget) => prev + (budget['limit'] ?? 0));
  double get totalSpent => budgets.fold(0, (prev, budget) => prev + (budget['spent'] ?? 0));
  double get totalRemaining => totalBudget - totalSpent;

  @override
  void initState() {
    super.initState();
    _sortBudgets(); // Sort initially
  }

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
            const Padding(padding: EdgeInsets.only(top: 10)),

            Row(
              // Display Total widgets side by side
              children: [
                Expanded(
                  child: CashDisplay(expenseName: "Total Spent", cashValue: totalBudget),
                ),
                const SizedBox(width: 10), // Add space between widgets
                Expanded(
                  child: CashDisplay(expenseName: "Total Remaining", cashValue: totalRemaining),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Budget Overview',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    DropdownButton<String>(
                      value: _sortCriteria,
                      onChanged: (String? newValue) {
                        setState(() {
                          _sortCriteria = newValue!;
                          _sortBudgets();
                        });
                      },
                      items: <String>['name', 'limit', 'spent']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value[0].toUpperCase() + value.substring(1)),
                        );
                      }).toList(),
                    ),
                    IconButton(
                      icon: Icon(
                        _isAscending ? Icons.arrow_upward : Icons.arrow_downward,
                      ),
                      onPressed: () {
                        setState(() {
                          _isAscending = !_isAscending;
                          _sortBudgets();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20.0),

            // Iterate over the list and create BudgetBox for each item
            for (var budget in budgets)
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: BudgetBox(
                  budgetName: budget['name'],
                  budgetLimit: budget['limit'],
                  amountSpent: budget['spent'],
                ),
              ),

            const SizedBox(height: 20.0),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  budgets.add({
                    'name': 'New Budget',
                    'limit': 1000.0,
                    'spent': 300.0,
                  });
                  _sortBudgets(); // Sort after adding new budget
                });
              },
              child: const Text('Add New Budget'),
            ),
          ],
        ),
      ),
    );
  }
}
