import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(body: Center(child: Favorito())),
  ));
}

class Favorito extends StatefulWidget {
  @override
  State<Favorito> createState() {
    return _FavoritoState();
  }
}

class _FavoritoState extends State<Favorito> {
  bool favorito = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(favorito ? Icons.favorite : Icons.favorite_border),
        Text(favorito ? 'Añadido a favoritos' : 'No es favorito'),
        ElevatedButton(
          onPressed: () {
            print('Cambiar favorito');
          },
          child: Text('Cambiar'),
        ),
      ],
    );
  }
}

//! Tu tarea:
//*    Haz que cada pulsación cambie el valor de favorito.
//*    Comprueba que se actualizan el Icon y el Text.
//*    Pega el código completo.