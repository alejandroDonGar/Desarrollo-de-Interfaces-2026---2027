import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(body: Center(child: Ajustes())),
  ));
}

class Ajustes extends StatefulWidget {
  @override
  State<Ajustes> createState() {
    return _AjustesState();
  }
}

class _AjustesState extends State<Ajustes> {
  bool notificaciones = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: notificaciones,
      onChanged: (bool nuevoValor) {
        print(nuevoValor);
      },
    );
  }
}

//! Tu tarea:
//*    Haz que el nuevo valor se guarde y que el Switch se actualice.
//*    Pega el código completo.