import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(child: Contador()),
    ),
  ));
}

class Contador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int contador = 0;
    return Text('Contador: $contador');
  }
}

//! Tu tarea:
//*    Convierte Contador en StatefulWidget.
//*    Crea el estado asociado.
//*    Mantén el contador y build() en la clase de estado.
