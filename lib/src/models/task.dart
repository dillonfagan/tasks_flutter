class Task {
  const Task({
    required this.name,
    required this.status,
    required this.priority,
    required this.description,
  });

  final String name;
  final String description;
  final TaskStatus status;
  final TaskPriority priority;

  factory Task.create({
    required String name,
    required String description,
    required TaskStatus status,
    required TaskPriority priority,
  }) {
    return Task(
      name: name,
      status: status,
      priority: priority,
      description: description,
    );
  }
}

enum TaskStatus {
  backlog,
  todo,
  inProgress,
  done,
}

enum TaskPriority {
  low,
  medium,
  high,
}
