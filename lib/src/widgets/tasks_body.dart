import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app/src/models/record.dart';
import 'package:tasks_app/src/controllers/tasks_controller.dart';

import '../models/task.dart';

class TasksBody extends StatelessWidget {
  const TasksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksController>(
      builder: (context, controller, child) {
        return FutureBuilder(
          future: controller.fetchTasks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }

            final List<Record<Task>> tasks = snapshot.data!;

            if (tasks.isEmpty) {
              return const Center(child: Text('No tasks'));
            }

            return ListView.separated(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final Record<Task> t = tasks[index];

                return Card(
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () async {
                        await controller.completeTask(t.id);
                      },
                      icon: const Icon(Icons.circle_outlined),
                    ),
                    title: Text(
                      t.value.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    subtitle: t.value.description.isNotEmpty
                        ? Text(
                            '${t.value.description.substring(0, min(t.value.description.length, 30))}...')
                        : null,
                    trailing: PriorityIcon(t.value.priority),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              shrinkWrap: true,
            );
          },
        );
      },
    );
  }
}

class PriorityIcon extends StatelessWidget {
  const PriorityIcon(this.priority, {super.key});

  final TaskPriority priority;

  @override
  Widget build(BuildContext context) {
    Color color = priority == TaskPriority.high
        ? Colors.orange
        : priority == TaskPriority.low
            ? Colors.grey
            : Colors.transparent;

    return Icon(Icons.circle, color: color, size: 16);
  }
}
