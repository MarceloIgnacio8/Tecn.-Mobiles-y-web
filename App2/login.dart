// paquetes
import 'package:flutter/material.dart';
import 'home.dart';

//StatelessWidget parainicio de sesión
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Configurar el AppBar para la página de inicio de sesión
      appBar: AppBar(
        title: Text('Login'),
      ),
      // cuerpo de de inicio de sesión con fondo celeste
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // entrada para el correo electrónico
                buildInputField("Email", Icons.email),
                SizedBox(height: 16),
                // entrada para la contraseña
                buildInputField("Contraseña", Icons.lock, isPassword: true),
                SizedBox(height: 16),
                // ElevatedButton para iniciar sesión
                ElevatedButton(
                  onPressed: () {
                    // Ir a home si se inicia sesion
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(message: 'Sesión iniciada con éxito')),
                    );
                  },
                  child: Text("Login"),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                  },
                  child: Text("Recuerda tus datos"),
                ),
                TextButton(
                  onPressed: () {
                  
                  },
                  child: Text("¿Olvidaste tu contraseña?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // campos de entrada con estilo común
  Widget buildInputField(String labelText, IconData icon, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
