import 'package:mongo_dart/mongo_dart.dart';

class MongoDB {
  static final MongoDB _singleton = MongoDB._internal();
  late Db _db;

  factory MongoDB() {
    return _singleton;
  }

  MongoDB._internal();

  Future<void> connect() async {
    
    _db = Db("mongodb://manns:mannsperapal@10.0.2.2:27017/?authSource=perapal&authMechanism=SCRAM-SHA-256"); // For emulators
    // _db = _db = Db("mongodb://manns:manns@localhost:27017/?authSource=perapal&authMechanism=SCRAM-SHA-256/perapal"); FOR LOCALHOST

    await _db.open();
  }

  Db get db => _db;

  Future<void> close() async {
    await _db.close();
  }
}
