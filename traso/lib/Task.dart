class Task {
  final String title;
  final String category;
  final DateTime deadline;
  final String description;
  final bool remindMe;
  String status; // Atributo de estado: completada, en proceso, pendiente

  Task({
    required this.title,
    required this.category,
    required this.deadline,
    required this.description,
    required this.remindMe,
    this.status = 'Pendiente', // Por defecto, la tarea se establece como pendiente
  });
}
