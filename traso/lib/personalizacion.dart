import 'package:flutter/material.dart';

class PersonalizacionPage extends StatelessWidget {
  final Function(Color) onColorSelected;

  const PersonalizacionPage({
    Key? key,
    required this.onColorSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personalización'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 20),
            child: const Text(
              'PERSONALIZACION',
              style: TextStyle(
                color: Color.fromARGB(255, 4, 4, 4),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Times new roman',
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildImageButton(
                        "assets/bob_esponja.jpg",
                        const Color(0xFFFFF4BA),
                        context,
                      ),
                      _buildImageButton(
                        "assets/patricio.jpg",
                        const Color(0xFFFFC0CB),
                        context,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildImageButton(
                        "assets/plankton.jpg",
                        const Color(0xFF769EBB),
                        context,
                      ),
                      _buildImageButton(
                        "assets/gary.jpg",
                        const Color(0xFF9A9DED),
                        context,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageButton(String imagePath, Color color, BuildContext context) {
    return GestureDetector(
      onTap: () {
        onColorSelected(color);
        Navigator.pop(context, color);
      },
      child: Image.asset(
        imagePath,
        width: 160,
        height: 150,
      ),
    );
  }
}
