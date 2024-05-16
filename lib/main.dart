import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:perapal/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:perapal/firebase/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPaintSizeEnabled = false;
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(), // Wil eventually lead to login page
      )
    );
  }
}

class AuthProvider extends ChangeNotifier {
  String? _uid;

  String? get uid => _uid;

  void setUid(String? newUid) {
    _uid = newUid;
    notifyListeners();
  }
}


/* 
To use the IUD, use this code
 String? uid = Provider.of<AuthProvider>(context, listen: false).uid;

 */