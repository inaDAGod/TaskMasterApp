import 'package:flutter/material.dart';

import 'Task.dart';

class AnadirTarea extends StatefulWidget {
  @override
  _AnadirTareaState createState() => _AnadirTareaState();
}

class _AnadirTareaState extends State<AnadirTarea> {
  bool _recuerdame = false;
  TextEditingController _titleController = TextEditingController();
  String? _selectedCategory;
  DateTime? _selectedDate;
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dateController.dispose(); // Dispose of the date controller
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
        _dateController.text =
            '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4BA),
      body: Padding(
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
            Expanded(
              child: Center(
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
            Text(
              "Categoria:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
              items: ['Categoria 1', 'Categoria 2', 'Categoria 3']
                  .map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
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
            Spacer(),
            ElevatedButton(
  onPressed: () {
    Task newTask = Task(
      title: _titleController.text.trim(),
      category: _selectedCategory ?? '', // Ensure category is not null
      deadline: _selectedDate ?? DateTime.now(), // Ensure deadline is not null
      description: _descriptionController.text.trim(),
      remindMe: _recuerdame, // Corrected variable name
    );
    Navigator.pop(context, newTask); // Pass newTask back to the previous screen
  },
  child: Text('Guardar'),
),

          ],
        ),
      ),
    );
  }
}

