import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';

class ExpenseBox extends StatelessWidget {
  final String budgetName;
  final String amountRemaining;

  const ExpenseBox({
    super.key,
    required this.budgetName,
    required this.amountRemaining,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add your desired action here when the box is clicked
        // For now, do nothing
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: xsmall),
        child: Container(
          decoration: BoxDecoration(
            color: textLight,
            borderRadius: BorderRadius.circular(small),
          ),
          child: Padding(
            padding: EdgeInsets.all(xsmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: large,
                      height: large,
                      decoration: BoxDecoration(
                        color: blueLight,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: small),
                    Text(
                      budgetName,
                      style: heading4,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      amountRemaining,
                      style: p2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
