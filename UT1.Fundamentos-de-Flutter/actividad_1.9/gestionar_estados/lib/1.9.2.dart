import 'package:flutter/material.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text('Laura García'),
            Text('Desarrolladora de aplicaciones'),
            SizedBox(height: 40),
      
            //Pie de página
            Text('© 2026 Laura García'),
            Text('2.º DAM'),
          ],
        ),
      ),
    );
  }
}

//!Tu tarea:
//*    Crea PiePagina como StatelessWidget.
//*    Mueve a él los dos textos del pie.
//*    Utiliza PiePagina() en la interfaz.