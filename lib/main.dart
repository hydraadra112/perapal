import 'package:flutter/material.dart';
import './pages/home_page.dart';
import './pages/sign_up.dart';
import './utils/style.dart';
import 'package:perapal/components/input_box.dart';
import 'package:perapal/components/button.dart'; // Import LoginButton widget

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
            Text(
              "PeraPal",
              style: heading1D.copyWith(fontSize: 50),
            ),
            const Text(
              "Your friendly budgeting assistance app",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.only(top: 0, bottom: 10),
              child: Text(
                "Log in",
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: CustomInputBox(
                hintText: 'Username',
                obscureText: false,
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
            ),
            
            
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: CustomInputBox(
                hintText: 'Password',
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
            ),
            
            
            const SizedBox(height: 5),
            const Text(
              "Forgot Password?",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 105, 105, 105),
              ),
            ),
            
            
            const SizedBox(height: 20),
            Button(
              buttonText: 'Login', // Customize button text
              onPressed: () {
                if (username == correctName && password == correctPass) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
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
                    decoration: TextDecoration.underline,
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
