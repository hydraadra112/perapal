import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';

class BudgetBox extends StatelessWidget {
  const BudgetBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add your desired action here when the box is clicked
        // For now, do nothing
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: small),
        child: Container(
          decoration: BoxDecoration(
              color: textLight, borderRadius: BorderRadius.circular(small)),
          child: Padding(
            padding: EdgeInsets.all(small),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: large,
                      height: large,
                      decoration: BoxDecoration(
                          color: blueLight, shape: BoxShape.circle),
                    ),
                    SizedBox(
                      width: small,
                    ),
                    Text(
                      "Budget 1",
                      style: heading4,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "amount remaining",
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
