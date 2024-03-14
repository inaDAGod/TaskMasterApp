import 'package:flutter/material.dart';

class ReporteTarea extends StatelessWidget {
  const ReporteTarea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'REPORTE DE TAREAS',
                  style: TextStyle(
                    color: Color.fromARGB(255, 4, 4, 4),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times new roman',
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Tareas Pendientes: ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Times new roman',
                ),
              ),
              SizedBox(height: 20),
              TaskItem(
                title: 'Tarea Redes de computadoras',
                description: 'Completar cursos de Cisco',
                category: 'Estudio',
                startDate: '09/03/2024',
                deadline: '14/03/2024',
                elapsedTime: '5 días',
              ),
              TaskItem(
                title: 'Comprar comida',
                description: 'Comprar comida para mascotas',
                category: 'Personal',
                startDate: '15/04/2024',
                deadline: '16/03/2024',
                elapsedTime: '1 día',
              ),
              SizedBox(height: 20),
              Text(
                'Tareas en Curso: ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Times new roman',
                ),
              ),
              SizedBox(height: 20),
              TaskItem(
                title: 'Mapa Mental',
                description:
                    'Realizar un mapa mental de la unidad 3 de administracion de empresas',
                category: 'Estudio',
                startDate: '13/03/2024',
                deadline: '15/03/2024',
                elapsedTime: '2 días',
              ),
              TaskItem(
                title: 'Convivencia de Cristologia',
                description: 'Comprar snacks para compartir',
                category: 'Estudio',
                startDate: '13/03/2024',
                deadline: '15/03/2024',
                elapsedTime: '2 días',
              ),
              SizedBox(height: 20),
              Text(
                'Tareas Completadas: ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Times new roman',
                ),
              ),
              SizedBox(height: 20),
              TaskItem(
                title: 'Diapositivas para exposición',
                description:
                    'Completar las diapositivas para la exposición de dispositivos moviles',
                category: 'Estudio',
                startDate: '08/03/2024',
                deadline: '11/03/2024',
                elapsedTime: '3 días',
              ),
              TaskItem(
                title: 'Cotizar cotillón',
                description: 'Cotizar cotillón para el cumpleaños de Gabriel',
                category: 'Personal',
                startDate: '05/03/2024',
                deadline: '13/03/2024',
                elapsedTime: '8 días',
              ),
            ],
          ),
        ),
      ),
    );
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
