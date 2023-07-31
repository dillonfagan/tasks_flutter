import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app/src/models/record.dart';
import 'package:tasks_app/src/controllers/tasks_controller.dart';
import 'package:tasks_app/src/widgets/task_card.dart';

import '../models/task.dart';

class ChecklistBody extends StatelessWidget {
  const ChecklistBody({super.key});

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
              return const Center(child: Text("You're all caught up!"));
            }

            return ListView.separated(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final Record<Task> t = tasks[index];
                final Task task = t.value;

                return TaskCard(
                  title: task.name,
                  description: task.description,
                  priority: task.priority,
                  onDonePressed: () async {
                    await controller.completeTask(t.id);
                  },
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
