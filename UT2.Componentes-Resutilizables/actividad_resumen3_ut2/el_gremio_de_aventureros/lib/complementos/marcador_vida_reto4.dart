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