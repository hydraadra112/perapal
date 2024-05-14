import 'package:perapal/database/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<bool> loginUser(String username, String password) async {
  try {
    final userCollection = MongoDB().db.collection('users');
    
    // Clean up username: convert to lowercase and remove whitespace
    final cleanedUsername = username.toLowerCase().trim();

    print('Attempting to log in with username: "$cleanedUsername"');

    // Find user in the database using cleaned username
    var user = await userCollection.findOne(where.eq('username', cleanedUsername));

    print('Retrieved user: $user');

    // If user exists and passwords match, return true
    if (user != null && user['password'] == password) {
      print('Login successful');
      return true;
    } else {
      print('Login failed');
      return false;
    }
  } catch (e) {
    print('Error: $e');
    return false;
  }
}
