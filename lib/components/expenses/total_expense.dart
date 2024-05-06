import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';

class TotalExpense extends StatelessWidget {
  const TotalExpense({super.key});

@override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Expenses:",
                style: heading3,
              ),
              const SizedBox(
                height: 5,
                ), // Adjust the spacing between text and button
              Container(
                decoration: BoxDecoration(
                  color: blue,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                    bottom: Radius.circular(15),
                  ),
                ),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 6,
                child: Center(
                  child: Text(
                    "₱ 50 000",
                    style: heading2L,
                  ),
                ),
              ),
            ],
        ),
    );
  }
}