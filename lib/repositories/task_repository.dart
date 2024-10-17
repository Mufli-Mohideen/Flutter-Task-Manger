import 'package:sqflite/sqflite.dart';
import '../models/task_model.dart';
import '../services/database_service.dart';

class TaskRepository {
  Future<int> insertTask(Task task) async {
    final Database db = await DatabaseService.initDB();
    return db.insert('tasks', task.toMap());
  }

  Future<List<Task>> getTasks() async {
    final Database db = await DatabaseService.initDB();
    final List<Map<String, dynamic>> maps = await db.query('tasks');

    return List.generate(maps.length, (i) {
      return Task.fromMap(maps[i]);
    });
  }

  Future<int> updateTask(Task task) async {
    final db = await DatabaseService.initDB();
    return db
        .update('tasks', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  }

  Future<int> deleteTask(int id) async {
    final db = await DatabaseService.initDB();
    return db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
