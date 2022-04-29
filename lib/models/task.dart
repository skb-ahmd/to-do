class Task {
  final String id;
  final String title;
  final String description;
  final DateTime date;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toString(),
    };
  }
}
