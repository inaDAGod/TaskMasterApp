import 'package:flutter/material.dart';
import 'login/auth_page.dart';
import 'reporte_tarea.dart';
import 'personalizacion.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  //Por si tienes errores con lo firebase
  //lo comentas desde aca
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //hasta aca
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: AuthPage(),
      home: CombinedPage(), //aca ponen la ventana que quieran ver
    );
  }
}

class CombinedPage extends StatefulWidget {
  const CombinedPage({Key? key}) : super(key: key);

  @override
  _CombinedPageState createState() => _CombinedPageState();
}

class _CombinedPageState extends State<CombinedPage> {
  Color _backgroundColor = Colors.white; // Color de fondo inicial

  void _changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: _backgroundColor,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("pruebitaa"),
            bottom: const TabBar(
              tabs: [
                Tab(text: "Reporte de Tareas"),
                Tab(text: "Personalización"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              const ReporteTarea(),
              PersonalizacionPage(
                changeBackgroundColor: _changeBackgroundColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
