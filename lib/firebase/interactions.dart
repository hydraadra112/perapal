import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:perapal/firebase/components/parse.dart';

Future<void> addDefaultData() async {
  User? currentUser = FirebaseAuth.instance.currentUser;
  String? uid = currentUser?.uid;

  if (uid == null) {
    if (kDebugMode) {
      print('No user is currently signed in.');
    }
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
    if (kDebugMode) {
      print('Error adding default data: $e');
    }
  }
}


Future<List<Map<String, dynamic>>> iudBudget() async {
  User? currentUser = FirebaseAuth.instance.currentUser;
  String? uid = currentUser?.uid;

  if (uid == null) {
    if (kDebugMode) {
      print('No user is currently signed in.');
    }
    return [];
  }

  final DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(uid);

  try {
    DocumentSnapshot docSnapshot = await userDoc.get();

    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;

      if (data != null && data.containsKey('budgets')) {
        return parseBudgets(data['budgets']);
      } else {
        if (kDebugMode) {
          print('No budget data found for the current user.');
        }
        return [];
      }
    } else {
      if (kDebugMode) {
        print('No data found for the current user.');
      }
      return [];
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching budget data: $e');
    }
    return [];
  }
}


Future<List<Map<String, dynamic>>> iudSavings() async {
  User? currentUser = FirebaseAuth.instance.currentUser;
  String? uid = currentUser?.uid;

  if (uid == null) {
    if (kDebugMode) {
      print('No user is currently signed in.');
    }
    return [];
  }

  final DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(uid);

  try {
    DocumentSnapshot docSnapshot = await userDoc.get();

    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;

      if (data != null && data.containsKey('savings')) {
        return (data['savings'] as List<dynamic>)
            .map((item) => {
              'name': item['name'],
              'goal': item['goal'],
              'saved': item['saved'],
            })
            .toList();
      } else {
        if (kDebugMode) {
          print('No savings data found for the current user.');
        }
        return [];
      }
    } else {
      if (kDebugMode) {
        print('No data found for the current user.');
      }
      return [];
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching savings data: $e');
    }
    return [];
  }
}

Future<void> addBudget(String name, double limit, double spent) async {
  User? currentUser = FirebaseAuth.instance.currentUser;
  String? uid = currentUser?.uid;

  if (uid == null) {
    if (kDebugMode) {
      print('No user is currently signed in.');
    }
    return;
  }

  final DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(uid);

  try {
    await userDoc.update({
      'budgets': FieldValue.arrayUnion([
        {
          'name': name,
          'limit': limit,
          'spent': spent,
        }
      ])
    });
    if (kDebugMode) {
      print('Budget added successfully.');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error adding budget: $e');
    }
  }
}

Future<void> addSavingsGoal(String name, double goal, double saved) async {
  User? currentUser = FirebaseAuth.instance.currentUser;
  String? uid = currentUser?.uid;

  if (uid == null) {
    if (kDebugMode) {
      print('No user is currently signed in.');
    }
    return;
  }

  final DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(uid);

  try {
    await userDoc.update({
      'savings': FieldValue.arrayUnion([
        {
          'name': name,
          'goal': goal,
          'saved': saved,
        }
      ])
    });
    if (kDebugMode) {
      print('Savings goal added successfully.');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error adding savings goal: $e');
    }
  }
}


