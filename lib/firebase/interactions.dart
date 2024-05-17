import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addDefaultData() async {
  User? currentUser = FirebaseAuth.instance.currentUser;
  String? uid = currentUser?.uid;

  if (uid == null) {
    print('No user is currently signed in.');
    return;
  }

  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  try {
    await users.doc(uid).set({
      'budgets': [
        {
          'name': 'Sample Budget',
          'limit': 500,
          'spent': 0,
        }
      ],
      'savings': [
        {
          'name': 'Savings',
          'goal': 2500,
          'saved': 0,
        }
      ]
    }, SetOptions(merge: true)); // Merge to keep existing data
  } catch (e) {
    print('Error adding default data: $e');
  }
}
