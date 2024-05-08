import 'package:mongo_dart/mongo_dart.dart';

// Function to initialize the database by establishing and opening the connection
Future<Db> initializeDatabase() async {
  // Manns database
  final db = Db('mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.2.2');
  await db.open();
  return db;
}

// Function to get a collection from the database
DbCollection getCollection(Db db, String collectionName) {
  return db.collection(collectionName);
}

// Function to insert a document into a collection
Future<void> insertDocument(DbCollection collection, String username, String password) async {
  await collection.insert({
    'username': username,
    'password': password,
  });
}

// Function to close the database connection
Future<void> closeDatabase(Db db) async {
  await db.close();
}

// Example usage
void main() async {
  final db = await initializeDatabase();
  final collection = getCollection(db, 'users');
  await insertDocument(collection, 'example_user', 'password123');
  await closeDatabase(db);
}
