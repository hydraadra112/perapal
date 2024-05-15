import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';

class CashDisplay extends StatelessWidget {
  final String expenseName;
  final double cashValue;

  const CashDisplay({
    super.key,
    required this.expenseName,
    required this.cashValue,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            expenseName,
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
                "₱ $cashValue",
                style: heading2L,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
