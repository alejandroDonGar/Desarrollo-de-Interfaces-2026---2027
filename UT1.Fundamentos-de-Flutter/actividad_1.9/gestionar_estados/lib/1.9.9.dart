import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Column(
        children: [
          LogoCentro(),
          ContadorAlumnos(),
        ],
      ),
    ),
  ));
}

class LogoCentro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('IES Puerto de la Cruz');
  }
}

class ContadorAlumnos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Alumnado presente: 0'),
        ElevatedButton(
          onPressed: () {
            print('Añadir alumno');
          },
          child: Text('Añadir'),
        ),
      ],
    );
  }
}

//! Tu tarea:
//*    Mantén LogoCentro como StatelessWidget.
//*    Transforma ContadorAlumnos para que pueda mantener y actualizar el contador.
//*    Pega el código completo.
