import 'package:flutter/material.dart';
import 'task.dart';

class AnadirTarea extends StatefulWidget {
  @override
  _AnadirTareaState createState() => _AnadirTareaState();
}

class _AnadirTareaState extends State<AnadirTarea> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  String _selectedCategory = 'Estudio'; // Initialize with a default value
  DateTime _selectedDate = DateTime.now(); // Initialize with the current date
  bool _recuerdame = false;

  @override
  void dispose() {
    _titleController.dispose(); // Dispose all controllers
    _descriptionController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4BA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Center(
                  child: Text(
                    'AÑADIR',
                    style: TextStyle(
                      color: Color.fromARGB(255, 4, 4, 4),
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times new roman',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Titulo:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Titulo de tu tarea',
                  ),
                ),
                SizedBox(height: 10),
                const Text(
                  "Categoria:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: InputDecoration(
                    hintText: 'Selecciona la categoría',
                  ),
                  items: <String>[
                    'Estudio',
                    'Personal',
                    'Favoritas',
                    'Otro (varios)'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    }
                  },
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fin:",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            controller: _dateController,
                            readOnly: true,
                            onTap: () => _selectDate(context),
                            decoration: InputDecoration(
                              hintText: 'Selecciona una fecha',
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Descripcion:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Agregar descripción',
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.notifications),
                    SizedBox(width: 5),
                    Text(
                      "Recuerdame:",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    Checkbox(
                      value: _recuerdame,
                      onChanged: (bool? value) {
                        setState(() {
                          _recuerdame = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Task newTask = Task(
                      title: _titleController.text,
                      category: _selectedCategory,
                      deadline: _selectedDate,
                      description: _descriptionController.text,
                      remindMe: _recuerdame,
                    );
                    Navigator.pop(context, newTask);
                  },
                  child: Text('Guardar'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
