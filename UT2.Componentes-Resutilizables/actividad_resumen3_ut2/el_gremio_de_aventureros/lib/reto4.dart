//! El reto3 está hecho en 'widget_test.dart'

//* Código original:

//? Main:
/*
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gremio/marcador_vida.dart';

void main() {
  // ✏️ Escribe aquí las tres pruebas
}
*/

//? Marcador_vida:
/*
import 'dart:math';

import 'package:flutter/material.dart';

class MarcadorVida extends StatelessWidget {
  final int vida;
  final int maximo;
  final ValueChanged<int> onCurar;

  const MarcadorVida({super.key, required this.vida, this.maximo = 100, required this.onCurar});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Vida: $vida/$maximo'),
        ElevatedButton(
          onPressed: vida < maximo ? () => onCurar(min(vida + 10, maximo)) : null,
          child: const Text('Curar'),
        ),
      ],
    );
  }
}
*/
