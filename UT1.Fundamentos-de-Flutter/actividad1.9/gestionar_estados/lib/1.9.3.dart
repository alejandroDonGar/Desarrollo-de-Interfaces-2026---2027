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
            
            //Perfil
            Icon(Icons.account_circle, size: 80),
            Text('Mario Hernández'),
            Text('Desarrollador Flutter'),
            Divider(),

            //Contacto
            Icon(Icons.email),
            Text('mario@email.com'),
            Icon(Icons.phone),
            Text('600 123 456'),
          ],
        ),
      ),
    );
  }
}

//! Tu tarea:
//*    Crea Perfil como StatelessWidget.
//*    Crea Contacto como StatelessWidget.
//*    Utiliza ambos widgets en la interfaz principal.

