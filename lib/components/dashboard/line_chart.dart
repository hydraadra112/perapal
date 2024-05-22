// line_chart.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpensesLineChart extends StatelessWidget {
  final List<Map<String, dynamic>> expenses;

  const ExpensesLineChart({super.key, required this.expenses});

  List<FlSpot> _generateSpots() {
    // Assuming `expenses` is sorted by date.
    List<FlSpot> spots = [];
    for (var i = 0; i < expenses.length; i++) {
      spots.add(FlSpot(i.toDouble(), (expenses[i]['amount'] as num).toDouble()));
    }
    return spots;
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: _generateSpots(),
            isCurved: true,
            barWidth: 2,
            color: Colors.blue,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.blue.withOpacity(0.3),
            ),
            dotData: const FlDotData(show: false),
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                // Showing only a few dates to avoid clutter
                if (value.toInt() % 5 == 0 && value.toInt() < expenses.length) {
                  return Text((expenses[value.toInt()]['date']).toString());
                }
                return const SizedBox();
              },
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
        ),
      ),
    );
  }
}
