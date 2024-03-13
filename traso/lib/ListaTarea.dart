import 'package:flutter/material.dart';
import 'añadirTarea.dart';
import 'Task.dart';



class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
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

  @override
  void initState() {
    super.initState();
    filteredTasks = List.from(tasks); // Inicializa filteredTasks con todas las tareas
    selectedCategory = 'All';
    selectedStatus = 'Todos';
  }

  void _navigateToAddTaskScreen(BuildContext context) async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AnadirTarea()),
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
      if (category != 'All' && task.category != category) return false;
      if (status != 'Todos' && task.status != status) return false;
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Traso',
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildCategoryFilter(),
          Expanded(
            child: ListView(
              children: _buildTaskLists(), // Crear listas de tareas según el estado
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddTaskScreen(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: _buildStatusFilter(),
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
            _buildCategoryToggleButton('All'),
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Text(category, style: TextStyle(color: Colors.white)),
      ),
      style: TextButton.styleFrom(
        backgroundColor: selectedCategory == category ? Color(0xFFFFF4BA) : Color(0xFFFFC0CB),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  Widget _buildStatusFilter() {
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Text(status, style: TextStyle(color: Colors.white)),
      ),
      style: TextButton.styleFrom(
        backgroundColor: selectedStatus == status ? Color(0xFFFFCF76) : Color(0xFFFFF4BA),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
