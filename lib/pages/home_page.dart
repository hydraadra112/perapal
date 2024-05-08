import 'package:flutter/material.dart';
import 'package:perapal/components/add_button.dart';
import 'package:perapal/pages/dashboard.dart';
import 'package:perapal/utils/style.dart';
import './budget_page.dart';
import './expense_page.dart';
import './savings_page.dart';
import 'package:perapal/components/header.dart';

class HomePage extends StatefulWidget {
        const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0; // State variable to track selected index

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

final List _pages = [

const Dashboard(),
const Expenses(),
const Budget(),
const Savings(),
];


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(child: _pages[_selectedIndex]), // Use Expanded to take remaining space
          ],
        ),
      ),
      floatingActionButton: const addButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(medium)
     ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: blue, // Customize selected item color
        unselectedItemColor: textDark, // Customize unselected item color
        backgroundColor: white,
        type: BottomNavigationBarType.fixed,
        elevation: 3,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Expense',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.savings),
            label: 'Savings',
          )
        ]
      )
     ),
    );
  }
}
