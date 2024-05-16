import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perapal/components/input_box.dart';
import 'package:perapal/components/button.dart';
import 'package:perapal/pages/home_page.dart';
import 'package:perapal/utils/style.dart';
import './sign_up.dart';
import 'package:perapal/helper/helper_function.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();


void loginUser() async {
  showDialog(context: context, 
  builder: (context) => const Center(
    child: CircularProgressIndicator(),
   ),
   );

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text);
      
    if (context.mounted) Navigator.pop(context);
    Navigator.push(context, 
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const HomePage())
    );
  } 

  on FirebaseAuthException catch (e) {

    Navigator.pop(context);
    displayMessageToUser(e.code, context);
  }
  
}

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
            Text(
              "Your friendly budgeting assistance app",
              style: p2,
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
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: CustomInputBox(
                hintText: 'Email',
                obscureText: false,
                controller: emailController,
              ),
            ),
            
            
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: CustomInputBox(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController,
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
              onPressed: loginUser,
            ),
            
            SizedBox(height: 20),
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
