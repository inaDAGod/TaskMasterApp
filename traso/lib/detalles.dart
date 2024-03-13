import 'package:flutter/material.dart';

class ModificarTarea extends StatefulWidget {
  @override
  _ModificarTareaState createState() => _ModificarTareaState();
}

class _ModificarTareaState extends State<ModificarTarea> {
  bool _recuerdame = false;
  TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        _dateController.text =
            '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 110, 224),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Aquí se muestra una imagen 
            Expanded(
              child: Center(
                child: Image.asset('https://i.pinimg.com/564x/d5/1c/46/d51c468db191d51e5545e494c35ad9b9.jpg'),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Titulo:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
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
              decoration: InputDecoration(
                hintText: 'Selecciona la categoría',
              ),
              // Combobox para seleccionar la categoría 
              items: <String>['Categoria 1', 'Categoria 2', 'Categoria 3']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {},
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
              // Textfield grande para escribir la descripción
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Agregar descripción',
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Estado:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: 'Selecciona el estado',
              ),
              // Combobox para seleccionar el estado de la tarea
              items: <String>['Not started', 'In progress', 'Done']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {},
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Acción para editar la tarea
                  },
                  child: Text('Editar'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // borrar la tarea
                  },
                  child: Text('Borrar'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.notifications), // Icono campana
                SizedBox(width: 5),
                Text(
                  "Recuerdame:",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Checkbox(
                  // Checkbox para recordar 
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
                // Acción para guardar la tarea
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}


void main() {
  runApp(MaterialApp(
    home: ModificarTarea(),
  ));
}
