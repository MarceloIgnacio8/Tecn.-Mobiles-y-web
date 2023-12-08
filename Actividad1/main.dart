// lib/main.dart

import 'package:flutter/material.dart';
import 'widget.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App de Flutter'),
        ),
        body: Center(
         
          child: MiWidget(),
        ),
      ),
    );
  }
}

