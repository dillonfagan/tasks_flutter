class Record<T> {
  const Record({
    required this.id,
    required this.value,
  });

  final String id;
  final T value;
}
