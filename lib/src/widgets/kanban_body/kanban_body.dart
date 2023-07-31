import 'package:flutter/material.dart';
import 'package:tasks_app/src/widgets/kanban_body/kanban_column.dart';

class KanbanBody extends StatefulWidget {
  const KanbanBody({super.key});

  @override
  State<KanbanBody> createState() => _KanbanBodyState();
}

class _KanbanBodyState extends State<KanbanBody>
    with SingleTickerProviderStateMixin {
  late final controller = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: const [
        KanbanColumn(title: 'To Do'),
        KanbanColumn(title: 'In Progress'),
        KanbanColumn(title: 'Done'),
      ],
    );
  }
}
