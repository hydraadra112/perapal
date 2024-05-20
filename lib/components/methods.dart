// savings_methods.dart

import 'package:flutter/material.dart';
import 'package:perapal/firebase/interactions.dart';

Future<List<Map<String, dynamic>>> fetchSavingsGoals() async {
  final List<Map<String, dynamic>> fetchedSavingsGoals = await iudSavings();
  return fetchedSavingsGoals.map((saving) => {
    'name': saving['name'],
    'goal': (saving['goal'] as num).toDouble(),
    'saved': (saving['saved'] as num).toDouble(),
  }).toList();
}

void sortSavingsGoals(List<Map<String, dynamic>> savingsGoals, String sortCriteria, bool isAscending) {
  savingsGoals.sort((a, b) {
    int comparison;
    switch (sortCriteria) {
      case 'name':
        comparison = a['name'].compareTo(b['name']);
        break;
      case 'goal':
        comparison = a['goal'].compareTo(b['goal']);
        break;
      case 'saved':
        comparison = a['saved'].compareTo(b['saved']);
        break;
      default:
        comparison = 0;
    }
    return isAscending ? comparison : -comparison;
  });
}

void addSavingsGoal(List<Map<String, dynamic>> savingsGoals, String name, double goalAmount, double savedAmount) {
  savingsGoals.add({
    'name': name,
    'goal': goalAmount,
    'saved': savedAmount,
  });
}

void modifySavingsGoal(List<Map<String, dynamic>> savingsGoals, int index, double newGoalAmount, double newSavedAmount) {
  savingsGoals[index]['goal'] = newGoalAmount;
  savingsGoals[index]['saved'] = newSavedAmount;
  modifySavings(savingsGoals[index]['name'], newGoalAmount, newSavedAmount);
}

Future<void> deleteSavingsGoalFromList(List<Map<String, dynamic>> savingsGoals, int index) async {
  String goalName = savingsGoals[index]['name'];
  await deleteSavingsGoal(goalName);
  savingsGoals.removeAt(index);
}
