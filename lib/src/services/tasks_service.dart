import 'package:tasks_app/src/models/record.dart';
import 'package:tasks_app/src/models/task.dart';
import 'package:tasks_app/src/utils/id.dart';

abstract class TasksServiceBase {
  Future<List<Record<Task>>> fetchTasks();
  Future<void> createTask(Task task);
  Future<void> completeTask(String taskId);
}

class TasksService extends TasksServiceBase {
  final Map<String, Task> tasks = {};

  @override
  Future<List<Record<Task>>> fetchTasks({
    TaskStatus status = TaskStatus.todo,
  }) async {
    return tasks.entries
        .where((t) => t.value.status == status)
        .map((t) => Record(id: t.key, value: t.value))
        .toList();
  }

  @override
  Future<void> createTask(Task task) async {
    final id = ID.create();
    tasks.addAll({id: task});
  }

  @override
  Future<void> completeTask(String taskId) async {
    tasks.update(
      taskId,
      (t) {
        return Task.create(
          name: t.name,
          description: t.description,
          priority: t.priority,
          status: TaskStatus.done,
        );
      },
    );
  }
}
