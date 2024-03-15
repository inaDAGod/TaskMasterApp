import 'package:flutter/material.dart';
import 'task.dart';

class ReporteTarea extends StatelessWidget {
  final List<Task> tasks;

  const ReporteTarea({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xFFFFF4BA), // Cambia el color de fondo aquí
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    'REPORTE DE TAREAS',
                    style: TextStyle(
                      color: Colors.black, // Color del texto
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times new roman',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                'Tareas Pendientes: ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Times new roman',
                ),
              ),
              const SizedBox(height: 20),
              // Use ListView.builder to build TaskItems dynamically
              ListView.builder(
                shrinkWrap: true,
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskItem(
                    title: tasks[index].title,
                    description: tasks[index].description,
                    category: tasks[index].category,
                    startDate: tasks[index].startDate.toString(),
                    deadline: tasks[index].deadline.toString(),
                    elapsedTime: _calculateElapsedTime(tasks[index].startDate),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _calculateElapsedTime(DateTime startDate) {
    Duration difference = DateTime.now().difference(startDate);
    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    return '$days days, $hours hours, $minutes minutes ago';
  }
}

class TaskItem extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final String startDate;
  final String deadline;
  final String elapsedTime;

  const TaskItem({
    required this.title,
    required this.description,
    required this.category,
    required this.startDate,
    required this.deadline,
    required this.elapsedTime,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times new roman',
          ),
        ),
        Text(
          'Descripción: $description',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Times new roman',
          ),
        ),
        Text(
          'Categoria: $category',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Times new roman',
          ),
        ),
        Text(
          'Fecha de inicio: $startDate',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Times new roman',
          ),
        ),
        Text(
          'Deadline: $deadline',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Times new roman',
          ),
        ),
        Text(
          'Tiempo transcurrido: $elapsedTime',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Times new roman',
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
