import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perapal/utils/style.dart';

class BudgetView extends StatelessWidget {
  const BudgetView ({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Adjust the height as needed
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Budgets",
              style: heading1D,
              ), 
          
              Text("View more...",
              style: p1
              ),
              ]
          ),
          SizedBox(
            height: small,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, int i) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: small
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: textLight,
                      borderRadius: BorderRadius.circular(small)
                    ),
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
                                  color: blueLight,
                                  shape: BoxShape.circle
                                ),
                              ), 
                          
                              SizedBox(width: 
                              small,
                              ),
                              
                              Text("Budget 1",
                              style: heading4,
                              ),
                        
                            ],
                          ),
                              Column(
                                children: [
                                  Text("amount remaining",
                                  style: p2,
                                  ),                          
                                ],
                              ),
                        ],                       
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}