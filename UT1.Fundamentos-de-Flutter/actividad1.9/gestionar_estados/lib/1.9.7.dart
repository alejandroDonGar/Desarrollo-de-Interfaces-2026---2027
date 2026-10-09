import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(body: Center(child: Perfil())),
  ));
}

class Perfil extends StatefulWidget {
  @override
  State<Perfil> createState() {
    return _PerfilState();
  }
}

class _PerfilState extends State<Perfil> {
  String nombre = 'Lucía';
  int visitas = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(nombre),
        Text('Visitas: $visitas'),
        ElevatedButton(
          onPressed: () {
            visitas++;
          },
          child: Text('Nueva visita'),
        ),
      ],
    );
  }
}

//! Tu tarea:
//*    Haz que únicamente el cambio de visitas actualice la interfaz.
//*    No es necesario modificar nombre.
//*    Pega el código completo.