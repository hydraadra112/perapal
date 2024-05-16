import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perapal/helper/helper_function.dart';
import 'package:perapal/utils/style.dart';
import 'package:perapal/components/input_box.dart';
import 'package:perapal/components/button.dart'; // Import Button widget
import 'terms_page.dart';
import './login.dart';


class SignUpPage extends StatefulWidget {
   SignUpPage({super.key});

  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {

final TextEditingController nameController = TextEditingController();
final TextEditingController usernameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController rptpasswordController = TextEditingController();

void signUpUser() async {
  showDialog(context: context,
   builder: (context) => const Center(
    child: CircularProgressIndicator(),
   ),
   );

   if (usernameController.text != rptpasswordController.text){
    Navigator.pop(context);
    displayMessageToUser("Passwords do not match", context);
   }

  else {
    try {
    UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text
      );
  Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);
    displayMessageToUser(e.code, context);
  }
  }


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: medium),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
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
                    controller: nameController,
                  ),
        
        
                  const SizedBox(height: 5),
                  CustomInputBox(
                    hintText: 'Email',
                    obscureText: false,
                    controller: emailController
                  ),
        
                  const SizedBox(height: 20),
        
                  CustomInputBox(
                    hintText: 'Username',
                    obscureText: false,
                    controller: usernameController
                  ),
                  const SizedBox(height: 5),

                  CustomInputBox(
                    hintText: 'Password',
                    obscureText: true,
                    controller: passwordController
                  ),
                  const SizedBox(height: 5),

                  CustomInputBox(
                    hintText: 'Repeat Password',
                    obscureText: true,
                    controller: rptpasswordController
                  ),
                  const SizedBox(height: 15),
                  
                  // Use the Button widget instead of ElevatedButton
                  Button(
                    buttonText: 'Sign Up',
                    onPressed: signUpUser
                  ),
                  SizedBox(
                    height: xsmall,
                  ),
        
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const TermsAndConditions()),
                      );
                    },
                    child: Text(
                      "By siging up, you agree to the Terms of Service.",
                      style: p2
                    )               
                  ),
                  
                  SizedBox(
                    height: large,
                  ),
        
                   TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
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
      ),
    );
  }
}
