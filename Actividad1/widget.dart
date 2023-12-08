// lib/widget.dart

import 'package:flutter/material.dart';

class MiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Contenido del widget
    return ElevatedButton(
      onPressed: () {
        print("¡Hola Mundo!");
      },
      child: Text("Saludar"),
    );
  }
}
