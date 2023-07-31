import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app/src/screens/create_task_screen.dart';
import 'package:tasks_app/src/widgets/checklist_body.dart';
import 'package:tasks_app/src/controllers/tasks_controller.dart';
import 'package:tasks_app/src/services/tasks_service.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TasksController(service: TasksService()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task List'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: ChecklistBody(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Consumer<TasksController>(
          builder: (context, controller, child) {
            return FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CreateTaskScreen(controller),
                ));
              },
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
