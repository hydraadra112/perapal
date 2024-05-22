import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';
import 'package:perapal/firebase/interactions.dart';
import 'package:perapal/components/dashboard/budget_pie_chart.dart';
import 'package:perapal/components/dashboard/savings_pie_chart.dart';
import 'package:perapal/components/dashboard/expenses_bar_chart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map<String, dynamic>> budgets = [];
  List<Map<String, dynamic>> savings = [];
  List<Map<String, dynamic>> expenses = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await fetchBudget();
    await fetchExpensesList();
    await fetchSavingsGoals();
  }

  Future<void> fetchBudget() async {
    final List<Map<String, dynamic>> fetchedBudgets = await uidBudget();
    setState(() {
      budgets = fetchedBudgets.map((budget) => {
        'name': budget['name'],
        'limit': (budget['limit'] as num).toDouble(),
        'spent': (budget['spent'] as num).toDouble(),
      }).toList();
    });
  }

  Future<void> fetchExpensesList() async {
    final List<Map<String, dynamic>> fetchedExpenses = await fetchExpenses();
    setState(() {
      expenses = fetchedExpenses.map((expense) => {
        'budgetName': expense['budgetName'],
        'amount': (expense['amount'] as num).toDouble(),
        'notes': expense['notes'],
        'date': expense['date'],
      }).toList();
    });
  }

  Future<void> fetchSavingsGoals() async {
    final List<Map<String, dynamic>> fetchedSavingsGoals = await uidSavings();
    setState(() {
      savings = fetchedSavingsGoals.map((saving) => {
        'name': saving['name'],
        'goal': (saving['goal'] as num).toDouble(),
        'saved': (saving['saved'] as num).toDouble(),
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Dashboard",
          style: heading1L,
          selectionColor: textDark,
        ),
        elevation: 0,
        backgroundColor: blue,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(medium),
            child: Column(
              children: [
                Text('Budgets and Savings', style: heading2D),
                SizedBox(height: medium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 200, child: BudgetPieChart(budgets: budgets)),
                          SizedBox(height: medium),
                          Legend(items: budgets.map((budget) => '${budget['name']}: ${(budget['spent'] / budget['limit'] * 100).toStringAsFixed(2)}%').toList()),
                        ],
                      ),
                    ),
                    SizedBox(width: medium),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 200, child: SavingsPieChart(savings: savings)),
                          SizedBox(height: medium),
                          Legend(items: savings.map((saving) => '${saving['name']}: ${(saving['saved'] / saving['goal'] * 100).toStringAsFixed(2)}%').toList()),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: medium),
                Text('Expenses', style: heading2D),
                SizedBox(height: 200, child: ExpensesBarChart(expenses: expenses)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Legend extends StatelessWidget {
  final List<String> items;

  const Legend({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => Text(item, style: const TextStyle(fontSize: 14))).toList(),
    );
  }
}
