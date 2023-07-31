import 'package:flutter/material.dart';

import '../models/task.dart';

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
