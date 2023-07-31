import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app/src/screens/create_task_screen.dart';
import 'package:tasks_app/src/widgets/checklist_body.dart';
import 'package:tasks_app/src/controllers/tasks_controller.dart';
import 'package:tasks_app/src/services/tasks_service.dart';
import 'package:tasks_app/src/widgets/kanban_body/kanban_body.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final checklistBody = const ChecklistBody();
  final kanbanBody = const KanbanBody();

  int selectedIndex = 0;
  Widget get body => selectedIndex == 0 ? checklistBody : kanbanBody;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TasksController(service: TasksService()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: body,
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
          selectedIndex: selectedIndex,
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
          onDestinationSelected: (value) {
            setState(() => selectedIndex = value);
          },
        ),
      ),
    );
  }
}
