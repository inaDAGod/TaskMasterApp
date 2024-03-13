import 'package:flutter/material.dart';
import 'personalizacion.dart';
import 'reporte_tarea.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _currentTheme = ThemeData.light();

  void _changeBackgroundColor(Color color) {
    setState(() {
      _currentTheme = ThemeData.light().copyWith(
        scaffoldBackgroundColor: color,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Personalización',
      theme: _currentTheme,
      home: MyHomePage(changeBackgroundColor: _changeBackgroundColor),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Function(Color) changeBackgroundColor;

  MyHomePage({required this.changeBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TRASO'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalizacionPage(
                      changeBackgroundColor: changeBackgroundColor,
                    ),
                  ),
                );
              },
              child: Text('Personalización'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReporteTarea()),
                );
              },
              child: Text('Reporte Tarea'),
            ),
          ],
        ),
      ),
    );
  }
}
