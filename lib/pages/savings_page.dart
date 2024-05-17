import 'package:flutter/material.dart';
import 'package:perapal/components/cash_display.dart';
import 'package:perapal/components/savings/savings_box.dart';
import 'package:perapal/utils/style.dart';
import 'package:perapal/components/add_budget_savings_box.dart';
import 'package:perapal/components/modify_budget_savings_box.dart';
import 'package:perapal/components/button.dart';

class Savings extends StatefulWidget {
  const Savings({super.key});

  @override
  _SavingsState createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {
  // List of savings goals
  final List<Map<String, dynamic>> savingsGoals = [
    {'name': 'Car', 'goalAmount': 600000.0, 'savedAmount': 8000.0},
    {'name': 'PhilHealth', 'goalAmount': 250000.0, 'savedAmount': 42350.0},
    {'name': 'Hobby', 'goalAmount': 25000.0, 'savedAmount': 20350.0},
  ];

  String _sortCriteria = 'name';
  bool _isAscending = true;

  double get totalSavedAmount =>
      savingsGoals.fold(0, (prev, goal) => prev + (goal['savedAmount'] ?? 0));

  void _sortSavingsGoals() {
    setState(() {
      savingsGoals.sort((a, b) {
        int comparison;
        switch (_sortCriteria) {
          case 'name':
            comparison = a['name'].compareTo(b['name']);
            break;
          case 'goalAmount':
            comparison = a['goalAmount'].compareTo(b['goalAmount']);
            break;
          case 'savedAmount':
            comparison = a['savedAmount'].compareTo(b['savedAmount']);
            break;
          default:
            comparison = 0;
        }
        return _isAscending ? comparison : -comparison;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _sortSavingsGoals(); // Sort initially
  }

  void _addSavingsGoal(String name, double goalAmount, double savedAmount) {
    setState(() {
      savingsGoals.add({
        'name': name,
        'goalAmount': goalAmount,
        'savedAmount': savedAmount,
      });
      _sortSavingsGoals(); // Sort after adding new savings goal
    });
  }

  void _modifySavingsGoal(int index, double newGoalAmount, double newSavedAmount) {
    setState(() {
      savingsGoals[index]['goalAmount'] = newGoalAmount;
      savingsGoals[index]['savedAmount'] = newSavedAmount;
      _sortSavingsGoals(); // Sort after modifying savings goal
    });
  }

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

              CashDisplay(
                expenseName: "Total Savings",
                cashValue: totalSavedAmount,
              ),

              const Padding(padding: EdgeInsets.only(top: 30)),

              const SizedBox(height: 14),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Savings Overview',
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
                            _sortSavingsGoals();
                          });
                        },
                        items: <String>['name', 'goalAmount', 'savedAmount']
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
                            _sortSavingsGoals();
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Iterate over the list and create SavingsBox for each item
              for (var i = 0; i < savingsGoals.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: GestureDetector(
                    onTap: () => showModifySavingsDialog(
                      context,
                      savingsGoals[i]['name'],
                      savingsGoals[i]['goalAmount'],
                      savingsGoals[i]['savedAmount'],
                      (newGoalAmount, newSavedAmount) => _modifySavingsGoal(i, newGoalAmount, newSavedAmount),
                    ),
                    child: SavingsBox(
                      goalName: savingsGoals[i]['name'],
                      goalAmount: savingsGoals[i]['goalAmount'],
                      savedAmount: savingsGoals[i]['savedAmount'],
                    ),
                  ),
                ),

              const SizedBox(height: 20.0),
          
              Button(
              onPressed: () => showAddBudgetDialog(context, _addSavingsGoal),
              buttonText: 'Add New Savings',
            ),
            ],
          ),
        ),
      ),
    );
  }
}
