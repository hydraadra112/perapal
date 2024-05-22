import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpensesBarChart extends StatelessWidget {
  final List<Map<String, dynamic>> expenses;

  const ExpensesBarChart({required this.expenses, Key? key}) : super(key: key); // Corrected super.key

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: expenses.map((expense) {
          return BarChartGroupData(
            x: expenses.indexOf(expense), // This line is fine as it is
            barRods: [
              BarChartRodData(
                toY: (expense['amount'] as num).toDouble(), // Corrected to use 'value'
                color: Colors.blue, // This line is fine as it is
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
