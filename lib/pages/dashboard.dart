import 'package:flutter/material.dart';
import "package:perapal/components/cash_display.dart";
import 'package:perapal/utils/style.dart';
import 'package:perapal/components/dashboard/budget_view.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

@override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(medium),
        child: Column(
          children: [
            const CashDisplay(expenseName: "Your Balance", cashValue: 50000.0),
            SizedBox(height: large),
              const BudgetView(),
            ]
          ),
      ),
    );
    }
  }