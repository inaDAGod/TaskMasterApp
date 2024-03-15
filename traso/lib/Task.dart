
// ignore_for_file: file_names

class Task {
  final String title;
  final String category;
  final DateTime startDate;
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
    
  }): startDate = DateTime.now();
}
