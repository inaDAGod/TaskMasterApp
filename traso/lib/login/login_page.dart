import 'package:flutter/material.dart';
import 'package:traso/login/register_page.dart';

import 'loginComponents/my_button.dart';
import 'loginComponents/my_textfield.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6D7FE),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          
               Image.asset('lib/images/medusa.webp',
               ),
          
                const SizedBox(height: 30),
          
                // welcome back, you've been missed!
                const Text(
                  'Bienvenidx de nuevo!',
                  style: TextStyle(
                    color: Color.fromARGB(255, 4, 4, 4),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times new roman',
                  ),
                ),
          
                const SizedBox(height: 25),
          
                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Correo electronico',
                  obscureText: false,
                ),
          
                const SizedBox(height: 15),
          
                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Contraseña',
                  obscureText: true,
                ),
          
                const SizedBox(height: 25),
          
                
          
                // sign in button
                MyButton(
                  onTap: signUserIn,
                  buttonText: 'Iniciar Sesión',
                  buttonColor: const Color(0xFF769EBB),
                ),
          
                const SizedBox(height: 30),
          
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No estas registradx?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    
                    
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navegar a la página RegisterPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: const Text(
                        'Registrate ahora',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}