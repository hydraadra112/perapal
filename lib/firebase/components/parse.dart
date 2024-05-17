List<Map<String, dynamic>> parseBudgets(List<dynamic> budgetsData) {
  List<Map<String, dynamic>> parsedBudgets = [];

  for (var budget in budgetsData) {
    parsedBudgets.add({
      'name': budget['name'],
      'limit': budget['limit'],
      'spent': budget['spent'],
    });
  }

  return parsedBudgets;
}


List<Map<String, dynamic>> parseSavings(List<dynamic> savingsData) {
  List<Map<String, dynamic>> parsedSavings = [];

  for (var saving in savingsData) {
    parsedSavings.add({
      'name': saving['name'],
      'goalAmount': saving['goal'],
      'savedAmount': saving['saved'],
    });
  }

  return parsedSavings;
}