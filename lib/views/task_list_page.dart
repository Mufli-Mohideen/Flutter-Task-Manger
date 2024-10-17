import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../viewmodels/task_view_model.dart';

class TaskListPage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000435),
      appBar: AppBar(
        title: Text(
          "Tasks",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Color.fromARGB(255, 27, 32, 92),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<TaskViewModel>(
              builder: (context, taskViewModel, child) {
                return ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: taskViewModel.tasks.length,
                  itemBuilder: (context, index) {
                    Task task = taskViewModel.tasks[index];
                    return Card(
                      color: task.isComplete
                          ? const Color.fromARGB(255, 2, 133, 9)
                          : Color.fromARGB(255, 27, 32, 92),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(
                          task.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          task.description,
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Checkbox for marking task as complete
                            Checkbox(
                              value: task.isComplete,
                              onChanged: (value) {
                                task.isComplete = value!;
                                taskViewModel.updateTask(task);
                              },
                              activeColor: Colors.greenAccent,
                              checkColor: Colors.black,
                              side: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            IconButton(
                              icon:
                                  Icon(Icons.edit, color: Colors.orangeAccent),
                              onPressed: () {
                                _showEditTaskDialog(
                                    context, task, taskViewModel);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.redAccent),
                              onPressed: () {
                                taskViewModel.deleteTask(task);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF3A3A55),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF3A3A55),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      String title = _titleController.text;
                      String description = _descriptionController.text;
                      if (title.isNotEmpty && description.isNotEmpty) {
                        Task task =
                            Task(title: title, description: description);
                        Provider.of<TaskViewModel>(context, listen: false)
                            .addTask(task);
                        _titleController.clear();
                        _descriptionController.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Add Task",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showEditTaskDialog(
      BuildContext context, Task task, TaskViewModel taskViewModel) {
    final TextEditingController _editTitleController =
        TextEditingController(text: task.title);
    final TextEditingController _editDescriptionController =
        TextEditingController(text: task.description);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _editTitleController,
                decoration: InputDecoration(
                  labelText: "Title",
                ),
              ),
              TextField(
                controller: _editDescriptionController,
                decoration: InputDecoration(
                  labelText: "Description",
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                String newTitle = _editTitleController.text;
                String newDescription = _editDescriptionController.text;
                if (newTitle.isNotEmpty && newDescription.isNotEmpty) {
                  task.title = newTitle;
                  task.description = newDescription;
                  taskViewModel.updateTask(task);
                  Navigator.pop(context);
                }
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
