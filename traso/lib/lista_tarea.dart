import 'package:flutter/material.dart';
import 'package:traso/personalizacion.dart';
import 'añadirTarea.dart';
import 'login/auth_services.dart';
import 'task.dart'; 
import 'reporte_tarea.dart'; 


class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  TaskListScreenState createState() => TaskListScreenState();
}

class TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [
    Task(
      title: 'Task 1',
      category: 'Estudio',
      deadline: DateTime.now(),
      description: 'Description for Task 1',
      remindMe: true,
      status: 'Completado',
    ),
    Task(
      title: 'Task 2',
      category: 'Personal',
      deadline: DateTime.now(),
      description: 'Description for Task 2',
      remindMe: false,
      status: 'En Curso',
    ),
    Task(
      title: 'Task 3',
      category: 'Favoritas',
      deadline: DateTime.now(),
      description: 'Description for Task 3',
      remindMe: true,
      status: 'Pendiente',
    ),
    Task(
      title: 'Task 4',
      category: 'Favoritas',
      deadline: DateTime.now(),
      description: 'Description for Task 4',
      remindMe: true,
      status: 'Completado',
    ),
  ];
  late List<Task> filteredTasks;
  late String selectedCategory;
  late String selectedStatus;
  late Color backgroundColor;

  @override
  void initState() {
    super.initState();
    filteredTasks = List.from(tasks);
    selectedCategory = 'Todas';
    selectedStatus = 'Todos';
    backgroundColor = Colors.white;
  }

  void _navigateToAddTaskScreen(BuildContext context) async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AnadirTarea()),
    );
    if (newTask != null) {
      setState(() {
        tasks.add(newTask);
        _filterTasks(selectedCategory, selectedStatus);
      });
    }
  }

  void _filterTasks(String category, String status) {
    filteredTasks = tasks.where((task) {
      if (category != 'Todas' && task.category != category) return false;
      if (status != 'Todos' && task.status != status) return false;
      return true;
    }).toList();
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            decoration: const BoxDecoration(
              color: Color(0xFFFFF4BA),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Center(
                    child: Text(
                      'Traso',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () {
                    _showBottomSheet(context);
                  },
                ),
              ],
            ),
          ),
          _buildCategoryFilter(),
          Expanded(
            child: ListView(
              children: _buildTaskLists(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddTaskScreen(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: _buildStatusFilter(context),
    );
  }

  Widget _buildCategoryFilter() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            _buildCategoryToggleButton('Estudio'),
            _buildCategoryToggleButton('Personal'),
            _buildCategoryToggleButton('Favoritas'),
            _buildCategoryToggleButton('Todas'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryToggleButton(String category) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedCategory = category;
          _filterTasks(selectedCategory, selectedStatus);
        });
      },
      style: TextButton.styleFrom(
        backgroundColor: selectedCategory == category ? const Color(0xFFFFF4BA) : const Color(0xFFFFC0CB),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Text(category, style: const TextStyle(color: Colors.black)),
      ),
    );
  }

  Widget _buildStatusFilter(BuildContext context) {
    return BottomAppBar(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _buildStatusToggleButton('Completado'),
              _buildStatusToggleButton('En Curso'),
              _buildStatusToggleButton('Pendiente'),
              _buildStatusToggleButton('Todos'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusToggleButton(String status) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedStatus = status;
          _filterTasks(selectedCategory, selectedStatus);
        });
      },
      style: TextButton.styleFrom(
        backgroundColor: selectedStatus == status ? const Color(0xFFFFCF76) : const Color(0xFFFFF4BA),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Text(status, style: const TextStyle(color: Colors.black)),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                    Navigator.pop(context);
                    await AuthServices.signUserOut();
                },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Registro'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReporteTarea(tasks: tasks),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Personalizar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalizacionPage(
                      onColorSelected: changeBackgroundColor,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildTaskLists() {
    List<Widget> taskLists = [];
    List<String> uniqueStatuses = filteredTasks.map((task) => task.status).toSet().toList();

    for (String status in uniqueStatuses) {
      List<Task> filteredByStatus = filteredTasks.where((task) => task.status == status).toList();
      if (status == selectedStatus || selectedStatus == 'Todos') {
        taskLists.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                status,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredByStatus.length,
              itemBuilder: (context, index) {
                Task task = filteredByStatus[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.description),
                      Text('Deadline: ${task.deadline.day}/${task.deadline.month}/${task.deadline.year}'),
                    ],
                  ),
                  trailing: PopupMenuButton<String>(
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      if (task.status != 'Completado')
                        const PopupMenuItem<String>(
                          value: 'completado',
                          child: Text('Completado'),
                        ),
                        if (task.status == 'Completado')
                        const PopupMenuItem<String>(
                          value: 'reporte',
                          child: Text('Reporte'),
                        ),
                        if (task.status == 'Pendiente')
                        const PopupMenuItem<String>(
                          value: 'enCurso',
                          child: Text('En Curso'),
                        ),
                      if (task.status == 'Pendiente')
                        const PopupMenuItem<String>(
                          value: 'delete',
                          child: Text('Eliminar'),
                        ),
                    ],
                    onSelected: (String value) {
                      if (value == 'completado') {
                         task.status = 'Completado';
                      } else if (value == 'delete') {
                        
                        setState(() {
                          tasks.remove(task);
                          _filterTasks(selectedCategory, selectedStatus);
                        });
                      }else if(value == 'enCurso'){
                        task.status = 'En Curso';
                      }else if(value == 'reporte'){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReporteTarea(tasks: tasks),
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ],
        ));
      }
    }

    return taskLists;
  }
}
