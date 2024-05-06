import 'package:flutter/material.dart';
import "package:perapal/components/total_fund.dart";
import 'package:perapal/utils/style.dart';
import 'package:perapal/components/budget_view.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

@override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(medium),
        child: Column(
          children: [
            const TotalFund(),
            SizedBox(height: large),
              const BudgetView(),
            ]
          ),
      ),
    );
    }
  }