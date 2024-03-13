import 'package:flutter/material.dart';

class ReporteTarea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reporte de Tareas'),
        centerTitle: true,
      ),
      body: const Padding(
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
            const SizedBox(height: 25),
            Text(
              'Tareas Pendientes: ',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Times new roman',
              ),
            ),
            SizedBox(height: 20),
            Text('Lista de tareas pendientes...'),
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
            Text('Lista de tareas en curso...'),
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
            Text('Lista de tareas completadas...'),
          ],
        ),
      ),
    );
  }
}
