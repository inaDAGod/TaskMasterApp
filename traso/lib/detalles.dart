import 'package:flutter/material.dart';

class ModificarTarea extends StatefulWidget {
  const ModificarTarea({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ModificarTareaState createState() => _ModificarTareaState();
}

class _ModificarTareaState extends State<ModificarTarea> {
  bool _recuerdame = false;
  // ignore: prefer_final_fields
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
      backgroundColor: const Color.fromARGB(255, 192, 167, 205),
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
            const SizedBox(height: 20),
            const Text(
              "Titulo:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Titulo de tu tarea',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Categoria:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                hintText: 'Selecciona la categoría',
              ),
              // Combobox para seleccionar la categoría
              items: <String>['Estudio',
                    'Personal',
                    'Favoritas',
                    'Otro (varios)']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {},
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Fin:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _dateController,
                        readOnly: true,
                        onTap: () => _selectDate(context),
                        decoration: const InputDecoration(
                          hintText: 'Selecciona una fecha',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Descripcion:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              // Textfield grande para escribir la descripción
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: 'Agregar descripción',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Estado:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                hintText: 'Selecciona el estado',
              ),
              // Combobox para seleccionar el estado de la tarea
              items: <String>['Pendiente', 'En Curso', 'Completado']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {},
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Acción para guardar la tarea
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(const Size(100, 50)),
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 82, 113, 139)),
                ),
                child: const Text('Guardar'),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.notifications), // Icono campana
                const SizedBox(width: 5),
                const Text(
                  "Recuerdame:",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Acción para editar la tarea
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 82, 113, 139)),
                  ),
                  child: const Text('Editar'),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
