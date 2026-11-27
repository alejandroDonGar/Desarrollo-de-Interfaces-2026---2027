import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorSchemeSeed: Colors.blue),
    home: const PantallaAgua(),
  ),
);

const azulOscuro = Color(0xFF0D47A1);
const azulAgua = Color(0xFF4FC3F7);

class PantallaAgua extends StatefulWidget {
  const PantallaAgua({super.key});

  @override
  State<PantallaAgua> createState() => _PantallaAguaState();
}

class _PantallaAguaState extends State<PantallaAgua> {
  int bebido = 0;
  int objetivo = 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4FB),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 48, 20, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Hidrátate',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: azulOscuro),
            ),
            const Text('Lo que llevas bebido hoy', style: TextStyle(color: Colors.blueGrey)),
            // ✏️
            Expanded(
              child: Center(
                child: Vaso(
                  bebido: bebido, 
                  objetivo: objetivo,
                )
              )
            ),
            BotonesBebida(
              onBeber: (cantidadBebida) {
                setState(() {
                  bebido += cantidadBebida;
                });
              }
            ),
            const SizedBox(height: 12),
            const AjusteObjetivo(),
            const SizedBox(height: 8),
            BotonNuevoDia(
              onResetear: () {
                setState(() {
                  bebido = 0;
                });
              }
            ),
          ],
        ),
      ),
    );
  }
}

class Vaso extends StatelessWidget {
  final int bebido;
  final int objetivo;

  const Vaso({
    super.key, 
    required this.bebido, 
    required this.objetivo
  });

  @override
  Widget build(BuildContext context) {
    // ✏️
    const bebido = 0;
    const objetivo = 2000;
    final cumplido = bebido >= objetivo;
    final alturaAgua = cumplido ? 212.0 : 212 * bebido / objetivo;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 150,
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFF90CAF9), width: 4),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(8),
              bottom: Radius.circular(40),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(4),
              bottom: Radius.circular(36),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(height: alturaAgua, color: azulAgua),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$bebido ml',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: azulOscuro,
                        ),
                      ),
                      Text('de $objetivo ml', style: const TextStyle(color: azulOscuro)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          cumplido ? '¡Objetivo cumplido!' : 'Te faltan ${objetivo - bebido} ml',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: cumplido ? Colors.green.shade700 : Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}

class BotonesBebida extends StatelessWidget {
  final ValueChanged<int> onBeber;
  const BotonesBebida({
    super.key, 
    required this.onBeber
  });

  @override
  Widget build(BuildContext context) {
    final estilo = FilledButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: azulOscuro,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            style: estilo,
            onPressed: () {
              onBeber(250);
            }, // ✏️
            child: const Column(
              children: [
                Icon(Icons.local_drink, size: 32),
                SizedBox(height: 4),
                Text('Vaso · 250 ml'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FilledButton(
            style: estilo,
            onPressed: () {}, // ✏️
            child: const Column(
              children: [
                Icon(Icons.water_drop, size: 32),
                SizedBox(height: 4),
                Text('Botella · 500 ml'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AjusteObjetivo extends StatelessWidget {
  const AjusteObjetivo({super.key});

  @override
  Widget build(BuildContext context) {
    // ✏️
    const objetivo = 2000;
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            const Icon(Icons.flag, color: azulOscuro),
            const SizedBox(width: 8),
            const Expanded(child: Text('Objetivo diario')),
            IconButton(
              onPressed: () {}, // ✏️
              icon: const Icon(Icons.remove),
            ),
            Text(
              '$objetivo ml',
              style: const TextStyle(fontWeight: FontWeight.bold, color: azulOscuro),
            ),
            IconButton(
              onPressed: () {}, // ✏️
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class BotonNuevoDia extends StatelessWidget {
  final VoidCallback onResetear;

  const BotonNuevoDia({
    super.key,
    required this.onResetear
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onResetear, // ✏️
      icon: const Icon(Icons.refresh),
      label: const Text('Empezar un nuevo día'),
    );
  }
}

//* Código original
/*
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorSchemeSeed: Colors.blue),
    home: const PantallaAgua(),
  ),
);

const azulOscuro = Color(0xFF0D47A1);
const azulAgua = Color(0xFF4FC3F7);

class PantallaAgua extends StatefulWidget {
  const PantallaAgua({super.key});

  @override
  State<PantallaAgua> createState() => _PantallaAguaState();
}

class _PantallaAguaState extends State<PantallaAgua> {
  int bebido = 0;
  int objetivo = 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4FB),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 48, 20, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Hidrátate',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: azulOscuro),
            ),
            const Text('Lo que llevas bebido hoy', style: TextStyle(color: Colors.blueGrey)),
            // ✏️
            const Expanded(child: Center(child: Vaso())),
            const BotonesBebida(),
            const SizedBox(height: 12),
            const AjusteObjetivo(),
            const SizedBox(height: 8),
            const BotonNuevoDia(),
          ],
        ),
      ),
    );
  }
}

class Vaso extends StatelessWidget {
  const Vaso({super.key});

  @override
  Widget build(BuildContext context) {
    // ✏️
    const bebido = 0;
    const objetivo = 2000;
    final cumplido = bebido >= objetivo;
    final alturaAgua = cumplido ? 212.0 : 212 * bebido / objetivo;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 150,
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFF90CAF9), width: 4),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(8),
              bottom: Radius.circular(40),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(4),
              bottom: Radius.circular(36),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(height: alturaAgua, color: azulAgua),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$bebido ml',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: azulOscuro,
                        ),
                      ),
                      Text('de $objetivo ml', style: const TextStyle(color: azulOscuro)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          cumplido ? '¡Objetivo cumplido!' : 'Te faltan ${objetivo - bebido} ml',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: cumplido ? Colors.green.shade700 : Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}

class BotonesBebida extends StatelessWidget {
  const BotonesBebida({super.key});

  @override
  Widget build(BuildContext context) {
    final estilo = FilledButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: azulOscuro,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            style: estilo,
            onPressed: () {}, // ✏️
            child: const Column(
              children: [
                Icon(Icons.local_drink, size: 32),
                SizedBox(height: 4),
                Text('Vaso · 250 ml'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FilledButton(
            style: estilo,
            onPressed: () {}, // ✏️
            child: const Column(
              children: [
                Icon(Icons.water_drop, size: 32),
                SizedBox(height: 4),
                Text('Botella · 500 ml'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AjusteObjetivo extends StatelessWidget {
  const AjusteObjetivo({super.key});

  @override
  Widget build(BuildContext context) {
    // ✏️
    const objetivo = 2000;
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            const Icon(Icons.flag, color: azulOscuro),
            const SizedBox(width: 8),
            const Expanded(child: Text('Objetivo diario')),
            IconButton(
              onPressed: () {}, // ✏️
              icon: const Icon(Icons.remove),
            ),
            Text(
              '$objetivo ml',
              style: const TextStyle(fontWeight: FontWeight.bold, color: azulOscuro),
            ),
            IconButton(
              onPressed: () {}, // ✏️
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class BotonNuevoDia extends StatelessWidget {
  const BotonNuevoDia({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {}, // ✏️
      icon: const Icon(Icons.refresh),
      label: const Text('Empezar un nuevo día'),
    );
  }
}
*/