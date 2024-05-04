import 'package:flutter/material.dart';
import './adding_page.dart';
import './budget_page.dart';
import './expense_page.dart';
import './savings_page.dart';

class Dashboard extends StatefulWidget {
        const Dashboard({super.key});


  @override
  State<Dashboard> createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard> {

  int _selectedIndex = 0; // State variable to track selected index

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

final List _pages = [

const Expenses(),
const Budget(),
const Savings(),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
          centerTitle: true,
          title: const Text("PeraPal", 
          selectionColor: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 200,
          actions: [IconButton(onPressed: () {},
          icon: const Icon(Icons.help)
          )
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const DrawerHeader(
                child: Text("PeraPal")                             
              ),
  
              ListTile(
                leading: const Icon(Icons.account_box),
                title: const Text("Account"),
                onTap: () {},
              ),

              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {},
              ),

              ListTile(
                leading: const Icon(Icons.file_copy),
                title: const Text("Terms and Conditions"),
                onTap: () {},
              ),
              
           ],
          ),
        ),
          floatingActionButton: FloatingActionButton (child: Icon(Icons.add),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
           
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const AddingPage()),
                );
          }         
          ),
          body: _pages[_selectedIndex],
         
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: BottomNavigationBar(   
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,      
          items: const [
            // BottomNavigationBarItem(
            //   backgroundColor: Colors.blue,              
            //   icon: Icon(Icons.home),
            //   label: 'Home',
            //   ),

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
 
          ),
    );
  }
}