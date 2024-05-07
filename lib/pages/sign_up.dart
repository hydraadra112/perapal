import 'package:flutter/material.dart';
import '../main.dart';
import 'package:perapal/utils/style.dart';
import 'package:perapal/components/input_box.dart';
import 'package:perapal/components/button.dart'; // Import Button widget

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                const Padding(padding: EdgeInsets.only(
                  top: 20,
                )
                ),

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
                
                
                const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 5),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                
                const SizedBox(height: 8),
                
                CustomInputBox(
                  hintText: 'Name',
                  obscureText: false,
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),


                const SizedBox(height: 5),
                CustomInputBox(
                  hintText: 'Email',
                  obscureText: false,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),

                const SizedBox(height: 20),

                CustomInputBox(
                  hintText: 'Username',
                  obscureText: false,
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                ),
                const SizedBox(height: 5),
                CustomInputBox(
                  hintText: 'Password',
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                const SizedBox(height: 5),
                CustomInputBox(
                  hintText: 'Repeat Password',
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      rptpassword = value;
                    });
                  },
                ),
                const SizedBox(height: 15),
                
                // Use the Button widget instead of ElevatedButton
                Button(
                  buttonText: 'Sign Up',
                  onPressed: () {
                    if (name.isEmpty ||
                        email.isEmpty ||
                        username.isEmpty ||
                        password.isEmpty ||
                        rptpassword.isEmpty) {

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Incomplete Fields'),
                            content:
                                const Text('Please fill in all the fields.'),
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
                            content: const Text(
                                'The password and repeated password do not match.'),
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
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  },
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
                      decoration: TextDecoration.underline,
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
