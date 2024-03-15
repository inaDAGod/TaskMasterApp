import 'package:flutter/material.dart';

class ModificarTarea extends StatefulWidget {
  @override
  _ModificarTareaState createState() => _ModificarTareaState();
}

class _ModificarTareaState extends State<ModificarTarea> {
  bool _recuerdame = false;
  TextEditingController _dateController = TextEditingController();
  bool _editando = false; // Variable para controlar el estado de edición

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
      backgroundColor: Color.fromARGB(255, 192, 167, 205),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Aquí se muestra una imagen
            Expanded(
              flex: 3, // Ocupa 3/5 del espacio disponible
              child: Center(
                child: Image.asset(
                  'assets/boblila.jpg',
                  fit: BoxFit.contain, // Ajusta la imagen al espacio disponible
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Titulo:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Titulo de tu tarea',
              ),
              enabled: _editando, // Habilita/deshabilita el campo según el estado de edición
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
              items: <String>['Study', 'Personal', 'Favorites', 'All']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: _editando ? (String? value) {} : null, // Habilita/deshabilita el dropdown según el estado de edición
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
                        onTap: _editando ? () => _selectDate(context) : null, // Habilita/deshabilita la selección de fecha según el estado de edición
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
              enabled: _editando, // Habilita/deshabilita el campo según el estado de edición
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
              onChanged: _editando ? (String? value) {} : null, // Habilita/deshabilita el dropdown según el estado de edición
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _editando = true; // Habilita la edición al presionar el botón "Editar"
                  });
                },
                child: Text('Editar'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 82, 113, 139)),
                ),
              ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Acción para guardar la tarea
                  },
                  child: Text('Guardar'),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(Size(100, 50)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 82, 113, 139)),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Acción para borrar la tarea
                  },
                  child: Text('Borrar'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 82, 113, 139)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}