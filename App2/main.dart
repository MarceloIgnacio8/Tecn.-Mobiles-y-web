import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

// entrada principal
void main() {
  // Ejecutar la aplicación Flutter
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // configurar la apariencia y el comportamiento de la aplicación
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // Ruta para la página de inicio de sesión
        '/': (context) => LoginPage(),
        // Ruta para la página de inicio con un mensaje específico
        '/home': (context) => HomePage(message: 'Sesión Iniciada'),
      },
    );
  }
}
