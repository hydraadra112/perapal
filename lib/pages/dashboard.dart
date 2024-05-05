import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(medium),
        child: SizedBox(
          height: large,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Balance:",
                  style: heading3,
                ),
                SizedBox(height: 5), // Adjust the spacing between text and button
                Container(
                  decoration: BoxDecoration(
                    color: blue,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                      bottom: Radius.circular(15),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                  child: Center(
                    child: Container(
                      child: Text(
                        "₱ 50 000",
                        style: heading2L,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}