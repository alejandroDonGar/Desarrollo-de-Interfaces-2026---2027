import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SombreroProvider(),
      child: const SombreroApp(),
    ),
  );
}

class SombreroProvider extends ChangeNotifier {
  String _ultimaCasa = '¿?';

  final Map _recuento = {
    'Gryffindor': 0,
    'Hufflepuff': 0,
    'Ravenclaw': 0,
    'Slytherin': 0,
  };

  String get ultimaCasa => _ultimaCasa;
  Map get recuento => _recuento;

  void seleccionar() {
    final casas = _recuento.keys.toList();
    final elegida = casas[Random().nextInt(4)];

    _ultimaCasa = elegida;
    _recuento[elegida] = _recuento[elegida]! + 1;
    notifyListeners();
  }

  void reiniciar() {
    _ultimaCasa = '¿?';
    for (final casa in _recuento.keys) {
      _recuento[casa] = 0;
    }
    notifyListeners();
  }
}

class SombreroApp extends StatelessWidget {
  const SombreroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.brown, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('🎩 El sombrero seleccionador')),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ResultadoSombrero(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotonSeleccionar(),
                  SizedBox(width: 12),
                  BotonReiniciar(),
                ],
              ),
              SizedBox(height: 20),
              RecuentoCasas(),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultadoSombrero extends StatelessWidget {
  const ResultadoSombrero({super.key});

  @override
  Widget build(BuildContext context) {
    final casa = context.watch().ultimaCasa;

    return Column(
      children: [
        const Text('🎩', style: TextStyle(fontSize: 72)),
        Text(
          casa,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class RecuentoCasas extends StatelessWidget {
  const RecuentoCasas({super.key});

  @override
  Widget build(BuildContext context) {
    final recuento = context.watch().recuento;

    return Card(
      child: Column(
        children: [
          for (final entrada in recuento.entries)
            ListTile(
              leading: const Icon(Icons.shield),
              title: Text(entrada.key),
              trailing: Text(
                '${entrada.value}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
        ],
      ),
    );
  }
}

class BotonSeleccionar extends StatelessWidget {
  const BotonSeleccionar({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {
        context.read().seleccionar();
      },
      icon: const Icon(Icons.auto_awesome),
      label: const Text('Seleccionar'),
    );
  }
}

class BotonReiniciar extends StatelessWidget {
  const BotonReiniciar({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        context.read().reiniciar();
      },
      icon: const Icon(Icons.refresh),
      label: const Text('Reiniciar'),
    );
  }
}