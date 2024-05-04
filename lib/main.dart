import 'package:flutter/material.dart';
import './pages/dashboard.dart';
import './pages/sign_up.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  String correctName = "admin";
  String correctPass = "password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

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

            const SizedBox(height: 50),

            const Padding(
              padding: EdgeInsets.only(top:0, bottom:10),
              child: Text(
                "Log in",
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
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
                ),
              ),

            const SizedBox(height: 5),
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

            // FOR NOW DISPLAY LANG KAY UNSURE IF WE WUD IMPLEMENT FORGOT PASSWORD
            const SizedBox(height: 5),
            const Text(
              "Forgot Password?",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 105, 105, 105),
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () {
                  if (username == correctName && password == correctPass) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Dashboard(),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return  AlertDialog(
                          title: const Text("Invalid Credentials"),
                          content: const Text("Please enter correct username and password."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0), // Square shape
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 78, 184, 233)), // Light blue background
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                  child: Text('Login', 
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: Color.fromARGB(255, 78, 184, 233)
                  )
                  ),
                ),
              ),
            ),


            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ),
                  );
                },
                child: const Text(
                  "No account yet? Sign up.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 10, 10, 10),
                    decoration: TextDecoration.underline, // Add underline
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}