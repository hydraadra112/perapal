import 'package:flutter/material.dart';
import '../main.dart';


class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {

  String username = "";
  String password = "";

  String name = "";
  String email = "";
  String rptpassword = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              const Padding(
                 padding: EdgeInsets.only(top:35)
              ),
              
              const Text(
              "PeraPal",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                fontFamily: 'Times New Roman'
              ),
            ),

              const Text(
              "Your friendly budgeting assistance app",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),

              const Padding(
              padding: EdgeInsets.only(top:5, bottom:20),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),

            const SizedBox(height: 5),

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Name',
                    filled: true, // Set to true to enable background color
                    fillColor: Color.fromARGB(255, 231, 231, 231), // Set the background color
                    border: OutlineInputBorder( // Customize border
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide.none, // No border side
                    ),
                  ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                obscureText: false,
              ),
            ),

          const SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Email',
                    filled: true, // Set to true to enable background color
                    fillColor: Color.fromARGB(255, 231, 231, 231), // Set the background color
                    border: OutlineInputBorder( // Customize border
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide.none, // No border side
                    ),
                  ),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                obscureText: false,
              ),
            ),

              const SizedBox(
                height: 20.0,
              ),

              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Username',
                    filled: true, // Set to true to enable background color
                    fillColor: Color.fromARGB(255, 231, 231, 231), // Set the background color
                    border: OutlineInputBorder( // Customize border
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide.none, // No border side
                    ),
                  ),
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                obscureText: false,
              ),
            ),

            const SizedBox(
                height: 5.0,
              ),

              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Password',
                    filled: true, // Set to true to enable background color
                    fillColor: Color.fromARGB(255, 231, 231, 231), // Set the background color
                    border: OutlineInputBorder( // Customize border
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide.none, // No border side
                    ),
                  ),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
              ),
            ),

            const SizedBox(
                height: 5.0,
              ),

              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Repeat Password',
                    filled: true, // Set to true to enable background color
                    fillColor: Color.fromARGB(255, 231, 231, 231), // Set the background color
                    border: OutlineInputBorder( // Customize border
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide.none, // No border side
                    ),
                  ),
                onChanged: (value) {
                  setState(() {
                    rptpassword = value;
                  });
                },
                obscureText: true,
              ),
            ),
              
              const SizedBox(
                height: 15.0,
              ),
          
          ElevatedButton(
          onPressed: () {
            if (name.isEmpty || email.isEmpty || username.isEmpty || password.isEmpty || rptpassword.isEmpty) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Incomplete Fields'),
                    content: const Text('Please fill in all the fields.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } else if (password != rptpassword) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Password Mismatch'),
                    content: const Text('The password and repeated password do not match.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } else {
              // Redirect to LoginPageApp
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            }
          },
          child: Text('Sign Up'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 78, 184, 233),
            foregroundColor: Colors.white, // Set text color
          ),
        ),


          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: const Text(
              "Back to Login Page.",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 10, 10, 10),
                decoration: TextDecoration.underline, // Add underline
              ),
            ),
          ),
            ],
          ),
        ),
        )
      ),
    );
  }
}
