import 'package:flutter/material.dart';

void main() {
  runApp(
    MiApp(),
  );
}

class MiApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Mi primera app')),
        body: Center(child: Text('Hola, Flutter')),
      ),
    );
  }


}