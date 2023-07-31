import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app/src/screens/create_task_screen.dart';
import 'package:tasks_app/src/widgets/tasks_body.dart';
import 'package:tasks_app/src/controllers/tasks_controller.dart';
import 'package:tasks_app/src/services/tasks_service.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TasksController(service: TasksService()),
      child: Scaffold(
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: TasksBody(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.checklist),
              label: 'Checklist',
            ),
            NavigationDestination(
              icon: Icon(Icons.view_kanban),
              label: 'Kanban',
            ),
          ],
        ),
      ),
    );
  }
}
