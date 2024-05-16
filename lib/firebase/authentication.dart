import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perapal/helper/helper_function.dart';
import 'package:perapal/pages/home_page.dart';
import 'package:perapal/pages/onboarding.dart';

Future<void> signUpUser(BuildContext context, 
    TextEditingController usernameController,
    TextEditingController emailController, 
    TextEditingController passwordController,
    TextEditingController rptpasswordController) async {
      
  showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );

  if (passwordController.text != rptpasswordController.text) {
    Navigator.pop(context);
    displayMessageToUser("Passwords do not match", context);
  } else {
    try {
      UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (context.mounted) Navigator.pop(context);
      Navigator.push(context, 
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const Onboarding())
    );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }
}



void loginUser(BuildContext context,
              TextEditingController emailController, 
              TextEditingController passwordController,) async {
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

/* 
To use the IUD, use this code
 String? uid = Provider.of<AuthProvider>(context).uid;

 */


