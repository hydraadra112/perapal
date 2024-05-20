import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';
import 'package:perapal/components/button.dart';
import 'package:perapal/firebase/interactions.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<Expense> {
  List<Map<String, dynamic>> expenses = [];
  String _sortCriteria = 'date';
  bool _isAscending = false;

  @override
  void initState() {
    super.initState();
    fetchExpensesList();
  }

  Future<void> fetchExpensesList() async {
    final List<Map<String, dynamic>> fetchedExpenses = await fetchExpenses();
    setState(() {
      expenses = fetchedExpenses;
    });
  }

  void _addExpense(String budgetName, double amount, String notes) async {
    await addExpense(budgetName, amount, notes);
    fetchExpensesList();
  }

  void _deleteExpense(String expenseId) async {
    await deleteExpense(expenseId);
    fetchExpensesList();
  }

  void _sortExpenses() {
    setState(() {
      expenses.sort((a, b) {
        int comparison;
        switch (_sortCriteria) {
          case 'budgetName':
            comparison = a['budgetName'].compareTo(b['budgetName']);
            break;
          case 'amount':
            comparison = a['amount'].compareTo(b['amount']);
            break;
          default:
            // By default, sort by date
            comparison = a['date'].compareTo(b['date']);
        }
        return _isAscending ? comparison : -comparison;
      });
    });
  }

  Future<void> showAddExpenseDialog(BuildContext context, Function(String, double, String) addExpenseCallback) async {
    final TextEditingController amountController = TextEditingController();
    final TextEditingController notesController = TextEditingController();
    List<Map<String, dynamic>> budgets = []; // Variable to store fetched budgets

    // Fetch the budget names from Firestore
    await uidBudget().then((value) {
      setState(() {
        budgets = value;
      });
    });

    // If no budgets are fetched, display an error message and return
    if (budgets.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('No budgets found'),
            content: const Text('Please create a budget first.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // Variable to store the selected budget name
    String selectedBudgetName = budgets[0]['name'];

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Expense'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                DropdownButtonFormField(
                  value: selectedBudgetName,
                  items: budgets.map((budget) {
                    return DropdownMenuItem(
                      value: budget['name'],
                      child: Text(budget['name']),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedBudgetName = value.toString();
                    });
                  },
                ),
                TextField(
                  controller: amountController,
                  decoration: const InputDecoration(hintText: 'Amount'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: notesController,
                  decoration: const InputDecoration(hintText: 'Notes'),
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
                final double amount = double.parse(amountController.text);
                final String notes = notesController.text;
                addExpenseCallback(selectedBudgetName, amount, notes);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Expense Overview',
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
                          _sortExpenses();
                        });
                      },
                      items: <String>['date', 'budgetName', 'amount']
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
                          _sortExpenses();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            for (var i = 0; i < expenses.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(expenses[i]['budgetName']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Amount: \$${expenses[i]['amount']}'),
                            Text('Notes: ${expenses[i]['notes']}'),
                            Text('Date: ${expenses[i]['date']}'),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteExpense(expenses[i]['id']),
                    ),
                  ],
                  
                ),
              ),
              
              Button(
                  onPressed: () => showAddExpenseDialog(context, _addExpense),
                  buttonText: 'Add New Expense',
                ),
          ],
        ),
      ),
    );
  }
}
