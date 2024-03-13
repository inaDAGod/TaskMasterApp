import 'package:flutter/material.dart';

class PersonalizacionPage extends StatefulWidget {
  @override
  _PersonalizacionPageState createState() => _PersonalizacionPageState();
}

class _PersonalizacionPageState extends State<PersonalizacionPage> {
  ThemeData _currentTheme = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _currentTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Personalización"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildCharacterButton(
                    "Bob Esponja",
                    Color(0xFFDFD25E),
                    Color(0xFFE7CD7F),
                    "assets/bob_esponja.jpg",
                    () => _changeBackgroundColor(Color(0xFFDFD25E)),
                  ),
                  _buildCharacterButton(
                      "Patricio",
                      Colors.pink,
                      Colors.green,
                      "assets/patricio.jpg",
                      () => _changeBackgroundColor(Color(0xFFFFC0CB))),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildCharacterButton(
                    "Dark Plankton",
                    Colors.grey,
                    Colors.blueGrey,
                    "assets/plankton.jpg",
                    () => _changeBackgroundColor(Color(0xFF769EBB)),
                  ),
                  _buildCharacterButton(
                      "Gary",
                      Color(0xFFD6D7FE),
                      Color(0xFF9A9DED),
                      "assets/gary.jpg",
                      () => _changeBackgroundColor(Color(0xFF9A9DED))),
                ],
              ),
            ],
          ),
        ),
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
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _changeBackgroundColor(Color color) {
    setState(() {
      _currentTheme = ThemeData.light().copyWith(
        scaffoldBackgroundColor: color,
      );
    });
  }
}
