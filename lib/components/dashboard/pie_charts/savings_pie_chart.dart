import 'package:fl_chart/fl_chart.dart';
import 'package:perapal/utils/style.dart';
import 'package:flutter/material.dart';

class SavingsPieChart extends StatelessWidget {
  final List<Map<String, dynamic>> savings;

  const SavingsPieChart({required this.savings, super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: savings.asMap().entries.map((entry) {
          final int index = entry.key;
          final Map<String, dynamic> saving = entry.value;
          final double savedPercentage = saving['saved'] / saving['goal'];
          return PieChartSectionData(
            value: savedPercentage,
            title: '${(savedPercentage * 100).toStringAsFixed(1)}%',
            color: colorList[index],
          );
        }).toList(),
        sectionsSpace: 2,
        centerSpaceRadius: 40,
      ),
    );
  }
}
