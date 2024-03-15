import 'package:flutter/material.dart';
//import 'login/auth_page.dart';
//import 'reporte_tarea.dart';
//import 'personalizacion.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'lista_tarea.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: TaskListScreen(), // Use your TaskListScreen widget as the home screen
    );
  }
}