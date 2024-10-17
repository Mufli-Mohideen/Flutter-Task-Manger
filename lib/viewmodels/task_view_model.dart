import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../repositories/task_repository.dart';

class TaskViewModel with ChangeNotifier {
  List<Task> tasks = [];
  final TaskRepository _taskRepository = TaskRepository();

  Future<void> loadTasks() async {
    tasks = await _taskRepository.getTasks();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await _taskRepository.insertTask(task);
    loadTasks();
  }

  Future<void> updateTask(Task task) async {
    await _taskRepository.updateTask(task);
    loadTasks();
  }

  Future<void> deleteTask(Task task) async {
    if (task.id != null) {
      await _taskRepository.deleteTask(task.id!);
      loadTasks();
    } else {
      print("Task ID is null");
    }
  }
}
