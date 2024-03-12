import 'package:flutter/material.dart';
import 'package:traso/login/login_page.dart';
import 'package:traso/login/register_page.dart';

import 'loginComponents/my_button.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4BA),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                const Text(
                  'T R A S O',
                  style: TextStyle(
                    color: Color.fromARGB(255, 4, 4, 4),
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times new roman',
                  ),
                ),
          
                const SizedBox(height: 25),
          
                Image.asset('lib/images/trasoIcon.png',
                height: 300,
               ),
          
                const SizedBox(height: 30),
          
                // sign in button
                MyButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  buttonText: 'Iniciar Sesión',
                  buttonColor: const Color(0xFF9A9DED),
                ),
          
                const SizedBox(height: 30),

                // sign up button
                MyButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  buttonText: 'Registrarse',
                  buttonColor: const Color(0xFF769EBB),
                ),
          
                const SizedBox(height: 30),
          
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}