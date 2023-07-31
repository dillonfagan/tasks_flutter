import 'package:flutter/material.dart';
import 'package:tasks_app/src/models/record.dart';
import 'package:tasks_app/src/services/tasks_service.dart';

import '../models/task.dart';

class TasksController extends ChangeNotifier {
  TasksController({required this.service});

  final TasksServiceBase service;

  Future<List<Record<Task>>> fetchTasks() async {
    return await service.fetchTasks();
  }

  Future<void> createTask(Task task) async {
    await service.createTask(task);
    notifyListeners();
  }

  Future<void> completeTask(String taskId) async {
    await service.completeTask(taskId);
    notifyListeners();
  }
}
