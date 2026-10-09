import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(body: Center(child: AjustesVisuales())),
  ));
}

class AjustesVisuales extends StatefulWidget {
  @override
  State<AjustesVisuales> createState() {
    return _AjustesVisualesState();
  }
}

class _AjustesVisualesState extends State<AjustesVisuales> {
  bool modoOscuro = false;
  double tamanoTexto = 16;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: modoOscuro,
          onChanged: (bool nuevoValor) { setState((){
            modoOscuro = nuevoValor;
          });
          },
        ),
        Slider(
          value: tamanoTexto,
          min: 12,
          max: 30,
          onChanged: (double nuevoValor) { setState(() {
            tamanoTexto = nuevoValor;
          });
          },
        ),
        Text(
          'Texto de ejemplo',
          style: TextStyle(fontSize: tamanoTexto),
        ),
      ],
    );
  }
}

//! Tu tarea:
//*    Actualiza modoOscuro desde el Switch.         ->  DONE
//*    Actualiza tamanoTexto desde el Slider.        ->  DONE
//*    Haz que ambos cambios actualicen la interfaz. ->  DONE