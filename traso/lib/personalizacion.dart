import 'package:flutter/material.dart';

class PersonalizacionPage extends StatelessWidget {
  final Function(Color) changeBackgroundColor;

  const PersonalizacionPage({
    Key? key,
    required this.changeBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      _buildCharacterButton(
                        "Bob Esponja",
                        const Color(0xFFDFD25E),
                        const Color(0xFFE7CD7F),
                        "assets/bob_esponja.jpg",
                        () => changeBackgroundColor(const Color(0xFFFFF4BA)),
                      ),
                      _buildCharacterButton(
                        "Patricio",
                        Colors.pink,
                        Colors.green,
                        "assets/patricio.jpg",
                        () => changeBackgroundColor(const Color(0xFFFFC0CB)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildCharacterButton(
                        "Dark Plankton",
                        Colors.grey,
                        Colors.blueGrey,
                        "assets/plankton.jpg",
                        () => changeBackgroundColor(const Color(0xFF769EBB)),
                      ),
                      _buildCharacterButton(
                        "Gary",
                        const Color(0xFFD6D7FE),
                        const Color(0xFF9A9DED),
                        "assets/gary.jpg",
                        () => changeBackgroundColor(const Color(0xFF9A9DED)),
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

  Widget _buildCharacterButton(
    String name,
    Color primary,
    Color secondary,
    String imagePath,
    VoidCallback onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 160,
            height: 150,
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Times new roman',
            ),
          ),
        ],
      ),
    );
  }
}
