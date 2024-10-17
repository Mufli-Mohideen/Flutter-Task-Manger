import 'package:sqflite/sqflite.dart';
import '../models/user_model.dart';
import '../services/database_service.dart';

class UserRepository {
  Future<int> registerUser(User user) async {
    final Database db = await DatabaseService.initDB();
    return db.insert('users', user.toMap());
  }

  Future<User?> loginUser(String username, String password) async {
    final Database db = await DatabaseService.initDB();
    final List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    } else {
      return null;
    }
  }
}
