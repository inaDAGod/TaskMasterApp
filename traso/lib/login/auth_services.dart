import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traso/login/welcome_page.dart';

import 'home_page.dart';
class AuthServices  {
  static Future<void> signUserIn(String email, String password, BuildContext context) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (error) {

      print("Error durante la autenticación: $error");
      // Aquí puedes mostrar un mensaje de error al usuario si lo deseas
    }
  }

  static Future<void> signUserOut(BuildContext context)async{
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      FirebaseAuth.instance.signOut();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    } catch (error) {

      print("Error durante la autenticación: $error");
      // Aquí puedes mostrar un mensaje de error al usuario si lo deseas
    }
  }
}