import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(body: Center(child: Contador())),
  ));
}

class Contador extends StatefulWidget {
  @override
  State<Contador> createState() {
    return _ContadorState();
  }
}

class _ContadorState extends State<Contador> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Contador: $contador'),
        ElevatedButton(
          onPressed: () {
            contador++;
          },
          child: Text('Sumar'),
        ),
      ],
    );
  }
}

//! Tu tarea:
//*    Modifica el código para que el cambio del contador actualice la interfaz.
//*    Pega el código completo resultante.