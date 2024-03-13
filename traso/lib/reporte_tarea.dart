import 'package:flutter/material.dart';

class ReporteTarea extends StatelessWidget {
  const ReporteTarea({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporte de Tareas'),
        centerTitle: true,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
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
            Text('Tarea Redes de computadoras: completar tarea de cisco'),
            Text('Tarea Sistemas de información 2: Analisis de datos'),
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
            // Aquí puedes generar dinámicamente la lista de tareas en curso
            Text('Tarea cristología: resumen de la vida de Jesús'),
            Text(
                'Tarea Antropología: Autoanálisis de las decisiones tomadas en el pasado'),
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
            // Aquí puedes generar dinámicamente la lista de tareas completadas
            Text(
                'Tarea Administrción de empresas: Análisis foda de una organización'),
            Text('Tarea Software: Aplicación móvil Traso'),
          ],
        ),
      ),
    );
  }
}
