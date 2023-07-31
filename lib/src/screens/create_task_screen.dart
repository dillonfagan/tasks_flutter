import 'package:flutter/material.dart';
import 'package:tasks_app/src/models/task.dart';
import 'package:tasks_app/src/controllers/tasks_controller.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen(this.controller, {super.key});

  final TasksController controller;

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final nameController = TextEditingController(text: 'New Task');
  final descriptionController = TextEditingController();

  TaskPriority priority = TaskPriority.medium;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField(
              value: TaskPriority.medium,
              items: const [
                DropdownMenuItem(
                  value: TaskPriority.low,
                  child: Text('Low'),
                ),
                DropdownMenuItem(
                  value: TaskPriority.medium,
                  child: Text('Medium'),
                ),
                DropdownMenuItem(
                  value: TaskPriority.high,
                  child: Text('High'),
                ),
              ],
              onChanged: (value) {
                priority = value ?? TaskPriority.medium;
              },
              decoration: const InputDecoration(
                labelText: 'Priority',
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          widget.controller
              .createTask(Task(
                name: nameController.text,
                status: TaskStatus.todo,
                priority: priority,
                description: descriptionController.text,
              ))
              .whenComplete(() => Navigator.of(context).pop());
        },
        label: const Text('Create Task'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
