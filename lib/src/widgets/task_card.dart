import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tasks_app/src/models/task.dart';

import 'priority_icon.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.priority,
    required this.onDonePressed,
  });

  final String title;
  final String description;
  final TaskPriority priority;
  final void Function() onDonePressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: IconButton(
          onPressed: onDonePressed,
          icon: const Icon(Icons.circle_outlined),
        ),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: description.isNotEmpty
            ? Text(
                '${description.substring(0, min(description.length, 30))}...')
            : null,
        trailing: PriorityIcon(priority),
      ),
    );
  }
}
