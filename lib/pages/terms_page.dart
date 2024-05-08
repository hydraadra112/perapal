import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: white,
        title: Text(
          "Terms and Conditions",
            style: heading1D,
              ),
      ),
      body:
      Padding(
        padding: EdgeInsets.all(medium),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: medium),
              Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin feugiat magna vitae urna eleifend, at vehicula tellus pellentesque. Integer augue neque, eleifend eget quam luctus, rhoncus vulputate turpis. Nulla elementum quam ut purus lobortis, ut pellentesque ligula hendrerit. Donec sed luctus sem. Curabitur et augue id turpis sagittis tincidunt non sed dui. Duis in feugiat dui, nec posuere eros. Cras quis efficitur urna. Sed nec turpis blandit, molestie lacus rutrum, commodo lacus. \n',
              style: p1,
              ),
              Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin feugiat magna vitae urna eleifend, at vehicula tellus pellentesque. Integer augue neque, eleifend eget quam luctus, rhoncus vulputate turpis. Nulla elementum quam ut purus lobortis, ut pellentesque ligula hendrerit. Donec sed luctus sem. Curabitur et augue id turpis sagittis tincidunt non sed dui. Duis in feugiat dui, nec posuere eros. Cras quis efficitur urna. Sed nec turpis blandit, molestie lacus rutrum, commodo lacus. \n',
              style: p1,
              ),
              Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin feugiat magna vitae urna eleifend, at vehicula tellus pellentesque. Integer augue neque, eleifend eget quam luctus, rhoncus vulputate turpis. Nulla elementum quam ut purus lobortis, ut pellentesque ligula hendrerit. Donec sed luctus sem. Curabitur et augue id turpis sagittis tincidunt non sed dui. Duis in feugiat dui, nec posuere eros. Cras quis efficitur urna. Sed nec turpis blandit, molestie lacus rutrum, commodo lacus. \n',
              style: p1,
              ),
              Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin feugiat magna vitae urna eleifend, at vehicula tellus pellentesque. Integer augue neque, eleifend eget quam luctus, rhoncus vulputate turpis. Nulla elementum quam ut purus lobortis, ut pellentesque ligula hendrerit. Donec sed luctus sem. Curabitur et augue id turpis sagittis tincidunt non sed dui. Duis in feugiat dui, nec posuere eros. Cras quis efficitur urna. Sed nec turpis blandit, molestie lacus rutrum, commodo lacus. \n',
              style: p1,
              )            
          
            ],
          ),
        ),
      ),
    );
  }
}